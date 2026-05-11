from dataclasses import dataclass


MONTH_NAMES = ("I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XII")


@dataclass(frozen=True)
class Settlement:
    id: int
    country: str
    region: str
    name: str
    monthly_temperatures: list[float]
    annual_temperature: float
    latitude: float
    longitude: float


@dataclass(frozen=True)
class SoilType:
    id: int
    name: str
    coefficient: float


@dataclass(frozen=True)
class BuildingCoefficient:
    id: int
    building_type: str
    temperature_label: str
    coefficient: float

    @property
    def display_name(self) -> str:
        return f"{self.building_type}, {self.temperature_label} ({self.coefficient:g})"


@dataclass(frozen=True)
class CalculationInput:
    settlement_name: str
    annual_temperature: float
    monthly_temperatures: list[float]
    soil_coefficient: float
    building_coefficient: float


@dataclass(frozen=True)
class CalculationResult:
    settlement_name: str
    annual_temperature: float
    freezing_index: float
    soil_coefficient: float
    building_coefficient: float
    normative_depth: float
    design_depth: float
