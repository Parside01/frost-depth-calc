INSERT OR IGNORE INTO countries(name) VALUES ('Россия');

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Красноярский край' FROM countries WHERE name = 'Россия';

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Республика Крым' FROM countries WHERE name = 'Россия';

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Севастополь' FROM countries WHERE name = 'Россия';

WITH rows(name, lat, lon, m01, m02, m03, m04, m05, m06, m07, m08, m09, m10, m11, m12, annual) AS (
    VALUES
        ('Игарка', 67.47, 86.58, -27.8, -25.6, -18.0, -9.8, -1.0, 10.1, 15.4, 12.2, 5.2, -6.2, -20.1, -24.8, -7.5),
        ('Ирбейское', 0, 0, -20.6, -18.1, -8.6, 1.8, 9.0, 15.6, 17.9, 15.0, 8.2, 0.5, -9.2, -17.3, -0.5),
        ('Канск', 56.20, 95.71, -20.1, -17.6, -8.0, 2.2, 9.5, 16.5, 18.9, 15.8, 8.7, 0.7, -9.0, -17.0, 0.0),
        ('Кислокан', 0, 0, -35.9, -31.0, -18.1, -6.4, 4.0, 13.4, 16.5, 12.4, 4.5, -7.0, -24.5, -33.3, -8.8),
        ('Красноярск', 56.01, 92.87, -15.7, -13.5, -5.6, 2.7, 9.9, 16.4, 18.6, 15.8, 9.1, 1.8, -7.1, -13.1, 1.6),
        ('Минусинск', 53.71, 91.69, -18.0, -15.7, -5.6, 4.4, 11.4, 17.7, 19.8, 17.0, 10.1, 2.4, -6.7, -14.6, 1.9),
        ('Норильск', 69.35, 88.20, -25.2, -24.3, -18.9, -11.8, -3.5, 7.2, 13.2, 10.7, 3.9, -7.4, -19.2, -22.5, -8.2),
        ('Советская Речка', 0, 0, -28.6, -26.7, -18.6, -10.6, -1.6, 10.3, 15.0, 11.5, 4.5, -6.6, -20.5, -25.1, -8.1),
        ('Тура', 64.27, 100.22, -35.2, -30.5, -17.4, -5.9, 3.9, 13.6, 16.9, 12.9, 5.0, -6.5, -23.9, -32.3, -8.3),
        ('Туруханск', 65.80, 87.96, -26.0, -23.2, -15.0, -6.8, 1.5, 11.9, 16.5, 13.0, 5.8, -5.0, -18.5, -23.3, -5.8),
        ('Тутончаны', 0, 0, -31.9, -27.8, -16.1, -5.7, 3.3, 12.9, 16.4, 12.5, 5.2, -5.5, -22.1, -29.1, -7.3),
        ('Хатанга', 71.98, 102.47, -31.8, -31.5, -25.8, -16.4, -5.7, 6.5, 12.5, 9.7, 2.1, -11.5, -24.7, -29.4, -12.2),
        ('Ярцево', 0, 0, -22.6, -19.7, -10.7, -1.9, 6.0, 15.1, 18.4, 14.7, 7.5, -1.4, -12.8, -19.8, -2.3)
)
INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, rows.name, rows.lat, rows.lon,
       rows.m01, rows.m02, rows.m03, rows.m04, rows.m05, rows.m06,
       rows.m07, rows.m08, rows.m09, rows.m10, rows.m11, rows.m12,
       rows.annual
FROM rows
JOIN countries c ON c.name = 'Россия'
JOIN regions r ON r.country_id = c.id AND r.name = 'Красноярский край';

WITH rows(name, lat, lon, m01, m02, m03, m04, m05, m06, m07, m08, m09, m10, m11, m12, annual) AS (
    VALUES
        ('Ай-Петри', 44.45, 34.06, -2.7, -2.6, 0.3, 5.0, 10.4, 14.7, 17.5, 17.5, 12.2, 8.2, 3.6, -1.0, 6.9),
        ('Керчь', 45.36, 36.47, 0.3, 0.7, 4.0, 10.0, 15.7, 20.8, 23.6, 23.3, 18.1, 12.1, 6.5, 2.8, 11.5),
        ('Клепинино', 45.53, 34.18, 0.2, 1.0, 5.3, 10.4, 16.5, 21.6, 24.7, 24.2, 18.1, 12.2, 6.5, 2.0, 11.9),
        ('Симферополь', 44.95, 34.10, 0.2, 0.8, 4.2, 10.2, 15.4, 19.8, 22.4, 22.1, 17.1, 11.3, 6.2, 2.4, 11.0),
        ('Феодосия', 45.03, 35.38, 1.6, 2.0, 5.2, 10.8, 16.5, 21.4, 24.3, 23.9, 18.8, 13.0, 7.7, 4.0, 12.4),
        ('Ялта', 44.50, 34.17, 4.8, 4.8, 7.4, 11.3, 16.7, 22.1, 25.6, 25.8, 20.4, 15.2, 10.2, 6.4, 14.2)
)
INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, rows.name, rows.lat, rows.lon,
       rows.m01, rows.m02, rows.m03, rows.m04, rows.m05, rows.m06,
       rows.m07, rows.m08, rows.m09, rows.m10, rows.m11, rows.m12,
       rows.annual
FROM rows
JOIN countries c ON c.name = 'Россия'
JOIN regions r ON r.country_id = c.id AND r.name = 'Республика Крым';

WITH rows(name, lat, lon, m01, m02, m03, m04, m05, m06, m07, m08, m09, m10, m11, m12, annual) AS (
    VALUES
        ('Севастополь', 44.62, 33.53, 3.8, 4.2, 7.1, 10.9, 16.3, 21.4, 24.4, 24.4, 19.4, 14.4, 9.6, 5.6, 13.5)
)
INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, rows.name, rows.lat, rows.lon,
       rows.m01, rows.m02, rows.m03, rows.m04, rows.m05, rows.m06,
       rows.m07, rows.m08, rows.m09, rows.m10, rows.m11, rows.m12,
       rows.annual
FROM rows
JOIN countries c ON c.name = 'Россия'
JOIN regions r ON r.country_id = c.id AND r.name = 'Севастополь';
