INSERT OR IGNORE INTO countries(name) VALUES ('Россия');

INSERT OR IGNORE INTO regions(country_id, name) SELECT id, 'Забайкальский край' FROM countries WHERE name = 'Россия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Борзя', 50.3881, 116.5230, -26.2, -21.6, -10.2, 1.7, 10.1, 17.0, 19.4, 16.8, 9.6, -0.4, -13.1, -23.1, -1.7 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Забайкальский край';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Букукун', 0, 0, -20.7, -17.2, -9.6, -0.3, 7.6, 13.1, 15.5, 13.1, 6.5, -2.2, -12.3, -18.7, -2.1 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Забайкальский край';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Дарасун', 51.6606, 113.9750, -21.6, -17.8, -9.1, 0.8, 8.7, 15.2, 17.5, 14.8, 7.9, -1.2, -11.6, -19.0, -1.3 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Забайкальский край';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Кайластуй', 0, 0, -25.0, -20.3, -9.1, 3.0, 11.7, 18.3, 20.6, 18.2, 11.2, 1.2, -11.6, -21.7, -0.3 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Забайкальский край';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Красный Чикой', 50.3644, 108.7519, -25.3, -20.1, -8.9, 1.7, 9.2, 15.4, 17.7, 15.0, 8.0, -1.0, -12.4, -21.6, -1.9 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Забайкальский край';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Могоча', 53.7361, 119.7652, -28.1, -22.9, -12.8, -0.9, 7.8, 14.6, 17.1, 14.1, 6.9, -3.7, -18.1, -27.2, -4.4 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Забайкальский край';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Нерчинск', 51.9833, 116.5833, -29.5, -23.9, -11.2, 1.9, 10.4, 17.4, 19.8, 17.0, 9.5, -0.9, -15.3, -26.6, -2.6 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Забайкальский край';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Нерчинский Завод', 0, 0, -26.6, -21.4, -10.3, 1.6, 10.0, 16.2, 18.6, 15.9, 9.1, -0.6, -14.2, -24.4, -2.2 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Забайкальский край';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Средняя Олекма', 0, 0, -33.3, -26.4, -14.8, -2.0, 7.6, 15.1, 17.7, 14.6, 6.8, -5.0, -21.8, -32.5, -6.2 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Забайкальский край';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Тунгокочен', 0, 0, -30.0, -24.5, -14.6, -2.0, 6.7, 13.6, 16.0, 13.1, 5.9, -4.3, -18.2, -28.0, -5.5 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Забайкальский край';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Тупик', 0, 0, -31.1, -25.5, -15.0, -2.5, 7.0, 14.2, 16.5, 13.6, 6.3, -4.7, -19.8, -29.8, -5.9 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Забайкальский край';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Хилок', 51.3674, 110.4676, -24.9, -20.0, -10.2, 0.3, 7.9, 14.5, 17.1, 14.3, 7.1, -2.0, -13.0, -21.4, -2.5 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Забайкальский край';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Чара', 56.9064, 118.2631, -32.5, -27.6, -16.7, -3.8, 5.5, 13.7, 16.4, 13.4, 5.5, -6.0, -20.7, -30.5, -6.9 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Забайкальский край';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Чита', 52.0340, 113.4994, -25.1, -19.5, -9.0, 1.5, 9.6, 16.5, 18.8, 16.0, 8.8, -0.7, -12.6, -22.0, -1.5 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Забайкальский край';

INSERT OR IGNORE INTO regions(country_id, name) SELECT id, 'Запорожская область' FROM countries WHERE name = 'Россия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Запорожье', 47.8388, 35.1396, -3.4, -2.8, 2.3, 10.0, 16.6, 20.5, 22.3, 21.9, 16.2, 9.3, 2.6, -1.5, 9.5 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Запорожская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Кирилловка', 46.3750, 35.3689, -3.8, -3.2, 1.8, 9.3, 15.3, 19.3, 21.4, 21.2, 15.3, 8.8, 2.3, -2.1, 8.7 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Запорожская область';

INSERT OR IGNORE INTO regions(country_id, name) SELECT id, 'Ивановская область' FROM countries WHERE name = 'Россия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Иваново', 56.9994, 40.9728, -9.5, -8.7, -3.1, 5.1, 12.3, 16.5, 18.7, 16.4, 10.5, 4.3, -2.3, -7.0, 4.4 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Ивановская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Кинешма', 57.4427, 42.1698, -9.7, -8.6, -2.9, 4.9, 12.2, 16.6, 18.9, 16.5, 10.6, 4.2, -2.4, -7.3, 4.4 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Ивановская область';

INSERT OR IGNORE INTO regions(country_id, name) SELECT id, 'Республика Ингушетия' FROM countries WHERE name = 'Россия';
