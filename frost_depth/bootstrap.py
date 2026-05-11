from pathlib import Path

from frost_depth.infrastructure.database import Database
from frost_depth.infrastructure.migrations import apply_migrations


def create_database(path: str | Path = "data/frost_depth.sqlite3") -> Database:
    database_path = Path(path)
    if database_path != Path(":memory:"):
        database_path.parent.mkdir(parents=True, exist_ok=True)

    database = Database(database_path)
    apply_migrations(database)
    return database
