from pathlib import Path

from sqlalchemy import create_engine, event
from sqlalchemy.engine import Engine
from sqlalchemy.pool import StaticPool


class Database:
    def __init__(self, path: str | Path) -> None:
        self.path = str(path)
        self.engine = self._create_engine()

    def _create_engine(self) -> Engine:
        if self.path == ":memory:":
            engine = create_engine(
                "sqlite+pysqlite://",
                future=True,
                poolclass=StaticPool,
                connect_args={"check_same_thread": False},
            )
        else:
            engine = create_engine(f"sqlite+pysqlite:///{self.path}", future=True)

        @event.listens_for(engine, "connect")
        def _enable_foreign_keys(dbapi_connection, _connection_record) -> None:  # type: ignore[no-untyped-def]
            dbapi_connection.execute("PRAGMA foreign_keys = ON")

        return engine
