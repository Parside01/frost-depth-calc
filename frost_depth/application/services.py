from frost_depth.domain.calculation import FrostDepthCalculator
from frost_depth.domain.models import CalculationInput, CalculationResult, Settlement
from frost_depth.infrastructure.repositories import ReferenceRepository


class CalculationService:
    def __init__(self, references: ReferenceRepository, calculator: FrostDepthCalculator | None = None) -> None:
        self._references = references
        self._calculator = calculator or FrostDepthCalculator()

    def calculate_by_values(
        self,
        settlement: Settlement,
        soil_id: int,
        construction: str,
        temperature_label: str,
    ) -> CalculationResult:
        soil = self._references.get_soil_type(soil_id)
        coefficient = self._references.get_building_coefficient_by_values(construction, temperature_label)
        if soil is None:
            raise ValueError("Не выбран тип грунта")
        if coefficient is None:
            raise ValueError("Не найден коэффициент для выбранной конструкции и температуры")

        return self._calculator.calculate(
            CalculationInput(
                settlement_name=settlement.name,
                annual_temperature=settlement.annual_temperature,
                monthly_temperatures=settlement.monthly_temperatures,
                soil_coefficient=soil.coefficient,
                building_coefficient=coefficient.coefficient,
            )
        )
