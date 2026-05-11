INSERT OR IGNORE INTO countries(name) VALUES ('Россия');

INSERT OR IGNORE INTO regions(country_id, name) SELECT id, 'Иркутская область' FROM countries WHERE name = 'Россия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Сарма', 0, 0, -17.3, -16.0, -8.2, 0.4, 7.0, 12.9, 16.5, 15.7, 9.5, 1.7, -6.5, -12.0, 0.3 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Иркутская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Тайшет', 55.9406, 98.0044, -18.4, -15.3, -6.8, 2.1, 9.5, 16.3, 18.5, 15.5, 8.6, 0.7, -8.7, -15.8, 0.5 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Иркутская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Тулун', 54.5611, 100.5792, -19.6, -15.9, -7.5, 1.5, 9.0, 15.4, 17.6, 15.0, 8.1, 0.0, -9.7, -17.0, -0.3 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Иркутская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Усть-Ордынский', 52.8050, 104.7508, -22.9, -19.9, -9.9, 1.5, 9.3, 16.0, 18.2, 15.5, 8.4, -0.6, -11.6, -19.5, -1.3 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Иркутская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Чечуйск', 0, 0, -26.0, -22.6, -12.5, -1.9, 7.2, 15.3, 17.7, 14.7, 6.7, -2.3, -14.7, -23.8, -3.5 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Иркутская область';

INSERT OR IGNORE INTO regions(country_id, name) SELECT id, 'Кабардино-Балкарская Республика' FROM countries WHERE name = 'Россия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Нальчик', 43.4853, 43.6071, -2.5, -1.7, 3.3, 10.4, 15.6, 19.9, 22.5, 22.0, 17.1, 10.5, 4.1, -0.5, 10.1 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Кабардино-Балкарская Республика';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Прохладный', 43.7580, 44.0102, -2.5, -1.5, 3.9, 11.2, 16.7, 21.3, 24.0, 23.3, 18.0, 10.8, 4.3, -0.4, 10.8 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Кабардино-Балкарская Республика';

INSERT OR IGNORE INTO regions(country_id, name) SELECT id, 'Калининградская область' FROM countries WHERE name = 'Россия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Калининград', 54.7104, 20.4522, -1.7, -1.2, 2.0, 7.1, 12.4, 15.9, 18.0, 17.6, 13.1, 8.4, 3.7, 0.2, 8.0 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Калининградская область';

INSERT OR IGNORE INTO regions(country_id, name) SELECT id, 'Республика Калмыкия' FROM countries WHERE name = 'Россия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Городовиковск', 46.0879, 41.9335, -2.7, -2.0, 3.3, 11.2, 16.9, 21.6, 24.2, 23.5, 17.6, 10.6, 4.0, -0.2, 10.7 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Калмыкия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Комсомольский', 0, 0, -2.7, -2.1, 3.3, 11.5, 18.5, 23.9, 26.6, 25.4, 19.0, 11.3, 4.4, -0.2, 11.6 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Калмыкия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Элиста', 46.3077, 44.2698, -4.6, -4.2, 1.5, 10.3, 16.9, 22.2, 25.0, 24.0, 17.4, 9.8, 2.6, -2.1, 9.9 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Калмыкия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Юста', 0, 0, -5.4, -5.0, 1.5, 10.9, 18.2, 23.6, 26.2, 24.7, 17.7, 9.4, 2.1, -2.7, 10.1 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Калмыкия';

INSERT OR IGNORE INTO regions(country_id, name) SELECT id, 'Калужская область' FROM countries WHERE name = 'Россия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Калуга', 54.5138, 36.2612, -7.4, -7.1, -1.8, 6.1, 12.9, 16.5, 18.3, 16.7, 11.0, 5.2, -1.0, -5.3, 5.3 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Калужская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Сухиничи', 54.0999, 35.3425, -7.4, -6.9, -1.7, 6.3, 13.0, 16.5, 18.2, 16.8, 11.2, 5.2, -1.0, -5.2, 5.4 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Калужская область';

INSERT OR IGNORE INTO regions(country_id, name) SELECT id, 'Камчатский край' FROM countries WHERE name = 'Россия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Апука', 0, 0, -12.8, -12.6, -10.8, -5.6, 1.4, 7.0, 10.7, 11.0, 7.2, -0.2, -7.3, -11.5, -2.0 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Камчатский край';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Большерецк', 0, 0, -11.3, -10.3, -6.8, -1.6, 3.1, 7.6, 11.4, 12.1, 9.2, 4.2, -2.9, -8.7, 0.5 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Камчатский край';
