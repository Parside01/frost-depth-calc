INSERT OR IGNORE INTO countries(name) VALUES ('Россия');

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Кировская область' FROM countries WHERE name = 'Россия';

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Республика Коми' FROM countries WHERE name = 'Россия';

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Костромская область' FROM countries WHERE name = 'Россия';

WITH rows(name, lat, lon, m01, m02, m03, m04, m05, m06, m07, m08, m09, m10, m11, m12, annual) AS (
    VALUES
        ('Нагорское', 0, 0, -13.3, -11.7, -4.8, 2.8, 10.3, 15.4, 17.9, 14.8, 8.8, 1.8, -5.6, -10.8, 2.1),
        ('Опарино', 0, 0, -13.0, -11.2, -4.6, 2.8, 9.9, 14.8, 17.3, 14.2, 8.6, 2.0, -5.2, -10.2, 2.1)
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
JOIN regions r ON r.country_id = c.id AND r.name = 'Кировская область';

WITH rows(name, lat, lon, m01, m02, m03, m04, m05, m06, m07, m08, m09, m10, m11, m12, annual) AS (
    VALUES
        ('Вендинга', 0, 0, -15.5, -13.5, -6.6, 0.2, 7.1, 13.5, 16.6, 13.0, 7.4, 0.8, -6.7, -11.9, 0.4),
        ('Весляна', 0, 0, -16.1, -14.1, -6.8, 0.2, 7.1, 13.5, 16.7, 12.9, 7.3, 0.5, -7.3, -12.7, 0.1),
        ('Воркута', 67.50, 64.06, -20.0, -19.5, -14.1, -9.0, -1.6, 7.7, 13.2, 9.8, 4.5, -3.8, -12.7, -16.6, -5.2),
        ('Объячево', 0, 0, -13.3, -11.4, -4.6, 2.8, 9.7, 15.0, 17.5, 14.3, 8.6, 1.7, -5.5, -10.5, 2.0),
        ('Петрунь', 0, 0, -19.8, -18.4, -11.6, -6.2, 1.3, 9.9, 14.7, 11.0, 5.7, -2.2, -11.5, -15.8, -3.6),
        ('Печора', 65.15, 57.22, -18.7, -16.9, -8.9, -2.6, 4.4, 12.1, 16.1, 12.3, 6.7, -0.8, -9.8, -14.9, -1.8),
        ('Сыктывкар', 61.67, 50.84, -14.3, -12.4, -5.3, 1.8, 8.8, 14.6, 17.5, 13.9, 8.1, 1.3, -6.3, -11.1, 1.4),
        ('Троицко-Печорское', 0, 0, -17.2, -15.3, -6.9, 0.1, 6.8, 13.4, 16.5, 12.8, 7.1, -0.1, -8.5, -13.9, -0.4),
        ('Усть-Уса', 0, 0, -18.5, -16.9, -9.6, -3.9, 2.9, 10.7, 15.0, 11.5, 6.2, -1.4, -10.0, -14.7, -2.4),
        ('Усть-Цильма', 65.44, 52.15, -17.0, -15.1, -8.0, -2.0, 4.6, 11.6, 15.5, 11.9, 6.7, -0.5, -8.4, -13.2, -1.2),
        ('Усть-Щугор', 0, 0, -19.3, -17.4, -9.1, -2.2, 4.8, 12.3, 16.2, 12.3, 6.6, -0.8, -10.1, -15.5, -1.9),
        ('Ухта', 63.57, 53.68, -16.6, -14.7, -6.9, -0.2, 6.5, 13.1, 16.4, 12.6, 7.0, -0.2, -8.2, -13.2, -0.4)
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
JOIN regions r ON r.country_id = c.id AND r.name = 'Республика Коми';

WITH rows(name, lat, lon, m01, m02, m03, m04, m05, m06, m07, m08, m09, m10, m11, m12, annual) AS (
    VALUES
        ('Вохма', 58.93, 46.76, -12.3, -10.9, -4.5, 3.1, 10.5, 15.4, 17.9, 15.0, 9.0, 2.5, -4.5, -9.6, 2.6),
        ('Кострома', 57.77, 40.93, -9.7, -8.7, -3.0, 4.7, 12.1, 16.2, 18.5, 16.2, 10.4, 4.0, -2.6, -7.2, 4.2),
        ('Чухлома', 58.75, 42.68, -11.1, -9.8, -3.7, 3.6, 10.9, 15.4, 17.9, 15.3, 9.5, 3.2, -3.5, -8.4, 3.3),
        ('Шарья', 58.37, 45.52, -11.5, -10.2, -4.0, 3.8, 11.1, 15.6, 17.9, 15.2, 9.4, 3.0, -3.7, -8.9, 3.1)
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
JOIN regions r ON r.country_id = c.id AND r.name = 'Костромская область';
