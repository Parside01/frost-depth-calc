INSERT OR IGNORE INTO countries(name) VALUES ('Россия');

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Амурская область' FROM countries WHERE name = 'Россия';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Усть-Нюкжа', 0, 0, -30.9, -24.5, -13.6, -1.8, 7.4, 15.1, 17.7, 14.7, 7.0, -4.6, -20.2, -30.0, -5.3
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Черняево', 0, 0, -26.2, -21.1, -10.6, 1.8, 10.4, 17.4, 20.0, 17.2, 10.1, -0.6, -15.3, -24.8, -1.8
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Шимановск', 51.9996, 127.6773, -25.0, -20.0, -9.9, 2.0, 10.6, 17.3, 20.0, 17.3, 10.3, -0.2, -14.3, -23.8, -1.3
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Экимчан', 0, 0, -30.4, -23.9, -13.0, -1.3, 7.5, 14.5, 17.5, 14.9, 7.9, -2.8, -17.7, -29.1, -4.7
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Архангельская область' FROM countries WHERE name = 'Россия';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Архангельск', 64.5393, 40.5170, -12.6, -11.2, -5.5, 0.4, 7.2, 13.1, 16.4, 13.4, 8.3, 2.1, -4.4, -9.0, 1.5
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Архангельская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Емецк', 0, 0, -13.1, -11.5, -5.6, 0.7, 8.0, 13.9, 17.0, 13.8, 8.4, 2.0, -4.8, -9.5, 1.6
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Архангельская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Каргополь', 61.5053, 38.9486, -11.5, -10.2, -4.7, 1.9, 9.2, 14.5, 17.2, 14.3, 8.8, 2.6, -3.8, -8.3, 2.5
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Архангельская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Койнас', 0, 0, -16.3, -14.1, -7.0, -0.7, 6.0, 12.7, 16.4, 12.7, 7.2, 0.5, -7.1, -12.3, -0.2
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Архангельская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Котлас', 61.2529, 46.6332, -12.8, -11.3, -4.7, 2.4, 9.5, 14.8, 17.5, 14.3, 8.6, 2.2, -4.9, -9.8, 2.2
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Архангельская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Мезень', 65.8397, 44.2533, -14.0, -12.5, -6.9, -1.5, 4.7, 11.0, 14.9, 12.3, 7.4, 1.0, -5.8, -10.1, 0.0
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Архангельская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Онега', 63.9167, 38.0833, -11.2, -10.1, -4.8, 1.1, 7.8, 13.7, 17.0, 14.1, 9.0, 2.8, -3.4, -7.8, 2.4
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Архангельская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Сура', 0, 0, -14.7, -12.9, -6.2, 0.4, 7.4, 13.6, 16.8, 13.3, 7.7, 1.3, -6.0, -11.1, 0.8
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Архангельская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Шенкурск', 62.1056, 42.8996, -12.5, -10.8, -4.7, 2.2, 9.4, 14.9, 17.8, 14.6, 8.9, 2.4, -4.4, -9.3, 2.4
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Архангельская область';

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Астраханская область' FROM countries WHERE name = 'Россия';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Астрахань', 46.3497, 48.0408, -4.2, -3.8, 2.3, 11.4, 18.3, 23.5, 25.8, 24.3, 17.8, 10.2, 3.3, -1.7, 10.6
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Астраханская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Верхний Баскунчак', 48.2256, 46.7217, -6.8, -6.4, 0.4, 10.6, 18.0, 23.2, 25.5, 24.1, 17.0, 8.7, 1.1, -4.1, 9.3
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Астраханская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Досанг', 0, 0, -5.4, -5.0, 1.8, 11.2, 18.4, 23.7, 25.9, 24.4, 17.5, 9.3, 2.2, -2.8, 10.1
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Астраханская область';

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Республика Башкортостан' FROM countries WHERE name = 'Россия';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Белорецк', 53.9676, 58.4099, -14.4, -12.7, -6.0, 3.4, 10.9, 15.4, 17.1, 14.9, 9.0, 1.9, -6.5, -12.5, 1.7
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Башкортостан';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Дуван', 55.6947, 57.9024, -13.6, -12.5, -5.6, 3.6, 11.4, 16.1, 17.9, 15.5, 9.7, 2.5, -5.8, -11.1, 2.3
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Башкортостан';
