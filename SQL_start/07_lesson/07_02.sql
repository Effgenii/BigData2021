-- с помощью запроса

SELECT id, name, description, 
(select catalogs.name from catalogs where catalogs.id = catalog_id) as catalog
FROM homework7.products;

-- с помощью JOIN

SELECT 
products.name,
catalogs.name
from products join catalogs
where products.catalog_id = catalogs.id;


-- Выведите список товаров products и разделов catalogs, который соответствует товару