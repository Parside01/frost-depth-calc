from math import sqrt

from frost_depth.domain.models import CalculationInput, CalculationResult


class FrostDepthCalculator:
    def calculate(self, data: CalculationInput) -> CalculationResult:
        if len(data.monthly_temperatures) != 12:
            raise ValueError("Расчет требует температуры за 12 месяцев")
        if data.soil_coefficient <= 0:
            raise ValueError("Коэффициент грунта должен быть больше нуля")
        if data.building_coefficient <= 0:
            raise ValueError("Коэффициент здания должен быть больше нуля")

        freezing_index = round(sum(abs(value) for value in data.monthly_temperatures if value < 0), 2)
        normative_depth = round(data.soil_coefficient * sqrt(freezing_index), 2)
        design_depth = round(data.building_coefficient * normative_depth, 2)

        return CalculationResult(
            settlement_name=data.settlement_name,
            annual_temperature=data.annual_temperature,
            freezing_index=freezing_index,
            soil_coefficient=data.soil_coefficient,
            building_coefficient=data.building_coefficient,
            normative_depth=normative_depth,
            design_depth=design_depth,
        )
