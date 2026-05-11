import unittest

from frost_depth.infrastructure.database import Database
from frost_depth.infrastructure.migrations import apply_migrations
from frost_depth.infrastructure.repositories import ReferenceRepository, SettlementRepository


class SettlementRepositoryTest(unittest.TestCase):
    def _database(self) -> Database:
        database = Database(":memory:")
        apply_migrations(database)
        return database

    def test_repository_returns_settlements_grouped_by_location(self) -> None:
        database = self._database()
        repository = SettlementRepository(database)

        repository.add(
            country="Тестовая страна",
            region="Тестовая страна",
            name="Тестоград",
            monthly_temperatures=[-3.7, -2.3, 1.4, 7.5, 12.1, 15.0, 17.6, 17.7, 14.2, 8.9, 3.9, -1.1],
            annual_temperature=7.6,
            latitude=1.0,
            longitude=1.0,
        )

        self.assertIn("Тестовая страна", repository.list_countries())
        self.assertEqual(repository.list_regions("Тестовая страна"), ["Тестовая страна"])
        self.assertEqual(
            repository.list_settlements("Тестовая страна", "Тестовая страна")[0].name,
            "Тестоград",
        )

    def test_repository_updates_and_deletes_settlement(self) -> None:
        database = self._database()
        repository = SettlementRepository(database)

        created = repository.add(
            country="Тестовая страна",
            region="Тестовая страна",
            name="Test update city",
            monthly_temperatures=[-0.5, -0.2, 2.3, 8.1, 12.5, 15.9, 18.5, 17.9, 14.2, 9.4, 5.3, 1.7],
            annual_temperature=8.8,
            latitude=39.5111,
            longitude=46.3417,
        )
        repository.update(
            settlement_id=created.id,
            country="Тестовая страна",
            region="Тестовая страна",
            name="Test update city updated",
            monthly_temperatures=[-1.0, -0.2, 2.3, 8.1, 12.5, 15.9, 18.5, 17.9, 14.2, 9.4, 5.3, 1.7],
            annual_temperature=8.7,
            latitude=39.5111,
            longitude=46.3417,
        )

        updated = repository.get(created.id)
        self.assertIsNotNone(updated)
        assert updated is not None
        self.assertEqual(updated.name, "Test update city updated")
        self.assertEqual(updated.monthly_temperatures[0], -1.0)
        self.assertEqual(updated.latitude, 39.5111)

        repository.delete(created.id)
        self.assertIsNone(repository.get(created.id))

    def test_repository_finds_nearest_settlement_by_coordinates(self) -> None:
        database = self._database()
        repository = SettlementRepository(database)

        repository.add(
            country="Тестовая страна",
            region="Тестовая страна",
            name="Тестоград",
            monthly_temperatures=[-3.7, -2.3, 1.4, 7.5, 12.1, 15.0, 17.6, 17.7, 14.2, 8.9, 3.9, -1.1],
            annual_temperature=7.6,
            latitude=40.8128,
            longitude=44.4883,
        )
        repository.add(
            country="Тестовая страна",
            region="Тестовая страна",
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
