from sqlalchemy import RowMapping, func, select

from frost_depth.domain.models import BuildingCoefficient, Settlement, SoilType
from frost_depth.infrastructure.database import Database
from frost_depth.infrastructure.schema import (
    MONTH_COLUMNS,
    building_coefficients,
    countries,
    regions,
    settlements,
    soil_types,
)


class SettlementRepository:
    def __init__(self, database: Database) -> None:
        self._database = database

    def list_countries(self) -> list[str]:
        stmt = select(countries.c.name).order_by(countries.c.name)
        with self._database.engine.connect() as connection:
            return [str(row.name) for row in connection.execute(stmt)]

    def list_regions(self, country: str) -> list[str]:
        stmt = (
            select(regions.c.name)
            .join(countries, countries.c.id == regions.c.country_id)
            .where(countries.c.name == country)
            .order_by(regions.c.name)
        )
        with self._database.engine.connect() as connection:
            return [str(row.name) for row in connection.execute(stmt)]

    def list_settlements(self, country: str | None = None, region: str | None = None) -> list[Settlement]:
        stmt = self._settlement_select()
        if country:
            stmt = stmt.where(countries.c.name == country)
        if region:
            stmt = stmt.where(regions.c.name == region)
        stmt = stmt.order_by(countries.c.name, regions.c.name, settlements.c.name)

        with self._database.engine.connect() as connection:
            rows = connection.execute(stmt).mappings().all()
        return [self._to_settlement(row) for row in rows]

    def get(self, settlement_id: int) -> Settlement | None:
        stmt = self._settlement_select().where(settlements.c.id == settlement_id)
        with self._database.engine.connect() as connection:
            row = connection.execute(stmt).mappings().one_or_none()
        return self._to_settlement(row) if row else None

    def find_nearest(self, latitude: float, longitude: float) -> Settlement | None:
        nearest = self.list_nearest(latitude, longitude, limit=1)
        return nearest[0] if nearest else None

    def list_nearest(self, latitude: float, longitude: float, limit: int = 12) -> list[Settlement]:
        distance = self._distance_expression(latitude, longitude).label("distance")
        stmt = self._settlement_select().add_columns(distance).order_by(distance).limit(limit)
        with self._database.engine.connect() as connection:
            rows = connection.execute(stmt).mappings().all()
        return [self._to_settlement(row) for row in rows]

    @staticmethod
    def _distance_expression(latitude: float, longitude: float):
        return (
            func.pow(settlements.c.latitude - latitude, 2)
            + func.pow(settlements.c.longitude - longitude, 2)
        )

    @staticmethod
    def _settlement_select():
        return (
            select(
                settlements.c.id,
                countries.c.name.label("country"),
                regions.c.name.label("region"),
                settlements.c.name,
                settlements.c.latitude,
                settlements.c.longitude,
                *MONTH_COLUMNS,
                settlements.c.annual_temperature,
            )
            .join(regions, regions.c.id == settlements.c.region_id)
            .join(countries, countries.c.id == regions.c.country_id)
        )

    @staticmethod
    def _to_settlement(row: RowMapping) -> Settlement:
        return Settlement(
            id=int(row["id"]),
            country=str(row["country"]),
            region=str(row["region"]),
            name=str(row["name"]),
            monthly_temperatures=[float(row[column.name]) for column in MONTH_COLUMNS],
            annual_temperature=float(row["annual_temperature"]),
            latitude=float(row["latitude"]),
            longitude=float(row["longitude"]),
        )


class ReferenceRepository:
    def __init__(self, database: Database) -> None:
        self._database = database

    def list_soil_types(self) -> list[SoilType]:
        stmt = select(soil_types.c.id, soil_types.c.name, soil_types.c.coefficient).order_by(soil_types.c.id)
        with self._database.engine.connect() as connection:
            rows = connection.execute(stmt).mappings().all()
        return [self._to_soil_type(row) for row in rows]

    def get_soil_type(self, soil_id: int) -> SoilType | None:
        stmt = select(soil_types.c.id, soil_types.c.name, soil_types.c.coefficient).where(soil_types.c.id == soil_id)
        with self._database.engine.connect() as connection:
            row = connection.execute(stmt).mappings().one_or_none()
        return self._to_soil_type(row) if row else None

    def list_building_coefficients(self) -> list[BuildingCoefficient]:
        stmt = (
            select(
                building_coefficients.c.id,
                building_coefficients.c.building_type,
                building_coefficients.c.temperature_label,
                building_coefficients.c.coefficient,
            )
            .order_by(building_coefficients.c.building_type, building_coefficients.c.coefficient.desc())
        )
        with self._database.engine.connect() as connection:
            rows = connection.execute(stmt).mappings().all()
        return [self._to_building_coefficient(row) for row in rows]

    def list_building_constructions(self) -> list[str]:
        stmt = select(building_coefficients.c.building_type).distinct().order_by(building_coefficients.c.id)
        with self._database.engine.connect() as connection:
            return [str(row.building_type) for row in connection.execute(stmt)]

    def list_temperature_ranges(self, construction: str) -> list[str]:
        stmt = (
            select(building_coefficients.c.temperature_label)
            .where(building_coefficients.c.building_type == construction)
            .order_by(building_coefficients.c.id)
        )
        with self._database.engine.connect() as connection:
            return [str(row.temperature_label) for row in connection.execute(stmt)]

    def get_building_coefficient(self, coefficient_id: int) -> BuildingCoefficient | None:
        stmt = self._building_coefficient_select().where(building_coefficients.c.id == coefficient_id)
        with self._database.engine.connect() as connection:
            row = connection.execute(stmt).mappings().one_or_none()
        return self._to_building_coefficient(row) if row else None

    def get_building_coefficient_by_values(
        self,
        construction: str,
        temperature_label: str,
    ) -> BuildingCoefficient | None:
        stmt = self._building_coefficient_select().where(
            building_coefficients.c.building_type == construction,
            building_coefficients.c.temperature_label == temperature_label,
        )
        with self._database.engine.connect() as connection:
            row = connection.execute(stmt).mappings().one_or_none()
        return self._to_building_coefficient(row) if row else None

    @staticmethod
    def _building_coefficient_select():
        return select(
            building_coefficients.c.id,
            building_coefficients.c.building_type,
            building_coefficients.c.temperature_label,
            building_coefficients.c.coefficient,
        )

    @staticmethod
    def _to_soil_type(row: RowMapping) -> SoilType:
        return SoilType(id=int(row["id"]), name=str(row["name"]), coefficient=float(row["coefficient"]))

    @staticmethod
    def _to_building_coefficient(row: RowMapping) -> BuildingCoefficient:
        return BuildingCoefficient(
            id=int(row["id"]),
            building_type=str(row["building_type"]),
            temperature_label=str(row["temperature_label"]),
            coefficient=float(row["coefficient"]),
        )
