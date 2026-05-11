INSERT OR IGNORE INTO countries(name) VALUES ('Россия');

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Республика Карелия' FROM countries WHERE name = 'Россия';

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Кемеровская область' FROM countries WHERE name = 'Россия';

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Кировская область' FROM countries WHERE name = 'Россия';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Кемь', 64.96, 34.59,
       -10.0, -9.6, -5.1, -0.2, 5.5, 11.1,
       14.6, 13.3, 8.9, 2.9, -2.9, -7.0,
       1.8
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Республика Карелия';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Олонец', 60.98, 32.97,
       -8.8, -8.6, -3.9, 2.8, 9.6, 14.5,
       17.3, 15.0, 9.7, 4.2, -1.5, -5.9,
       3.7
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Республика Карелия';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Паданы', 0, 0,
       -10.3, -9.8, -4.9, 0.6, 7.1, 13.0,
       16.4, 14.2, 9.1, 3.1, -2.6, -7.1,
       2.4
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Республика Карелия';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Петрозаводск', 61.79, 34.36,
       -9.3, -8.7, -3.7, 2.1, 8.8, 14.0,
       16.9, 14.6, 9.4, 3.5, -2.1, -6.4,
       3.3
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Республика Карелия';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Реболы', 0, 0,
       -10.9, -10.5, -5.4, 0.4, 7.4, 13.4,
       16.4, 13.7, 8.3, 2.3, -3.5, -7.9,
       2.0
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Республика Карелия';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Сортавала', 61.70, 30.69,
       -8.1, -7.9, -3.5, 2.3, 9.0, 14.2,
       17.3, 15.2, 9.9, 4.4, -0.7, -5.1,
       3.9
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Республика Карелия';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Кемерово', 55.35, 86.09,
       -17.4, -15.4, -7.2, 2.6, 10.8, 16.7,
       18.9, 16.1, 9.6, 2.2, -7.5, -14.4,
       1.3
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Кемеровская область';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Киселевск', 54.01, 86.64,
       -15.4, -13.1, -5.3, 3.9, 11.4, 17.2,
       19.3, 16.6, 10.3, 3.0, -6.3, -12.8,
       2.4
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Кемеровская область';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Кондома', 0, 0,
       -17.1, -14.1, -6.2, 2.5, 10.1, 15.6,
       17.8, 15.3, 9.1, 2.0, -7.5, -14.7,
       1.1
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Кемеровская область';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Мариинск', 56.21, 87.75,
       -16.7, -14.4, -6.4, 2.6, 10.1, 16.4,
       18.6, 15.7, 9.3, 1.8, -7.6, -14.0,
       1.3
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Кемеровская область';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Междуреченск', 53.69, 88.06,
       -17.3, -14.5, -6.1, 2.8, 10.3, 16.3,
       18.5, 15.9, 9.4, 2.2, -7.1, -14.6,
       1.3
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Кемеровская область';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Тайга', 56.06, 85.62,
       -17.7, -15.5, -7.6, 1.2, 9.0, 15.3,
       17.6, 14.7, 8.2, 0.8, -8.7, -15.0,
       0.2
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Кемеровская область';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Тисуль', 0, 0,
       -16.2, -14.3, -6.5, 2.6, 10.0, 16.0,
       18.1, 15.5, 9.3, 2.1, -7.1, -13.0,
       1.4
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Кемеровская область';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Топки', 55.28, 85.62,
       -16.6, -14.5, -6.9, 2.3, 10.3, 16.3,
       18.4, 15.6, 9.3, 1.7, -8.0, -13.9,
       1.2
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Кемеровская область';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Усть-Кабырза', 0, 0,
       -19.6, -15.6, -6.4, 2.5, 9.9, 15.8,
       17.9, 15.4, 8.9, 1.7, -8.0, -16.5,
       0.5
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Кемеровская область';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Центральный рудник', 0, 0,
       -14.6, -13.0, -6.7, 1.0, 8.3, 14.8,
       17.1, 14.4, 8.2, 0.9, -7.7, -12.6,
       0.8
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Кемеровская область';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Кильмезь', 56.94, 51.07,
       -12.0, -10.8, -4.2, 4.4, 12.5, 16.8,
       19.1, 16.5, 10.4, 3.4, -4.1, -9.4,
       3.6
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Кировская область';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Киров', 58.60, 49.66,
       -12.2, -10.8, -4.2, 3.9, 11.5, 16.3,
       18.7, 15.8, 9.7, 2.6, -4.5, -9.6,
       3.1
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Кировская область';

INSERT OR REPLACE INTO settlements(
    region_id, name, latitude, longitude,
    month_01, month_02, month_03, month_04, month_05, month_06,
    month_07, month_08, month_09, month_10, month_11, month_12,
    annual_temperature
)
SELECT r.id, 'Котельнич', 58.30, 48.35,
       -12.2, -11.1, -4.5, 3.7, 11.3, 16.1,
       18.4, 15.6, 9.7, 2.9, -4.2, -9.5,
       3.0
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Кировская область';
