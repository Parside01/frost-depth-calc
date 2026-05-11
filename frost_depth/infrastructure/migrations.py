from pathlib import Path

from sqlalchemy import text

from frost_depth.infrastructure.database import Database


MIGRATIONS_DIR = Path(__file__).resolve().parents[2] / "migrations"


def apply_migrations(database: Database, migrations_dir: Path = MIGRATIONS_DIR) -> None:
    with database.engine.begin() as connection:
        connection.execute(
            text(
                """
                CREATE TABLE IF NOT EXISTS schema_migrations (
                    version TEXT PRIMARY KEY,
                    applied_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
                )
                """
            )
        )
        applied = {
            row.version
            for row in connection.execute(text("SELECT version FROM schema_migrations ORDER BY version"))
        }

        for path in sorted(migrations_dir.glob("*.sql")):
            version = path.stem
            if version in applied:
                continue
            sql = path.read_text(encoding="utf-8")
            for statement in _split_sql(sql):
                connection.execute(text(statement))
            connection.execute(text("INSERT INTO schema_migrations(version) VALUES (:version)"), {"version": version})


def _split_sql(sql: str) -> list[str]:
    return [statement.strip() for statement in sql.split(";") if statement.strip()]
