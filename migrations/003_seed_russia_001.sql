INSERT OR IGNORE INTO countries(name) VALUES ('Россия');

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Республика Адыгея (Адыгея)' FROM countries WHERE name = 'Россия';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Майкоп', 44.6098, 40.1007, 0.0, 1.1, 5.6, 11.8, 16.5, 20.4, 23.0, 22.7, 17.9, 11.8, 6.2, 2.1, 11.6
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Республика Адыгея (Адыгея)';

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Республика Алтай' FROM countries WHERE name = 'Россия';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Катанда', 0, 0, -21.0, -16.9, -7.3, 3.8, 10.0, 14.8, 16.2, 14.0, 8.2, 0.8, -9.9, -18.4, -0.5
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Республика Алтай';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Кош-Агач', 49.9961, 88.6676, -27.3, -23.3, -11.5, 0.5, 7.2, 13.1, 14.8, 12.7, 6.7, -2.5, -15.0, -24.2, -4.1
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Республика Алтай';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Кызыл-Озек', 0, 0, -14.1, -12.5, -5.5, 4.5, 11.9, 16.9, 18.7, 16.5, 10.6, 3.7, -5.5, -11.5, 2.8
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Республика Алтай';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Онгудай', 50.7500, 86.1500, -19.1, -15.5, -5.3, 4.8, 10.8, 15.6, 17.1, 14.8, 9.0, 1.5, -8.9, -16.8, 0.7
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Республика Алтай';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Яйлю', 51.7833, 87.6000, -7.9, -7.4, -2.3, 4.4, 9.9, 14.7, 17.1, 15.7, 10.3, 4.4, -2.1, -6.0, 4.2
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Республика Алтай';

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Алтайский край' FROM countries WHERE name = 'Россия';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Алейск', 52.4926, 82.7822, -15.7, -14.1, -6.5, 5.2, 13.2, 18.8, 20.4, 17.8, 11.5, 3.9, -5.7, -12.6, 3.0
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Алтайский край';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Барнаул', 53.3481, 83.7798, -16.0, -14.2, -6.5, 4.4, 12.5, 18.0, 19.7, 17.2, 11.0, 3.5, -6.3, -13.0, 2.5
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Алтайский край';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Бийск', 52.5394, 85.2138, -16.1, -14.5, -6.7, 4.5, 12.5, 17.9, 19.7, 17.3, 11.1, 3.6, -6.1, -12.8, 2.5
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Алтайский край';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Змеиногорск', 51.1581, 82.1873, -14.1, -13.0, -6.4, 4.8, 12.5, 17.7, 19.3, 17.1, 11.3, 4.1, -5.1, -11.4, 3.1
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Алтайский край';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Родино', 0, 0, -16.0, -14.6, -7.5, 5.3, 13.4, 19.1, 20.7, 18.1, 11.9, 4.0, -6.0, -12.6, 3.0
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Алтайский край';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Рубцовск', 51.5012, 81.2078, -15.9, -14.6, -7.2, 5.3, 13.5, 19.1, 20.6, 18.3, 12.0, 4.3, -5.4, -12.6, 3.1
FROM regions r JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Россия' AND r.name = 'Алтайский край';
