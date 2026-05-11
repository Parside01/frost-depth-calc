INSERT OR IGNORE INTO countries(name) VALUES ('Россия');

INSERT OR IGNORE INTO regions(country_id, name) SELECT id, 'Воронежская область' FROM countries WHERE name = 'Россия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Воронеж', 51.6608, 39.2003, -6.8, -6.4, -1.0, 8.4, 15.2, 18.9, 20.6, 19.5, 13.4, 6.8, 0.1, -4.4, 7.0 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Воронежская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Каменная степь', 0, 0, -7.4, -7.1, -1.6, 8.4, 15.3, 19.0, 20.7, 19.9, 13.9, 6.7, -0.3, -5.0, 6.9 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Воронежская область';

INSERT OR IGNORE INTO regions(country_id, name) SELECT id, 'Республика Дагестан' FROM countries WHERE name = 'Россия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Ахты', 41.4597, 47.7312, -1.0, -0.2, 3.6, 9.7, 14.0, 17.9, 20.4, 20.0, 15.7, 10.2, 5.0, 1.0, 9.7 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Дагестан';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Дербент', 42.0578, 48.2888, 2.7, 2.6, 5.3, 10.6, 16.7, 22.4, 25.4, 25.1, 20.7, 14.7, 9.2, 4.9, 13.4 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Дагестан';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Кизляр', 43.8486, 46.7150, -0.5, 0.3, 4.6, 11.3, 17.5, 22.4, 25.0, 24.2, 19.3, 12.7, 6.5, 1.9, 12.1 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Дагестан';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Махачкала', 42.9849, 47.5046, 0.8, 1.2, 4.7, 10.4, 16.5, 22.0, 24.9, 24.6, 20.2, 13.8, 7.7, 3.1, 12.5 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Дагестан';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Терекли-Мектеб', 0, 0, -1.4, -0.7, 4.2, 11.3, 17.8, 23.0, 25.6, 24.6, 19.1, 12.1, 5.5, 1.0, 11.8 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Дагестан';

INSERT OR IGNORE INTO regions(country_id, name) SELECT id, 'Донецкая Народная Республика' FROM countries WHERE name = 'Россия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Донецк', 48.0159, 37.8028, -5.8, -5.5, 0.0, 8.8, 15.3, 19.0, 21.1, 20.3, 14.4, 7.4, 0.9, -3.7, 7.7 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Донецкая Народная Республика';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Дебальцево', 48.3407, 38.4049, -4.5, -3.8, 1.5, 9.6, 15.8, 19.6, 21.6, 21.1, 15.4, 8.4, 1.8, -2.5, 8.7 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Донецкая Народная Республика';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Мариуполь', 47.0971, 37.5434, -2.9, -2.4, 2.3, 9.6, 16.2, 20.7, 23.1, 22.5, 16.8, 10.1, 3.5, -0.9, 9.9 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Донецкая Народная Республика';

INSERT OR IGNORE INTO regions(country_id, name) SELECT id, 'Еврейская автономная область' FROM countries WHERE name = 'Россия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Биробиджан', 48.7946, 132.9218, -22.1, -16.9, -6.6, 4.3, 12.2, 17.8, 21.2, 19.3, 13.0, 3.8, -8.7, -19.9, 1.5 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Еврейская автономная область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Екатерино-Никольское', 0, 0, -19.5, -14.9, -5.5, 5.0, 12.7, 18.3, 21.6, 19.8, 13.5, 4.4, -7.4, -17.5, 2.5 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Еврейская автономная область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Облучье', 49.0189, 131.0539, -25.3, -20.1, -9.2, 2.9, 10.9, 16.8, 20.2, 17.9, 11.2, 1.5, -11.9, -23.1, -0.7 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Еврейская автономная область';

INSERT OR IGNORE INTO regions(country_id, name) SELECT id, 'Забайкальский край' FROM countries WHERE name = 'Россия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Агинское', 51.1000, 114.5300, -22.6, -18.7, -9.1, 1.4, 9.6, 16.2, 18.6, 16.0, 9.0, -0.6, -12.0, -20.0, -1.0 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Забайкальский край';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Акша', 50.2814, 113.2867, -22.3, -17.9, -8.1, 1.9, 9.7, 16.0, 18.4, 15.9, 9.0, -0.2, -11.1, -19.3, -0.7 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Забайкальский край';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Александровский Завод', 50.9239, 117.9378, -25.7, -21.8, -12.2, -0.3, 8.0, 14.0, 16.5, 14.2, 7.5, -2.2, -14.6, -23.4, -3.3 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Забайкальский край';
