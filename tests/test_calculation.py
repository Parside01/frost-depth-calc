import unittest

from frost_depth.domain.calculation import FrostDepthCalculator
from frost_depth.domain.models import CalculationInput


class FrostDepthCalculatorTest(unittest.TestCase):
    def test_calculates_normative_and_design_depth(self) -> None:
        calculator = FrostDepthCalculator()

        result = calculator.calculate(
            CalculationInput(
                settlement_name="Test city",
                annual_temperature=7.6,
                monthly_temperatures=[-3.7, -2.3, 1.4, 7.5, 12.1, 15.0, 17.6, 17.7, 14.2, 8.9, 3.9, -1.1],
                soil_coefficient=0.28,
                building_coefficient=0.8,
            )
        )

        self.assertEqual(result.freezing_index, 7.1)
        self.assertEqual(result.normative_depth, 0.75)
        self.assertEqual(result.design_depth, 0.60)

    def test_uses_negative_months_only_for_freezing_index(self) -> None:
        calculator = FrostDepthCalculator()

        result = calculator.calculate(
            CalculationInput(
                settlement_name="Mixed temperatures",
                annual_temperature=0.0,
                monthly_temperatures=[-10.0, 5.0, -2.5, 0.0, 1.0, -0.5, 2.0, 4.0, 3.0, -1.0, 0.5, 6.0],
                soil_coefficient=0.30,
                building_coefficient=1.0,
            )
        )

        self.assertEqual(result.freezing_index, 14.0)
        self.assertEqual(result.normative_depth, 1.12)
        self.assertEqual(result.design_depth, 1.12)


if __name__ == "__main__":
    unittest.main()
