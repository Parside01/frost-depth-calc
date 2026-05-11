INSERT OR IGNORE INTO countries(name) VALUES ('Россия');

INSERT OR IGNORE INTO regions(country_id, name) SELECT id, 'Республика Бурятия' FROM countries WHERE name = 'Россия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Таксимо', 0, 0, -31.1, -24.1, -13.1, -1.7, 6.8, 15.1, 18.0, 14.9, 6.8, -4.2, -19.0, -29.5, -5.1 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Бурятия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Уакит', 0, 0, -27.9, -23.1, -14.8, -4.6, 4.3, 12.2, 15.0, 12.3, 4.8, -5.8, -18.0, -26.1, -6.0 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Бурятия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Улан-Удэ', 51.8335, 107.5841, -23.3, -18.4, -7.4, 2.7, 10.4, 17.3, 19.8, 17.2, 9.7, 0.4, -10.3, -19.3, -0.1 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Бурятия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Хоринск', 0, 0, -25.7, -20.5, -9.2, 1.2, 8.9, 16.1, 18.3, 15.5, 8.3, -1.2, -12.1, -21.2, -1.8 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Бурятия';

INSERT OR IGNORE INTO regions(country_id, name) SELECT id, 'Владимирская область' FROM countries WHERE name = 'Россия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Владимир', 56.1290, 40.4066, -8.9, -8.0, -2.5, 5.6, 12.9, 16.7, 18.8, 16.8, 10.9, 4.6, -2.0, -6.6, 4.9 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Владимирская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Муром', 55.5725, 42.0514, -9.0, -8.4, -2.7, 6.0, 13.3, 17.2, 19.3, 17.2, 11.2, 4.8, -1.9, -6.7, 5.0 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Владимирская область';

INSERT OR IGNORE INTO regions(country_id, name) SELECT id, 'Волгоградская область' FROM countries WHERE name = 'Россия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Волгоград', 48.7080, 44.5133, -6.3, -6.0, 0.0, 10.1, 17.1, 22.0, 24.3, 23.2, 16.5, 8.6, 1.2, -3.9, 8.9 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Волгоградская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Камышин', 50.0833, 45.4167, -8.1, -8.0, -2.1, 8.7, 16.3, 21.1, 23.4, 22.2, 15.5, 7.4, -0.2, -5.5, 7.6 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Волгоградская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Котельниково', 47.6317, 43.1336, -4.7, -4.5, 1.4, 10.3, 16.8, 21.8, 24.3, 23.3, 16.8, 9.1, 2.2, -1.9, 9.6 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Волгоградская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Новоанненский', 50.5286, 42.6667, -7.2, -7.1, -1.3, 9.0, 16.0, 20.2, 22.1, 20.9, 14.5, 7.2, 0.2, -4.8, 7.5 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Волгоградская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Фролово', 49.7656, 43.6498, -7.2, -6.9, -1.1, 9.2, 16.2, 20.6, 22.7, 21.6, 14.9, 7.4, 0.3, -4.7, 7.8 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Волгоградская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Эльтон', 0, 0, -7.6, -7.3, -0.7, 10.2, 17.8, 23.0, 25.4, 23.9, 16.7, 8.3, 0.6, -4.8, 8.8 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Волгоградская область';

INSERT OR IGNORE INTO regions(country_id, name) SELECT id, 'Вологодская область' FROM countries WHERE name = 'Россия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Бабаево', 59.3936, 35.9371, -9.5, -8.6, -3.4, 3.3, 10.5, 15.1, 17.5, 15.1, 9.5, 3.6, -2.4, -6.9, 3.7 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Вологодская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Вологда', 59.2205, 39.8915, -10.7, -9.6, -4.1, 3.4, 10.7, 15.2, 17.5, 15.0, 9.4, 3.2, -3.1, -7.8, 3.3 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Вологодская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Вытегра', 61.0064, 36.4481, -9.8, -9.0, -3.8, 2.8, 9.6, 14.7, 17.5, 15.1, 9.8, 3.9, -2.3, -6.7, 3.5 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Вологодская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Никольск', 59.5353, 45.4574, -12.3, -10.6, -4.4, 3.1, 10.3, 15.3, 17.7, 14.8, 9.0, 2.4, -4.3, -9.3, 2.6 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Вологодская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Нюксеница', 0, 0, -12.3, -10.5, -4.4, 2.7, 9.9, 14.9, 17.5, 14.5, 8.8, 2.3, -4.4, -9.3, 2.5 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Вологодская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Тотьма', 59.9738, 42.7589, -11.7, -10.1, -4.1, 2.9, 10.2, 15.0, 17.5, 14.6, 9.0, 2.6, -3.9, -8.7, 2.8 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Вологодская область';
