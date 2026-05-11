from typing import Any

from PySide6.QtCore import Qt
from PySide6.QtWidgets import (
    QAbstractItemView,
    QComboBox,
    QFrame,
    QGridLayout,
    QGroupBox,
    QHeaderView,
    QLabel,
    QMainWindow,
    QMessageBox,
    QPushButton,
    QScrollArea,
    QTableWidget,
    QTableWidgetItem,
    QVBoxLayout,
    QWidget,
)

from frost_depth.application.services import CalculationService
from frost_depth.domain.models import MONTH_NAMES, Settlement
from frost_depth.infrastructure.repositories import ReferenceRepository, SettlementRepository
from frost_depth.ui.map_widget import SettlementMap


PAGE_MARGIN = 16
SECTION_SPACING = 12
FIELD_SPACING = 6
GROUP_MARGIN = 12
GROUP_TOP_MARGIN = 18
GROUP_SPACING = 10
RESULT_HORIZONTAL_SPACING = 12
CONTROL_HEIGHT = 38
BUTTON_HEIGHT = 42
MAP_HEIGHT = 330
TEMPERATURE_TABLE_HEIGHT = 118
NEARBY_SETTLEMENT_LIMIT = 3


class MainWindow(QMainWindow):
    def __init__(self, settlements: SettlementRepository, references: ReferenceRepository) -> None:
        super().__init__()
        self.setWindowTitle("Расчет глубины промерзания грунта")
        self.resize(760, 820)

        self._settlements = settlements
        self._references = references
        self._calculation_service = CalculationService(references)
        self._settlement_by_id: dict[int, Settlement] = {}
        self._selecting_from_map = False

        self._country_box = QComboBox()
        self._region_box = QComboBox()
        self._settlement_box = QComboBox()
        self._construction_box = QComboBox()
        self._temperature_box = QComboBox()
        self._soil_box = QComboBox()
        self._monthly_table = QTableWidget(2, 12)
        self._map = SettlementMap()
        self._map_status = QLabel("Кликните по карте, чтобы выбрать ближайший населенный пункт")
        self._result_labels = {
            "freezing_index": QLabel("-"),
            "building": QLabel("-"),
            "soil": QLabel("-"),
            "design": QLabel("-"),
            "normative": QLabel("-"),
        }

        self._build_layout()
        self._connect_signals()
        self._load_data()

    def _build_layout(self) -> None:
        content = QWidget()
        layout = QVBoxLayout(content)
        layout.setContentsMargins(PAGE_MARGIN, PAGE_MARGIN, PAGE_MARGIN, PAGE_MARGIN)
        layout.setSpacing(SECTION_SPACING)

        title = QLabel("Глубина промерзания грунта")
        title.setObjectName("title")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(title)

        layout.addWidget(self._field("Страна", self._country_box))
        layout.addWidget(self._field("Область", self._region_box))
        layout.addWidget(self._field("Населенный пункт", self._settlement_box))
        layout.addWidget(self._field("Конструкция и особенности строения", self._construction_box))
        layout.addWidget(self._field("Температура внутри помещения", self._temperature_box))
        layout.addWidget(self._field("Вид грунта", self._soil_box))
        layout.addWidget(self._build_map_group())

        calculate_button = QPushButton("Рассчитать")
        calculate_button.setMinimumHeight(BUTTON_HEIGHT)
        calculate_button.clicked.connect(self._calculate)
        layout.addWidget(calculate_button)

        layout.addWidget(self._build_result_group())
        layout.addWidget(self._build_temperature_group())
        layout.addStretch()

        scroll = QScrollArea()
        scroll.setWidgetResizable(True)
        scroll.setWidget(content)
        self.setCentralWidget(scroll)
        self.setStyleSheet(
            """
            QLabel#title {
                font-size: 22px;
                font-weight: 600;
                margin-bottom: 8px;
            }
            QGroupBox {
                font-weight: 600;
                border: 1px solid palette(mid);
                border-radius: 12px;
                margin-top: 14px;
                padding-top: 4px;
            }
            QGroupBox::title {
                subcontrol-origin: margin;
                subcontrol-position: top left;
                left: 12px;
                padding: 0 6px;
                background-color: palette(window);
            }
            QComboBox, QPushButton {
                font-size: 15px;
            }
            """
        )

    def _field(self, label_text: str, widget: QComboBox) -> QWidget:
        container = QWidget()
        layout = QVBoxLayout(container)
        layout.setContentsMargins(0, 0, 0, 0)
        layout.setSpacing(FIELD_SPACING)
        label = QLabel(label_text)
        widget.setMinimumHeight(CONTROL_HEIGHT)
        layout.addWidget(label)
        layout.addWidget(widget)
        return container

    def _build_result_group(self) -> QGroupBox:
        group = QGroupBox("Результаты расчета коэффициентов и глубины промерзания грунта")
        layout = QGridLayout(group)
        layout.setContentsMargins(GROUP_MARGIN, GROUP_TOP_MARGIN, GROUP_MARGIN, GROUP_MARGIN)
        layout.setHorizontalSpacing(RESULT_HORIZONTAL_SPACING)
        layout.setVerticalSpacing(GROUP_SPACING)
        rows = (
            ("Сумма отрицательных температур", "freezing_index", ""),
            ("Коэффициент выбранного помещения", "building", ""),
            ("Коэффициент выбранного грунта", "soil", ""),
            ("Расчетная глубина промерзания грунта", "design", "м"),
            ("Нормативная глубина промерзания грунта", "normative", "м"),
        )
        for row_index, (title, key, unit) in enumerate(rows):
            value_label = self._result_labels[key]
            value_label.setAlignment(Qt.AlignmentFlag.AlignRight | Qt.AlignmentFlag.AlignVCenter)
            value_label.setFrameShape(QFrame.Shape.Panel)
            value_label.setMinimumWidth(120)
            layout.addWidget(QLabel(title), row_index, 0)
            layout.addWidget(value_label, row_index, 1)
            layout.addWidget(QLabel(unit), row_index, 2)
        return group

    def _build_map_group(self) -> QGroupBox:
        group = QGroupBox("Выбор населенного пункта на карте")
        layout = QVBoxLayout(group)
        layout.setContentsMargins(GROUP_MARGIN, GROUP_TOP_MARGIN, GROUP_MARGIN, GROUP_MARGIN)
        layout.setSpacing(GROUP_SPACING)
        self._map.setMinimumHeight(MAP_HEIGHT)
        self._map_status.setWordWrap(True)
        layout.addWidget(self._map)
        layout.addWidget(self._map_status)
        return group

    def _build_temperature_group(self) -> QGroupBox:
        group = QGroupBox("Температуры выбранного населенного пункта")
        layout = QVBoxLayout(group)
        layout.setContentsMargins(GROUP_MARGIN, GROUP_TOP_MARGIN, GROUP_MARGIN, GROUP_MARGIN)
        layout.setSpacing(GROUP_SPACING)
        self._monthly_table.setHorizontalHeaderLabels(MONTH_NAMES)
        self._monthly_table.setVerticalHeaderLabels(("Месяц", "Температура, °C"))
        self._monthly_table.verticalHeader().setSectionResizeMode(QHeaderView.ResizeMode.ResizeToContents)
        self._monthly_table.horizontalHeader().setSectionResizeMode(QHeaderView.ResizeMode.Stretch)
        self._monthly_table.setEditTriggers(QAbstractItemView.EditTrigger.NoEditTriggers)
        self._monthly_table.setMaximumHeight(TEMPERATURE_TABLE_HEIGHT)
        layout.addWidget(self._monthly_table)
        return group

    def _connect_signals(self) -> None:
        self._country_box.currentTextChanged.connect(self._load_regions)
        self._region_box.currentTextChanged.connect(self._load_settlements)
        self._settlement_box.currentIndexChanged.connect(self._show_selected_temperatures)
        self._construction_box.currentTextChanged.connect(self._load_temperatures)
        self._map.pointSelected.connect(self._select_nearest_settlement)

    def _load_data(self) -> None:
        self._load_locations()
        self._load_constructions()
        self._load_soils()
        self._update_map_for_selected_settlement()

    def _load_locations(self) -> None:
        current_country = self._country_box.currentText()
        self._country_box.blockSignals(True)
        self._country_box.clear()
        self._country_box.addItems(self._settlements.list_countries())
        self._country_box.blockSignals(False)
        self._set_combo_text(self._country_box, current_country)
        self._load_regions()

    def _load_regions(self) -> None:
        current_region = self._region_box.currentText()
        self._region_box.blockSignals(True)
        self._region_box.clear()
        self._region_box.addItems(self._settlements.list_regions(self._country_box.currentText()))
        self._region_box.blockSignals(False)
        self._set_combo_text(self._region_box, current_region)
        self._load_settlements()

    def _load_settlements(self) -> None:
        self._settlement_by_id.clear()
        current_id = self._settlement_box.currentData()
        self._settlement_box.blockSignals(True)
        self._settlement_box.clear()
        for settlement in self._settlements.list_settlements(self._country_box.currentText(), self._region_box.currentText()):
            self._settlement_by_id[settlement.id] = settlement
            self._settlement_box.addItem(settlement.name, settlement.id)
        self._settlement_box.blockSignals(False)
        self._set_combo_data(self._settlement_box, current_id)
        self._show_selected_temperatures()

    def _load_constructions(self) -> None:
        current_construction = self._construction_box.currentText()
        self._construction_box.blockSignals(True)
        self._construction_box.clear()
        self._construction_box.addItems(self._references.list_building_constructions())
        self._construction_box.blockSignals(False)
        self._set_combo_text(self._construction_box, current_construction)
        self._load_temperatures()

    def _load_temperatures(self) -> None:
        current_temperature = self._temperature_box.currentText()
        self._temperature_box.clear()
        self._temperature_box.addItems(self._references.list_temperature_ranges(self._construction_box.currentText()))
        self._set_combo_text(self._temperature_box, current_temperature)

    def _load_soils(self) -> None:
        current_soil = self._soil_box.currentData()
        self._soil_box.clear()
        for soil in self._references.list_soil_types():
            self._soil_box.addItem(soil.name, soil.id)
        self._set_combo_data(self._soil_box, current_soil)

    def _show_selected_temperatures(self) -> None:
        settlement = self._selected_settlement()
        for column, month in enumerate(MONTH_NAMES):
            self._monthly_table.setItem(0, column, QTableWidgetItem(month))
            value = "" if settlement is None else f"{settlement.monthly_temperatures[column]:.1f}"
            self._monthly_table.setItem(1, column, QTableWidgetItem(value))
        self._update_map_for_selected_settlement()

    def _calculate(self) -> None:
        settlement = self._selected_settlement()
        if settlement is None:
            QMessageBox.warning(self, "Нет данных", "Выберите населенный пункт")
            return

        try:
            result = self._calculation_service.calculate_by_values(
                settlement=settlement,
                soil_id=int(self._soil_box.currentData()),
                construction=self._construction_box.currentText(),
                temperature_label=self._temperature_box.currentText(),
            )
        except ValueError as error:
            QMessageBox.warning(self, "Ошибка расчета", str(error))
            return

        self._result_labels["freezing_index"].setText(f"{result.freezing_index:.2f}")
        self._result_labels["building"].setText(f"{result.building_coefficient:.2f}")
        self._result_labels["soil"].setText(f"{result.soil_coefficient:.2f}")
        self._result_labels["design"].setText(f"{result.design_depth:.2f}")
        self._result_labels["normative"].setText(f"{result.normative_depth:.2f}")

    def _select_nearest_settlement(self, latitude: float, longitude: float) -> None:
        nearby = self._settlements.list_nearest(latitude, longitude, limit=NEARBY_SETTLEMENT_LIMIT)
        if not nearby:
            self._map_status.setText("В базе нет населенных пунктов с координатами")
            return

        settlement = nearby[0]
        self._selecting_from_map = True
        try:
            self._set_combo_text(self._country_box, settlement.country)
            self._load_regions()
            self._set_combo_text(self._region_box, settlement.region)
            self._load_settlements()
            self._set_combo_data(self._settlement_box, settlement.id)
        finally:
            self._selecting_from_map = False
        self._map.set_nearby_settlements(latitude, longitude, nearby, adjust_view=False)
        self._map_status.setText(
            f"Выбран ближайший пункт: {settlement.name} "
            f"({settlement.latitude:.4f}, {settlement.longitude:.4f})"
        )

    def _update_map_for_selected_settlement(self) -> None:
        settlement = self._selected_settlement()
        if settlement is None:
            return

        nearby = self._settlements.list_nearest(
            settlement.latitude,
            settlement.longitude,
            limit=NEARBY_SETTLEMENT_LIMIT,
        )
        self._map.set_nearby_settlements(
            settlement.latitude,
            settlement.longitude,
            nearby,
            adjust_view=not self._selecting_from_map,
        )

    def _selected_settlement(self) -> Settlement | None:
        settlement_id = self._settlement_box.currentData()
        return self._settlement_by_id.get(int(settlement_id)) if settlement_id is not None else None

    @staticmethod
    def _set_combo_text(combo: QComboBox, text: str) -> None:
        index = combo.findText(text)
        if index >= 0:
            combo.setCurrentIndex(index)
        elif combo.count() > 0:
            combo.setCurrentIndex(0)

    @staticmethod
    def _set_combo_data(combo: QComboBox, data: Any) -> None:
        index = combo.findData(data)
        if index >= 0:
            combo.setCurrentIndex(index)
        elif combo.count() > 0:
            combo.setCurrentIndex(0)
