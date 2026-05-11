from sqlalchemy import CheckConstraint, Column, Float, ForeignKey, Integer, MetaData, String, Table, UniqueConstraint


metadata = MetaData()

countries = Table(
    "countries",
    metadata,
    Column("id", Integer, primary_key=True),
    Column("name", String, nullable=False, unique=True),
)

regions = Table(
    "regions",
    metadata,
    Column("id", Integer, primary_key=True),
    Column("country_id", ForeignKey("countries.id", ondelete="CASCADE"), nullable=False),
    Column("name", String, nullable=False),
    UniqueConstraint("country_id", "name"),
)

settlements = Table(
    "settlements",
    metadata,
    Column("id", Integer, primary_key=True),
    Column("region_id", ForeignKey("regions.id", ondelete="CASCADE"), nullable=False),
    Column("name", String, nullable=False),
    Column("latitude", Float, nullable=False),
    Column("longitude", Float, nullable=False),
    *(Column(f"month_{index:02d}", Float, nullable=False) for index in range(1, 13)),
    Column("annual_temperature", Float, nullable=False),
    UniqueConstraint("region_id", "name"),
)

soil_types = Table(
    "soil_types",
    metadata,
    Column("id", Integer, primary_key=True),
    Column("name", String, nullable=False, unique=True),
    Column("coefficient", Float, nullable=False),
    CheckConstraint("coefficient > 0"),
)

building_coefficients = Table(
    "building_coefficients",
    metadata,
    Column("id", Integer, primary_key=True),
    Column("building_type", String, nullable=False),
    Column("temperature_label", String, nullable=False),
    Column("coefficient", Float, nullable=False),
    CheckConstraint("coefficient > 0"),
    UniqueConstraint("building_type", "temperature_label"),
)

MONTH_COLUMNS = tuple(settlements.c[f"month_{index:02d}"] for index in range(1, 13))
