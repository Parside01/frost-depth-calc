INSERT OR IGNORE INTO countries(name) VALUES ('Россия');

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Алтайский край' FROM countries WHERE name = 'Россия';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Славгород', 0, 0, -17.3, -15.9, -8.0, 5.2, 13.6, 19.5, 21.0, 18.5, 12.1, 3.8, -6.5, -13.7, 2.7
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Алтайский край';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Солонешное', 0, 0, -15.9, -14.2, -6.2, 4.5, 11.6, 16.7, 18.3, 16.1, 10.2, 3.2, -6.2, -12.8, 2.1
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Алтайский край';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Тогул', 0, 0, -14.7, -13.1, -6.0, 4.0, 11.9, 17.4, 19.3, 16.9, 10.8, 3.4, -6.0, -12.1, 2.7
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Алтайский край';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Хабары', 0, 0, -17.9, -16.6, -8.7, 3.9, 12.4, 18.0, 19.7, 17.1, 10.7, 3.0, -7.2, -14.3, 1.7
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Алтайский край';

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Амурская область' FROM countries WHERE name = 'Россия';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Архара', 0, 0, -25.7, -20.2, -8.7, 4.0, 12.2, 18.1, 21.3, 18.9, 12.2, 2.4, -11.2, -22.9, 0.0
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Белогорск', 50.9213, 128.4739, -24.0, -18.5, -8.1, 3.9, 12.4, 18.9, 21.5, 19.1, 12.1, 1.9, -12.1, -22.3, 0.4
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Береговой', 0, 0, -25.6, -21.0, -11.8, -0.6, 7.9, 15.0, 18.1, 15.7, 8.8, -1.8, -15.7, -24.5, -3.0
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Благовещенск', 50.2907, 127.5272, -21.8, -16.7, -6.6, 4.5, 12.8, 19.2, 21.9, 19.5, 12.8, 3.0, -9.9, -19.9, 1.6
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Бомнак', 0, 0, -29.7, -23.3, -11.9, -0.2, 8.8, 15.8, 18.3, 15.8, 8.9, -2.1, -18.3, -29.0, -3.9
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Братолюбовка', 0, 0, -25.7, -20.1, -9.5, 2.9, 11.4, 17.6, 20.5, 18.0, 11.3, 1.1, -12.9, -23.9, -0.8
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Бысса (Февральск)', 0, 0, -29.0, -23.1, -11.3, 1.5, 10.0, 16.6, 19.4, 16.5, 9.7, -0.7, -15.8, -27.2, -2.8
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Дугда', 0, 0, -30.0, -24.2, -12.4, 0.5, 9.4, 16.1, 18.8, 15.9, 8.8, -1.8, -17.6, -28.7, -3.8
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Ерофей Павлович', 0, 0, -25.6, -20.7, -11.3, 0.1, 8.8, 15.9, 18.4, 15.4, 8.1, -2.8, -16.5, -25.0, -2.9
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Завитая', 0, 0, -24.3, -18.9, -8.6, 3.3, 11.7, 17.9, 20.7, 18.4, 11.7, 1.7, -11.9, -22.5, -0.1
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Зея', 53.7339, 127.2658, -24.6, -19.2, -9.0, 2.2, 10.8, 17.8, 20.4, 17.5, 10.3, -0.3, -14.9, -23.8, -1.1
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Норск', 0, 0, -29.5, -23.3, -11.3, 1.8, 10.5, 17.1, 19.9, 17.1, 10.1, -0.2, -15.6, -27.6, -2.6
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Поярково', 0, 0, -24.9, -19.5, -8.4, 4.1, 12.3, 18.5, 21.4, 19.1, 12.4, 2.6, -10.9, -22.3, 0.4
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Свободный', 51.3759, 128.1340, -25.3, -19.9, -9.5, 2.8, 11.3, 17.8, 20.5, 17.9, 10.9, 0.5, -13.7, -23.8, -0.9
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Сковородино', 53.9847, 123.9403, -27.2, -22.3, -12.4, 0.1, 9.1, 15.8, 18.3, 15.2, 7.9, -3.3, -17.9, -26.8, -3.6
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Тында', 55.1547, 124.7469, -28.6, -23.3, -13.3, -1.5, 7.7, 15.2, 17.6, 14.5, 7.0, -4.7, -19.7, -28.2, -4.8
FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Амурская область';
