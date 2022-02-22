(SELECT sum(cnt) from
(select order_id, sum(orders_products.`total`) as `sum`, count(*) as cnt FROM homework7.orders_products group by order_id) t
where order_id = orders.id) as count_orders 
FROM homework7.orders
group by `name`
order by count_orders desc;

-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.