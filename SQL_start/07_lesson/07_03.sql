-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name).
-- Поля from, to и label содержат английские названия городов, поле name — русское. 
-- Выведите список рейсов flights с русскими названиями городов.

select 
flights.id
(select cities.name from cities where flights.from = cities.label),
(select cities.name from cities where flights.to = cities.label)
from flights;