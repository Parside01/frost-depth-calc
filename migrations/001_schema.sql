CREATE TABLE IF NOT EXISTS countries (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS regions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    country_id INTEGER NOT NULL REFERENCES countries(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    UNIQUE(country_id, name)
);

CREATE TABLE IF NOT EXISTS settlements (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    region_id INTEGER NOT NULL REFERENCES regions(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    latitude REAL NOT NULL DEFAULT 0,
    longitude REAL NOT NULL DEFAULT 0,
    month_01 REAL NOT NULL,
    month_02 REAL NOT NULL,
    month_03 REAL NOT NULL,
    month_04 REAL NOT NULL,
    month_05 REAL NOT NULL,
    month_06 REAL NOT NULL,
    month_07 REAL NOT NULL,
    month_08 REAL NOT NULL,
    month_09 REAL NOT NULL,
    month_10 REAL NOT NULL,
    month_11 REAL NOT NULL,
    month_12 REAL NOT NULL,
    annual_temperature REAL NOT NULL,
    UNIQUE(region_id, name)
);

CREATE TABLE IF NOT EXISTS soil_types (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    coefficient REAL NOT NULL CHECK(coefficient > 0)
);

CREATE TABLE IF NOT EXISTS building_coefficients (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    building_type TEXT NOT NULL,
    temperature_label TEXT NOT NULL,
    coefficient REAL NOT NULL CHECK(coefficient > 0),
    UNIQUE(building_type, temperature_label)
);
