import sys

from PySide6.QtWidgets import QApplication

from frost_depth.bootstrap import create_database
from frost_depth.infrastructure.repositories import ReferenceRepository, SettlementRepository
from frost_depth.ui.main_window import MainWindow


def main() -> int:
    database = create_database()
    settlements = SettlementRepository(database)

    app = QApplication(sys.argv)
    window = MainWindow(settlements, ReferenceRepository(database))
    window.show()
    return app.exec()


if __name__ == "__main__":
    raise SystemExit(main())
