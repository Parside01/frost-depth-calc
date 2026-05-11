INSERT OR IGNORE INTO countries(name) VALUES ('Россия');

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Камчатский край' FROM countries WHERE name = 'Россия';

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Карачаево-Черкесская Республика' FROM countries WHERE name = 'Россия';

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Республика Карелия' FROM countries WHERE name = 'Россия';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Верхне-Пенжино', 0, 0,
       -29.3, -27.4, -22.4, -13.2, 0.3, 10.7,
       13.9, 10.4, 3.1, -9.8, -21.8, -28.7,
       -9.5
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Камчатский край';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Ича', 0, 0,
       -11.8, -11.4, -8.0, -2.6, 2.5, 7.0,
       11.0, 11.9, 9.1, 3.8, -3.1, -8.8,
       0.0
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Камчатский край';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Ключи', 56.32, 160.85,
       -16.0, -13.1, -8.3, -1.8, 5.2, 12.0,
       15.6, 14.1, 9.2, 2.6, -6.1, -13.6,
       0.0
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Камчатский край';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Козыревск', 0, 0,
       -17.9, -14.3, -8.4, -1.1, 6.1, 12.7,
       16.3, 14.2, 8.5, 1.6, -8.1, -16.0,
       -0.5
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Камчатский край';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Мильково', 54.72, 158.62,
       -19.0, -15.7, -9.8, -1.4, 6.1, 12.7,
       16.2, 14.1, 8.5, 1.2, -9.0, -16.9,
       -1.1
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Камчатский край';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Лопатка, мыс', 0, 0,
       -4.5, -5.0, -3.6, -1.1, 1.5, 4.7,
       8.0, 9.8, 8.9, 5.6, 0.8, -2.5,
       1.9
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Камчатский край';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Начики', 0, 0,
       -18.3, -15.5, -10.4, -3.1, 2.7, 8.9,
       12.9, 12.2, 7.5, 1.2, -8.0, -16.1,
       -2.2
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Камчатский край';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'о.Беринга (Никольское)', 55.20, 165.98,
       -3.1, -3.2, -2.4, -0.3, 2.5, 5.7,
       9.2, 11.0, 9.6, 5.5, 1.0, -2.0,
       2.8
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Камчатский край';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Оссора', 59.24, 163.07,
       -14.4, -13.9, -11.1, -5.7, 1.4, 8.4,
       12.7, 12.6, 8.4, 1.4, -6.5, -12.4,
       -1.6
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Камчатский край';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Петропавловск-Камчатский', 53.04, 158.65,
       -6.7, -6.2, -3.7, 0.3, 4.6, 9.5,
       13.0, 13.6, 10.5, 5.3, -0.6, -5.0,
       2.9
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Камчатский край';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Семлячик', 0, 0,
       -6.1, -5.8, -4.0, -0.5, 3.6, 8.1,
       11.8, 12.9, 10.2, 5.3, -1.0, -4.8,
       2.5
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Камчатский край';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Соболево', 54.30, 155.96,
       -13.2, -12.2, -8.3, -2.3, 3.3, 8.4,
       12.1, 12.4, 8.8, 3.4, -4.2, -10.4,
       -0.2
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Камчатский край';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Усть-Воямполка', 0, 0,
       -17.5, -16.3, -12.0, -5.0, 1.8, 7.0,
       10.6, 11.1, 7.6, 1.5, -6.7, -13.7,
       -2.6
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Камчатский край';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Усть-Камчатск', 56.24, 162.48,
       -11.8, -10.9, -7.8, -3.0, 2.0, 7.6,
       11.6, 12.3, 9.0, 3.3, -3.9, -9.6,
       -0.1
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Камчатский край';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Усть-Хайрюзово', 0, 0,
       -13.6, -13.0, -9.4, -3.2, 3.0, 8.2,
       12.0, 12.4, 8.4, 2.7, -4.6, -10.6,
       -0.6
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Камчатский край';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Теберда', 43.45, 41.74,
       -2.7, -1.6, 1.7, 7.1, 11.0, 14.1,
       16.5, 16.1, 12.0, 7.4, 2.6, -1.1,
       6.9
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Карачаево-Черкесская Республика';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Черкесск', 44.22, 42.06,
       -2.7, -1.7, 2.8, 9.9, 14.8, 18.7,
       21.3, 20.9, 16.2, 10.0, 3.8, -0.5,
       9.5
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Карачаево-Черкесская Республика';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Заонежье', 0, 0,
       -11.7, -11.1, -6.4, -0.9, 5.0, 11.6,
       15.4, 13.0, 8.0, 2.0, -3.8, -8.3,
       1.1
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Республика Карелия';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Калевала', 65.20, 31.17,
       -11.9, -11.2, -6.1, -0.4, 6.5, 12.7,
       15.8, 12.9, 7.7, 1.7, -4.3, -8.8,
       1.2
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Республика Карелия';
