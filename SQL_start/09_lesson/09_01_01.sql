-- Практическое задание по теме “Транзакции, переменные, представления”
-- 
-- 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции
-- 

START TRANSACTION;
INSERT INTO sample.users 
SELECT * FROM shop4.users WHERE shop4.users.id = 1;
COMMIT