from collections.abc import Sequence

from sqlalchemy import RowMapping, delete, func, insert, select, update
from sqlalchemy.exc import IntegrityError

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

    def add(
        self,
        country: str,
        region: str,
        name: str,
        monthly_temperatures: Sequence[float],
        annual_temperature: float,
        latitude: float,
        longitude: float,
    ) -> Settlement:
        self._validate_required(country, region, name)
        self._validate_months(monthly_temperatures)

        with self._database.engine.begin() as connection:
            region_id = self._ensure_region(connection, country.strip(), region.strip())
            values = self._settlement_values(region_id, name.strip(), monthly_temperatures, annual_temperature, latitude, longitude)
            try:
                result = connection.execute(insert(settlements).values(**values))
            except IntegrityError as error:
                raise ValueError("Такой населенный пункт уже есть в выбранном регионе") from error

        settlement = self.get(int(result.inserted_primary_key[0]))
        if settlement is None:
            raise RuntimeError("Не удалось прочитать созданный населенный пункт")
        return settlement

    def update(
        self,
        settlement_id: int,
        country: str,
        region: str,
        name: str,
        monthly_temperatures: Sequence[float],
        annual_temperature: float,
        latitude: float,
        longitude: float,
    ) -> None:
        self._validate_required(country, region, name)
        self._validate_months(monthly_temperatures)

        with self._database.engine.begin() as connection:
            region_id = self._ensure_region(connection, country.strip(), region.strip())
            values = self._settlement_values(region_id, name.strip(), monthly_temperatures, annual_temperature, latitude, longitude)
            try:
                connection.execute(update(settlements).where(settlements.c.id == settlement_id).values(**values))
            except IntegrityError as error:
                raise ValueError("Такой населенный пункт уже есть в выбранном регионе") from error

    def delete(self, settlement_id: int) -> None:
        with self._database.engine.begin() as connection:
            connection.execute(delete(settlements).where(settlements.c.id == settlement_id))

    def set_coordinates_by_name(self, country: str, region: str, name: str, latitude: float, longitude: float) -> None:
        stmt = (
            update(settlements)
            .where(
                settlements.c.name == name,
                settlements.c.region_id.in_(
                    select(regions.c.id)
                    .join(countries, countries.c.id == regions.c.country_id)
                    .where(countries.c.name == country, regions.c.name == region)
                ),
            )
            .values(latitude=latitude, longitude=longitude)
        )
        with self._database.engine.begin() as connection:
            connection.execute(stmt)

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
    def _settlement_values(
        region_id: int,
        name: str,
        monthly_temperatures: Sequence[float],
        annual_temperature: float,
        latitude: float,
        longitude: float,
    ) -> dict[str, float | int | str]:
        values: dict[str, float | int | str] = {
            "region_id": region_id,
            "name": name,
            "annual_temperature": annual_temperature,
            "latitude": latitude,
            "longitude": longitude,
        }
        values.update({column.name: float(value) for column, value in zip(MONTH_COLUMNS, monthly_temperatures, strict=True)})
        return values

    @staticmethod
    def _ensure_region(connection, country: str, region: str) -> int:  # type: ignore[no-untyped-def]
        country_id = connection.execute(select(countries.c.id).where(countries.c.name == country)).scalar_one_or_none()
        if country_id is None:
            result = connection.execute(insert(countries).values(name=country))
            country_id = int(result.inserted_primary_key[0])

        region_id = connection.execute(
            select(regions.c.id).where(regions.c.country_id == country_id, regions.c.name == region)
        ).scalar_one_or_none()
        if region_id is None:
            result = connection.execute(insert(regions).values(country_id=country_id, name=region))
            region_id = int(result.inserted_primary_key[0])
        return int(region_id)

    @staticmethod
    def _validate_months(monthly_temperatures: Sequence[float]) -> None:
        if len(monthly_temperatures) != 12:
            raise ValueError("Нужно передать 12 среднемесячных температур")

    @staticmethod
    def _validate_required(country: str, region: str, name: str) -> None:
        if not country.strip():
            raise ValueError("Страна не заполнена")
        if not region.strip():
            raise ValueError("Регион не заполнен")
        if not name.strip():
            raise ValueError("Населенный пункт не заполнен")

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
