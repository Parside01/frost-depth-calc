import json
from pathlib import Path

from PySide6.QtCore import QObject, QUrl, Signal, Slot
from PySide6.QtWebEngineCore import QWebEngineSettings
from PySide6.QtWebChannel import QWebChannel
from PySide6.QtWebEngineWidgets import QWebEngineView

from frost_depth.domain.models import Settlement


class MapBridge(QObject):
    pointSelected = Signal(float, float)

    @Slot(float, float)
    def selectPoint(self, latitude: float, longitude: float) -> None:
        self.pointSelected.emit(latitude, longitude)


class SettlementMap(QWebEngineView):
    pointSelected = Signal(float, float)
    NEARBY_LIMIT = 3
    _ASSETS_DIR = Path(__file__).resolve().parent / "map_assets"
    _HTML_TEMPLATE = _ASSETS_DIR / "index.html"

    def __init__(self) -> None:
        super().__init__()
        self._html_loaded = False
        self._bridge = MapBridge()
        self._bridge.pointSelected.connect(self.pointSelected)

        self._channel = QWebChannel(self.page())
        self._channel.registerObject("bridge", self._bridge)
        self.page().setWebChannel(self._channel)
        self.settings().setAttribute(QWebEngineSettings.WebAttribute.LocalContentCanAccessRemoteUrls, True)
        self.loadFinished.connect(self._mark_html_loaded)
        self.setMinimumHeight(330)

    @Slot(bool)
    def _mark_html_loaded(self, ok: bool) -> None:
        self._html_loaded = ok

    def set_settlements(self, settlements: list[Settlement]) -> None:
        nearby = settlements[: self.NEARBY_LIMIT]
        center = self._center(nearby)
        self.set_nearby_settlements(center[0], center[1], nearby)

    def set_nearby_settlements(
        self,
        latitude: float,
        longitude: float,
        settlements: list[Settlement],
        adjust_view: bool = True,
    ) -> None:
        points = [
            {
                "name": settlement.name,
                "region": settlement.region,
                "country": settlement.country,
                "latitude": settlement.latitude,
                "longitude": settlement.longitude,
            }
            for settlement in settlements[: self.NEARBY_LIMIT]
        ]
        payload = json.dumps(points, ensure_ascii=False)
        if not self._html_loaded:
            self.setHtml(
                self._html(latitude, longitude, payload),
                QUrl.fromLocalFile(str(self._ASSETS_DIR) + "/"),
            )
            return

        self.page().runJavaScript(
            f"window.updateNearbySettlements({payload}, {latitude}, {longitude}, {str(adjust_view).lower()});"
        )

    @staticmethod
    def _center(settlements: list[Settlement]) -> tuple[float, float]:
        if not settlements:
            return 55.7512, 37.6184
        latitude = sum(settlement.latitude for settlement in settlements) / len(settlements)
        longitude = sum(settlement.longitude for settlement in settlements) / len(settlements)
        return latitude, longitude

    def _html(self, latitude: float, longitude: float, points: str) -> str:
        return (
            self._HTML_TEMPLATE.read_text(encoding="utf-8")
            .replace("__INITIAL_LATITUDE__", str(latitude))
            .replace("__INITIAL_LONGITUDE__", str(longitude))
            .replace("__INITIAL_POINTS__", points)
        )
