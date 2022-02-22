
-- 2. Создайте представление, которое выводит название name товарной позиции из таблицы 
-- products и соответствующее название каталога name из таблицы catalogs.
--

CREATE VIEW `prod` AS 
SELECT 
`name`, 
(SELECT catalogs.`name` FROM catalogs WHERE catalogs.`id` = catalog_id) as `type` 
FROM shop4.products;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `prod` AS
    SELECT 
        `products`.`name` AS `name`,
        (SELECT 
                `catalogs`.`name`
            FROM
                `catalogs`
            WHERE
                (`catalogs`.`id` = `products`.`catalog_id`)) AS `type`
    FROM
        `products`
		