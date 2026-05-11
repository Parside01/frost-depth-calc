# Read-only Simplification Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make settlement data access read-only while keeping the current application behavior and file structure.

**Architecture:** The existing layered structure stays in place. `SettlementRepository` keeps only read methods used by the UI and map, while database changes remain the responsibility of migrations. Tests stop depending on repository write methods and use direct SQL setup only where custom test data is needed.

**Tech Stack:** Python 3.11, PySide6, SQLite, SQLAlchemy Core, unittest.

---

## File Structure

- Modify `frost_depth/infrastructure/repositories.py`: remove settlement write methods and write-only helpers; remove unused imports.
- Modify `tests/test_repository.py`: replace write/update/delete tests with read-only tests and direct SQL fixture setup.
- Keep `frost_depth/ui/main_window.py`, `frost_depth/ui/map_widget.py`, `frost_depth/application/services.py`, and database schema unchanged.

---

### Task 1: Convert SettlementRepository To Read-only

**Files:**
- Modify: `frost_depth/infrastructure/repositories.py`
- Test: `tests/test_repository.py`

- [ ] **Step 1: Update repository tests first**

Replace `tests/test_repository.py` with tests that do not call `SettlementRepository.add`, `update`, or `delete`.

```python
import unittest

from sqlalchemy import insert, select

from frost_depth.infrastructure.database import Database
from frost_depth.infrastructure.migrations import apply_migrations
from frost_depth.infrastructure.repositories import ReferenceRepository, SettlementRepository
from frost_depth.infrastructure.schema import countries, regions, settlements


class SettlementRepositoryTest(unittest.TestCase):
    def _database(self) -> Database:
        database = Database(":memory:")
        apply_migrations(database)
        return database

    def _add_settlement(
        self,
        database: Database,
        *,
        country: str,
        region: str,
        name: str,
        latitude: float,
        longitude: float,
        monthly_temperatures: list[float],
        annual_temperature: float,
    ) -> None:
        with database.engine.begin() as connection:
            country_id = connection.execute(select(countries.c.id).where(countries.c.name == country)).scalar_one_or_none()
            if country_id is None:
                country_id = connection.execute(insert(countries).values(name=country)).inserted_primary_key[0]

            region_id = connection.execute(
                select(regions.c.id).where(regions.c.country_id == country_id, regions.c.name == region)
            ).scalar_one_or_none()
            if region_id is None:
                region_id = connection.execute(insert(regions).values(country_id=country_id, name=region)).inserted_primary_key[0]

            values = {
                "region_id": region_id,
                "name": name,
                "latitude": latitude,
                "longitude": longitude,
                "annual_temperature": annual_temperature,
            }
            values.update({f"month_{index:02d}": value for index, value in enumerate(monthly_temperatures, start=1)})
            connection.execute(insert(settlements).values(**values))

    def test_repository_returns_settlements_grouped_by_location(self) -> None:
        database = self._database()
        repository = SettlementRepository(database)

        countries_list = repository.list_countries()
        regions_list = repository.list_regions("Россия")
        settlements_list = repository.list_settlements("Россия", regions_list[0])

        self.assertIn("Россия", countries_list)
        self.assertGreater(len(regions_list), 0)
        self.assertGreater(len(settlements_list), 0)
        self.assertEqual(settlements_list[0].country, "Россия")
        self.assertEqual(settlements_list[0].region, regions_list[0])
        self.assertEqual(len(settlements_list[0].monthly_temperatures), 12)

    def test_repository_gets_settlement_by_id(self) -> None:
        database = self._database()
        repository = SettlementRepository(database)
        settlement = repository.list_settlements()[0]

        found = repository.get(settlement.id)

        self.assertIsNotNone(found)
        assert found is not None
        self.assertEqual(found.id, settlement.id)
        self.assertEqual(found.name, settlement.name)

    def test_repository_finds_nearest_settlement_by_coordinates(self) -> None:
        database = self._database()
        repository = SettlementRepository(database)

        self._add_settlement(
            database,
            country="Тестовая страна",
            region="Тестовый регион",
            name="Дальний тестовый город",
            monthly_temperatures=[-3.7, -2.3, 1.4, 7.5, 12.1, 15.0, 17.6, 17.7, 14.2, 8.9, 3.9, -1.1],
            annual_temperature=7.6,
            latitude=40.8128,
            longitude=44.4883,
        )
        self._add_settlement(
            database,
            country="Тестовая страна",
            region="Тестовый регион",
            name="Ближний тестовый город",
            monthly_temperatures=[-3.4, -0.9, 5.3, 12.4, 17.4, 21.6, 25.5, 25.2, 20.5, 13.5, 6.5, -0.2],
            annual_temperature=12.0,
            latitude=1.2,
            longitude=1.2,
        )

        nearest = repository.find_nearest(latitude=1.19, longitude=1.19)

        self.assertIsNotNone(nearest)
        assert nearest is not None
        self.assertEqual(nearest.name, "Ближний тестовый город")

    def test_reference_repository_resolves_building_coefficient_matrix(self) -> None:
        database = self._database()
        references = ReferenceRepository(database)

        constructions = references.list_building_constructions()
        temperatures = references.list_temperature_ranges("Без подвала, с полами на грунте")
        coefficient = references.get_building_coefficient_by_values(
            "Без подвала, с полами на грунте",
            "5-10",
        )

        self.assertIn("Неотапливаемое помещение", constructions)
        self.assertEqual(temperatures, ["0 и меньше", "0-5", "5-10", "10-15", "15 и больше"])
        self.assertIsNotNone(coefficient)
        assert coefficient is not None
        self.assertEqual(coefficient.coefficient, 0.7)


if __name__ == "__main__":
    unittest.main()
```

- [ ] **Step 2: Run repository tests and confirm the old code still passes**

Run:

```bash
python -m unittest tests/test_repository.py
```

Expected: PASS. This confirms the replacement tests are valid before removing repository write methods.

- [ ] **Step 3: Remove write methods from SettlementRepository**

In `frost_depth/infrastructure/repositories.py`, remove these imports:

```python
from collections.abc import Sequence
from sqlalchemy import delete, insert, update
from sqlalchemy.exc import IntegrityError
```

Change the SQLAlchemy import to:

```python
from sqlalchemy import RowMapping, func, select
```

Delete these methods from `SettlementRepository`:

```python
add
update
delete
set_coordinates_by_name
_settlement_values
_ensure_region
_validate_months
_validate_required
```

Keep these methods:

```python
list_countries
list_regions
list_settlements
get
find_nearest
list_nearest
_distance_expression
_settlement_select
_to_settlement
```

- [ ] **Step 4: Run repository tests**

Run:

```bash
python -m unittest tests/test_repository.py
```

Expected: PASS.

- [ ] **Step 5: Run all tests**

Run:

```bash
python -m unittest discover tests
```

Expected: PASS.

- [ ] **Step 6: Inspect diff**

Run:

```bash
rtk diff
```

Expected: diff only removes runtime write support and updates repository tests.

- [ ] **Step 7: Commit**

Run:

```bash
git add frost_depth/infrastructure/repositories.py tests/test_repository.py docs/superpowers/plans/2026-05-11-read-only-simplification.md
git commit -m "refactor: make settlement repository read-only"
```
