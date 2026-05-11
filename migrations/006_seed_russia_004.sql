INSERT OR IGNORE INTO countries(name) VALUES ('Россия');

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Республика Башкортостан' FROM countries WHERE name = 'Россия';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Зилаир', 0, 0, -13.6, -12.6, -6.2, 4.0, 11.9, 16.6, 18.4, 16.4, 10.2, 2.6, -5.7, -11.3, 2.6 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Башкортостан';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Мелеуз', 0, 0, -13.4, -12.9, -5.7, 5.7, 14.3, 18.8, 20.5, 18.4, 12.2, 4.3, -3.9, -10.6, 4.0 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Башкортостан';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Раевский', 0, 0, -12.6, -11.9, -5.1, 5.9, 14.3, 18.7, 20.4, 18.2, 12.0, 4.5, -3.5, -9.9, 4.3 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Башкортостан';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Уфа', 54.7351, 55.9587, -12.9, -12.0, -5.0, 5.5, 13.5, 17.8, 19.7, 17.4, 11.4, 4.2, -3.9, -10.3, 3.8 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Башкортостан';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Учалы', 54.3192, 59.3772, -14.3, -13.1, -6.6, 3.4, 11.2, 15.8, 17.3, 15.1, 9.3, 2.2, -6.1, -11.7, 1.9 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Башкортостан';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Янаул', 56.2650, 54.9299, -13.3, -12.7, -6.0, 3.7, 12.1, 16.8, 18.9, 16.3, 10.4, 3.4, -4.6, -10.5, 2.9 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Башкортостан';

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Белгородская область' FROM countries WHERE name = 'Россия';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Белгород', 50.5954, 36.5873, -5.9, -5.3, -0.3, 8.5, 15.1, 18.8, 20.4, 19.6, 13.7, 7.2, 0.3, -3.9, 7.4 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Белгородская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Валуйки', 50.2111, 38.0998, -5.8, -5.2, 0.3, 9.2, 15.5, 19.3, 20.9, 19.8, 13.9, 7.4, 1.0, -3.4, 7.7 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Белгородская область';

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Брянская область' FROM countries WHERE name = 'Россия';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Брянск', 53.2436, 34.3634, -6.6, -6.0, -0.8, 7.2, 13.8, 17.3, 18.7, 17.6, 12.0, 5.9, -0.2, -4.4, 6.2 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Брянская область';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Унеча', 52.8453, 32.6739, -6.1, -5.3, -0.4, 7.1, 13.5, 17.1, 18.6, 17.4, 11.9, 6.0, 0.3, -3.8, 6.4 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Брянская область';

INSERT OR IGNORE INTO regions(country_id, name)
SELECT id, 'Республика Бурятия' FROM countries WHERE name = 'Россия';

INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Бабушкин', 51.7112, 105.8673, -14.9, -15.5, -8.3, 0.0, 6.3, 11.4, 15.3, 14.8, 9.4, 2.7, -4.2, -8.9, 0.7 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Бурятия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Багдарин', 0, 0, -28.4, -23.3, -13.9, -2.5, 6.2, 13.3, 15.8, 12.9, 5.6, -4.9, -18.0, -26.8, -5.3 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Бурятия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Баргузин', 53.6167, 109.6333, -27.0, -22.1, -10.1, 0.8, 8.7, 15.9, 18.8, 16.3, 8.8, -0.4, -11.6, -21.8, -2.0 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Бурятия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Кяхта', 50.3466, 106.4503, -20.2, -15.9, -6.2, 3.2, 10.5, 16.9, 19.1, 16.6, 9.7, 1.1, -9.2, -17.4, 0.7 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Бурятия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Монды', 0, 0, -19.3, -16.5, -8.9, 0.0, 6.9, 12.6, 14.6, 12.4, 6.2, -1.5, -10.5, -16.5, -1.7 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Бурятия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Нижнеангарск', 55.7833, 109.5500, -21.5, -19.8, -11.9, -2.0, 5.4, 12.7, 16.7, 15.5, 8.7, -0.5, -10.3, -16.9, -2.0 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Бурятия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Орлик', 52.5178, 99.8250, -24.2, -20.0, -11.4, -2.0, 5.2, 11.5, 13.6, 11.1, 4.6, -3.8, -14.2, -21.6, -4.3 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Бурятия';
INSERT OR REPLACE INTO settlements(region_id, name, latitude, longitude, month_01, month_02, month_03, month_04, month_05, month_06, month_07, month_08, month_09, month_10, month_11, month_12, annual_temperature)
SELECT r.id, 'Сосново-Озерское', 52.5245, 111.5415, -23.7, -19.8, -11.5, -1.6, 5.7, 14.2, 16.8, 14.2, 7.1, -2.2, -12.8, -20.4, -2.8 FROM regions r JOIN countries c ON c.id = r.country_id WHERE c.name = 'Россия' AND r.name = 'Республика Бурятия';
