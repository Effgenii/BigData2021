
-- Практическое задание по теме “Оптимизация запросов”
--
-- 2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.
--

--- при попытке выполнить запрос на миллион записей - вываливается сообщение об ошибке: 
09:17:50	call homework_11.million_of_mans()	Error Code: 2013. Lost connection to MySQL server during query	30.016 sec

-- запрос успел добавить тысячу пользователей за 30 секунд.



CREATE DEFINER=`root`@`localhost` PROCEDURE `million_of_mans`()
BEGIN
DECLARE x INT DEFAULT 1;
	WHILE x < 10000001 DO
		INSERT INTO users(name, birthday_at) VALUES (CONCAT('username_', i), NOW());
		SET x = x + 1;
	END WHILE;
END