# Read-only simplification design

## Goal

Simplify the project internals while keeping the current application behavior and file structure.

The project should remain a normal educational PySide6 + SQLite application for submission. The code should be easier to explain to a beginner, but the user-facing flow must stay the same.

## Current constraint

The SQLite database is treated as prepared data. The application reads countries, regions, settlements, soil types, building coefficients, temperatures, and coordinates from the database.

Data changes happen through SQL migrations, not through the application UI or repository write methods.

## Scope

Keep:

- the existing package structure: `domain`, `application`, `infrastructure`, `ui`;
- the current main window flow;
- country, region, and settlement selection;
- construction, indoor temperature, and soil selection;
- frost depth calculation;
- the map and nearest-settlement selection;
- migrations as the database fill/update mechanism.

Remove from runtime code:

- `SettlementRepository.add`;
- `SettlementRepository.update`;
- `SettlementRepository.delete`;
- `SettlementRepository.set_coordinates_by_name`;
- helper methods used only by those write operations;
- tests that only prove repository write/update/delete behavior.

## Architecture

The architecture stays layered:

- `domain` contains plain data classes and calculation logic;
- `application` coordinates calculation use cases;
- `infrastructure` reads reference data from SQLite;
- `ui` shows the form, map, selected temperatures, and calculation result.

The simplification only changes the responsibilities inside `infrastructure`: settlement data access becomes read-only.

## Data Flow

1. `main.py` creates the SQLite database connection and applies migrations.
2. `MainWindow` asks repositories for reference data.
3. `SettlementRepository` lists countries, regions, settlements, and nearest settlements.
4. `ReferenceRepository` lists soil types and building coefficients.
5. `CalculationService` gets the selected coefficient values and calls the calculator.
6. The UI displays the result.

## Error Handling

Keep checks that protect normal user scenarios:

- no selected settlement;
- missing soil type;
- missing building coefficient;
- invalid calculation input length or non-positive coefficients.

Remove checks that only support runtime editing of data, because the application no longer edits reference data.

## Testing

Keep tests for:

- calculation formula behavior;
- read-only repository queries;
- nearest-settlement lookup;
- building coefficient lookup.

Remove or rewrite tests that depend on inserting, updating, or deleting settlements through `SettlementRepository`.

If tests need custom data, they should use SQL setup directly or rely on migrations, because repository writes are no longer part of the public application code.

## Non-goals

This change does not:

- redesign the UI;
- remove the map;
- merge files or packages;
- replace SQLAlchemy;
- change database schema;
- change migration data;
- add a user-facing CRUD interface.
