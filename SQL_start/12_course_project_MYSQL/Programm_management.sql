-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `contract_id` int NOT NULL AUTO_INCREMENT,
  `partner_partner_id` int NOT NULL,
  `project_project_id` int NOT NULL,
  `contract_date` datetime NOT NULL,
  `description` mediumtext NOT NULL,
  `contract_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`contract_id`),
  KEY `fk_contract_partner1_idx` (`partner_partner_id`),
  KEY `fk_contract_project1_idx` (`project_project_id`),
  CONSTRAINT `fk_contract_partner1` FOREIGN KEY (`partner_partner_id`) REFERENCES `partner` (`partner_id`),
  CONSTRAINT `fk_contract_project1` FOREIGN KEY (`project_project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (1,1,7,'2021-12-29 14:30:54','Договор на проектирование производственного помещения и инфраструктуры',500000.00),(2,2,3,'2021-12-29 14:30:54','Поставка офисной мебели',100000.00),(3,3,2,'2021-12-29 14:30:54','Обучение сотрудников методам \"Бережливого производства\"',100000.00),(4,2,5,'2021-12-29 14:30:54','Закупка столов для испытытельных стендов',50000.00);
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!50001 DROP VIEW IF EXISTS `contracts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `contracts` AS SELECT 
 1 AS `Наименование проекта`,
 1 AS `Договор`,
 1 AS `Контрагент`,
 1 AS `Описание контрагента`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `overdue_task`
--

DROP TABLE IF EXISTS `overdue_task`;
/*!50001 DROP VIEW IF EXISTS `overdue_task`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `overdue_task` AS SELECT 
 1 AS `Программа`,
 1 AS `Проект`,
 1 AS `Название задачи`,
 1 AS `Исполнитель`,
 1 AS `Дней просрочено`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `partner`
--

DROP TABLE IF EXISTS `partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner` (
  `partner_id` int NOT NULL,
  `name` varchar(245) NOT NULL,
  `adress` varchar(245) NOT NULL,
  `headmaster` varchar(245) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`partner_id`),
  UNIQUE KEY `partner_id_UNIQUE` (`partner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner`
--

LOCK TABLES `partner` WRITE;
/*!40000 ALTER TABLE `partner` DISABLE KEYS */;
INSERT INTO `partner` VALUES (1,'ТехноИнжиниринг','Москва ул. Мира дом 2','Иванов Сергей','Услуги по проектированию'),(2,'ОфиснаяМебель','Москва Рязанский проспект дом 12','Штольц Петр','Продажа офисной мебели'),(3,'Совенок','Пенза ул. Ленина дом 15','Сидорова Мария','Корпоративное обучение');
/*!40000 ALTER TABLE `partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priority`
--

DROP TABLE IF EXISTS `priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `priority` (
  `priority_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`priority_id`),
  UNIQUE KEY `priority_id_UNIQUE` (`priority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priority`
--

LOCK TABLES `priority` WRITE;
/*!40000 ALTER TABLE `priority` DISABLE KEYS */;
INSERT INTO `priority` VALUES (1,'Обычные','Задачи с обычной срочностью'),(2,'Срочные','Срочные задачи'),(3,'Особо срочные','Все бросать и бежать выполнять');
/*!40000 ALTER TABLE `priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `programm_id` int NOT NULL AUTO_INCREMENT COMMENT 'Идетнтификатор программы',
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT NULL,
  `programm_name` varchar(245) NOT NULL,
  `user_user_id` int NOT NULL COMMENT 'Programm manager',
  `description` varchar(245) DEFAULT NULL,
  `closed` int DEFAULT NULL,
  PRIMARY KEY (`programm_id`),
  UNIQUE KEY `programm_id_UNIQUE` (`programm_id`),
  KEY `fk_programm_user_idx` (`user_user_id`),
  CONSTRAINT `fk_programm_user` FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,'2021-04-29 14:27:23','2023-04-29 14:27:23','Повышение операционной эффективности',1,'Комплекс проектов, направленных на системное повышение производительности труда',NULL),(2,'2021-04-29 14:29:31','2023-04-29 14:27:23','Развитие практики R&D',2,'Развитие практики перспективных разработок и исследований',NULL),(3,'2021-04-29 14:30:54','2022-06-29 14:27:23','Исследование рынка',3,'Получение оперативных и достоверных данных о состоянии рынка и конкурентах',NULL),(4,'2021-04-29 14:33:22','2022-12-29 14:27:23','Строительство производства пластиковой тары',4,'Проектирование, закупка, строительство и ввод в эксплуатацию производственной линии по изготовлению пластиковой тары',NULL);
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_goal`
--

DROP TABLE IF EXISTS `program_goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program_goal` (
  `program_goal_id` int NOT NULL AUTO_INCREMENT,
  `program_programm_id` int NOT NULL,
  `goal_end_plan` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(245) NOT NULL,
  PRIMARY KEY (`program_goal_id`,`program_programm_id`),
  KEY `fk_program_goal_program1_idx` (`program_programm_id`),
  CONSTRAINT `fk_program_goal_program1` FOREIGN KEY (`program_programm_id`) REFERENCES `program` (`programm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_goal`
--

LOCK TABLES `program_goal` WRITE;
/*!40000 ALTER TABLE `program_goal` DISABLE KEYS */;
INSERT INTO `program_goal` VALUES (1,1,'2021-04-29 14:39:41','Внедрить процессный подход'),(2,1,'2022-04-29 14:40:35','Оптимизировать офисное пространство'),(3,1,'2022-07-29 14:40:35','Оптимизировать организационную структуру'),(4,1,'2023-04-29 14:40:35','Сделать удобными рабочие места'),(5,2,'2021-10-29 14:46:18','Защита концепции напраления перспективных разработок'),(6,2,'2022-04-29 14:46:18','Создать подразделение перспективных разработок'),(7,2,'2023-01-29 14:46:18','Повысить долю инновационных продуктов в портфеле до 30%'),(8,3,'2021-10-29 14:48:58','Еженедельные отчеты о состоянии рынка'),(9,3,'2021-10-29 14:48:58','Разработана стратегия конкурентоной борьбы'),(10,3,'2022-04-29 14:48:58','Среднее время реакции на действия конкурентов сократилось на 50%'),(11,4,'2021-04-29 14:57:54','Цех пластиковой тары введен в эксплуатацию'),(12,4,'2021-10-29 14:57:54','Производство пластиковой тары вышло на точку безубыточночти'),(13,4,'2022-06-29 14:27:23','Получены годовая прибыль 1 000 000 рублей'),(14,4,'2023-12-29 14:27:23','Получена годовая прибыль 10 000 000 рублей');
/*!40000 ALTER TABLE `program_goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `programm budjets`
--

DROP TABLE IF EXISTS `programm budjets`;
/*!50001 DROP VIEW IF EXISTS `programm budjets`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `programm budjets` AS SELECT 
 1 AS `Программа`,
 1 AS `плановые затраты программы`,
 1 AS `Проект`,
 1 AS `плановые затраты`,
 1 AS `фактические затраты`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `programm_budget`
--

DROP TABLE IF EXISTS `programm_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programm_budget` (
  `programm_budget_id` int NOT NULL AUTO_INCREMENT,
  `program_programm_id` int NOT NULL,
  `period_start` datetime DEFAULT CURRENT_TIMESTAMP,
  `period_end` datetime DEFAULT CURRENT_TIMESTAMP,
  `cost_plan` decimal(10,2) NOT NULL,
  `cost_actual` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`programm_budget_id`),
  KEY `fk_programm_budget_program1_idx` (`program_programm_id`),
  CONSTRAINT `fk_programm_budget_program1` FOREIGN KEY (`program_programm_id`) REFERENCES `program` (`programm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programm_budget`
--

LOCK TABLES `programm_budget` WRITE;
/*!40000 ALTER TABLE `programm_budget` DISABLE KEYS */;
INSERT INTO `programm_budget` VALUES (1,1,'2021-04-29 15:03:21','2023-04-29 14:27:23',1000000.00,NULL),(2,2,'2021-04-29 15:03:21','2023-04-29 14:27:23',1000000.00,NULL),(3,3,'2021-04-29 15:03:21','2022-06-29 14:27:23',1000000.00,NULL),(4,4,'2021-04-29 15:03:21','2021-12-29 14:27:23',1000000.00,NULL),(5,4,'2021-12-29 14:27:23','2022-12-29 14:27:23',1000000.00,NULL),(6,1,'2021-04-29 15:03:21','2023-04-29 14:27:23',10000.00,NULL);
/*!40000 ALTER TABLE `programm_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `project_id` int NOT NULL AUTO_INCREMENT COMMENT 'Код проекта',
  `program_programm_id` int NOT NULL,
  `user_user_id` int NOT NULL COMMENT 'Project manager',
  `project_type_project_type_id` int NOT NULL,
  `description` varchar(245) DEFAULT NULL,
  `project_start` datetime DEFAULT NULL,
  `project_end` datetime DEFAULT NULL,
  `closed` int DEFAULT NULL,
  PRIMARY KEY (`project_id`,`project_type_project_type_id`),
  UNIQUE KEY `project_id_UNIQUE` (`project_id`),
  KEY `fk_project_program1_idx` (`program_programm_id`),
  KEY `fk_project_user1_idx` (`user_user_id`),
  KEY `fk_project_project_type1_idx` (`project_type_project_type_id`),
  CONSTRAINT `fk_project_program1` FOREIGN KEY (`program_programm_id`) REFERENCES `program` (`programm_id`),
  CONSTRAINT `fk_project_project_type1` FOREIGN KEY (`project_type_project_type_id`) REFERENCES `project_type` (`project_type_id`),
  CONSTRAINT `fk_project_user1` FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,1,14,2,'Реинжинирнг процессов','2021-04-29 14:30:54','2021-12-29 14:30:54',NULL),(2,1,15,2,'Внутреннее обучение','2021-04-29 14:30:54','2021-12-29 14:30:54',NULL),(3,1,16,2,'Закупка и монтаж офисной мебели','2021-04-29 14:30:54','2021-12-29 14:30:54',NULL),(4,2,17,4,'Создание подразделения перспективной разработки','2021-04-29 14:30:54','2021-12-29 14:30:54',NULL),(5,2,18,5,'Закупка испытательных стендов','2021-04-29 14:30:54','2021-12-29 14:30:54',NULL),(6,3,19,4,'Создание службы маркетинга','2021-04-29 14:30:54','2021-12-29 14:30:54',NULL),(7,4,20,5,'Проектирование производства','2021-04-29 14:30:54','2021-12-29 14:30:54',NULL),(8,4,20,4,'Созддание направления производства','2021-04-29 14:30:54','2021-12-29 14:30:54',NULL);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_budget`
--

DROP TABLE IF EXISTS `project_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_budget` (
  `project_budget_id` int NOT NULL AUTO_INCREMENT,
  `project_project_id` int NOT NULL,
  `period_start` datetime NOT NULL,
  `period_end` datetime NOT NULL,
  `cost_plan` decimal(10,2) NOT NULL,
  `cost_actual` decimal(10,2) DEFAULT NULL,
  `description` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`project_budget_id`,`project_project_id`),
  KEY `fk_project_budget_project1_idx` (`project_project_id`),
  CONSTRAINT `fk_project_budget_project1` FOREIGN KEY (`project_project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_budget`
--

LOCK TABLES `project_budget` WRITE;
/*!40000 ALTER TABLE `project_budget` DISABLE KEYS */;
INSERT INTO `project_budget` VALUES (7,1,'2021-04-29 14:30:54','2021-04-29 14:30:54',1000.00,100.00,'Моделирование бизнес процессов'),(8,1,'2021-04-29 14:30:54','2021-04-29 14:30:54',200.00,200.00,'Закупка книг'),(9,1,'2021-04-29 14:30:54','2021-04-29 14:30:54',200.00,500.00,'Представительские расходы'),(10,1,'2021-04-29 14:30:54','2021-04-29 14:30:54',200.00,50.00,'Аренда учебного класса'),(11,2,'2021-04-29 14:30:54','2021-04-29 14:30:54',1000.00,900.00,'Оплата лектора'),(12,2,'2021-04-29 14:30:54','2021-04-29 14:30:54',50000.00,45000.00,'Оплата учебных материалов');
/*!40000 ALTER TABLE `project_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_type`
--

DROP TABLE IF EXISTS `project_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_type` (
  `project_type_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL,
  `description` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`project_type_id`),
  UNIQUE KEY `project_type_id_UNIQUE` (`project_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_type`
--

LOCK TABLES `project_type` WRITE;
/*!40000 ALTER TABLE `project_type` DISABLE KEYS */;
INSERT INTO `project_type` VALUES (1,'Коммерческий проект','Коммерческий проект - прибыль'),(2,'Внутренний проект','Внутренний проект - обеспечение деятельности'),(3,'Пресейл проект','Пресейл проект - цель - коммерческий проект'),(4,'Проект организационного развития','Проект организационного развития - оргструктура'),(5,'Инвестиционный проект','Инвестиционный проект - развитие');
/*!40000 ALTER TABLE `project_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `projects of programms`
--

DROP TABLE IF EXISTS `projects of programms`;
/*!50001 DROP VIEW IF EXISTS `projects of programms`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `projects of programms` AS SELECT 
 1 AS `Проект`,
 1 AS `Наименование программы`,
 1 AS `руководитель программы`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `project_project_id` int NOT NULL,
  `user_user_id` int NOT NULL COMMENT 'responsible ',
  `description` varchar(245) NOT NULL,
  `task_start` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `task_end_plan` datetime NOT NULL,
  `task_end_actual` datetime DEFAULT NULL,
  `priority_priority_id` int NOT NULL DEFAULT '1',
  `task_completed` int DEFAULT NULL,
  `task_costs_actual` varchar(45) DEFAULT NULL COMMENT 'Трудозатраты на задачу, заполняются на уровне приложения.',
  `task_task_id` int DEFAULT NULL COMMENT 'Задача последователь',
  PRIMARY KEY (`task_id`),
  KEY `fk_task_project1_idx` (`project_project_id`),
  KEY `fk_task_user1_idx` (`user_user_id`),
  KEY `fk_task_priority1_idx` (`priority_priority_id`),
  KEY `fk_task_task1_idx` (`task_task_id`),
  CONSTRAINT `fk_task_priority1` FOREIGN KEY (`priority_priority_id`) REFERENCES `priority` (`priority_id`),
  CONSTRAINT `fk_task_project1` FOREIGN KEY (`project_project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `fk_task_task1` FOREIGN KEY (`task_task_id`) REFERENCES `task` (`task_id`),
  CONSTRAINT `fk_task_user1` FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,1,8,'Разработать функциональную модель компании','2021-06-29 14:30:54','2021-08-29 14:30:54',NULL,1,NULL,NULL,NULL),(2,1,8,'Согласовать функциональную модель компании','2021-08-29 14:30:54','2021-09-29 14:30:54',NULL,1,NULL,NULL,1),(4,1,9,'Подготовить анкету и провести опрос по проблемам','2021-03-29 14:30:54','2021-03-29 14:30:54','2021-03-29 14:30:54',1,1,NULL,NULL),(5,1,9,'Сформировать перечень организационных проблем в Компании','2021-03-29 14:30:54','2021-04-01 14:30:54',NULL,1,NULL,NULL,4),(6,2,10,'Сформировать списки на обучение','2021-03-29 14:30:54','2021-05-29 14:30:54',NULL,1,NULL,NULL,NULL),(7,5,13,'Получить каталог оборудования (стендов)','2021-03-29 14:30:54','2021-04-20 14:30:54',NULL,1,NULL,'10',NULL);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL,
  `email` varchar(45) NOT NULL,
  `position` varchar(245) NOT NULL,
  `department` varchar(245) NOT NULL,
  `fired` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Триггер, обновляющий задачи пользователя при увольнении. Устанавливает исполнителем руководителя соответствующего проекта.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Наумов Геннадий Валерианович','ivan@job.ru','Директор','Администрация',NULL),(2,'Демьян Арсенович Гусев','poljakovljubosmisl@rambler.ru','Заместитель директора','Администрация',NULL),(3,'Лазарь Денисович Фадеев','osipgurev@job.ru','Заместитель директора','Администрация',NULL),(4,'Мартынов Терентий Фадеевич','novikovafanasi@fsk.net','Заместитель директора','Администрация',NULL),(5,'Суханова Регина Кузьминична','vladimir11@ip.edu','Заместитель директора','Администрация',NULL),(6,'Блохина Агафья Владимировна','muhinaangelina@ooo.ru','Заместитель директора','Администрация',NULL),(7,'Некрасов Кондрат Дорофеевич','lukinmark@npo.edu','Промышленный альпинист','Отдел кадров',NULL),(8,'Чернов Олимпий Жанович','maksim_1976@yandex.ru','Диктор','Отдел кадров',NULL),(9,'Модест Еремеевич Беляев','vissarionmuravev@ip.net','Бармен','Отдел кадров',NULL),(10,'Осипов Никифор Григорьевич','hristoforfilippov@oao.org','Программист','Отдел кадров',NULL),(11,'Кононова Евдокия Кирилловна','valentina2018@rambler.ru','Проктолог','Отдел кадров',NULL),(12,'Егор Харлампьевич Марков','hristoforgorbunov@rambler.ru','Дерматолог','Отдел кадров',NULL),(13,'Лукина Таисия Антоновна','anikita_37@yahoo.com','Переплётчик','Отдел кадров',NULL),(14,'Вера Оскаровна Игнатьева','andreevlev@zao.info','Руководитель проектов','Проектный офис',NULL),(15,'Давыдова Зинаида Ивановна','ipati37@mail.ru','Руководитель проектов','Проектный офис',NULL),(16,'Александр Ерофеевич Макаров','isa2014@rambler.ru','Руководитель проектов','Проектный офис',NULL),(17,'Аверкий Дмитриевич Жуков','panovaagata@ao.org','Руководитель проектов','Проектный офис',NULL),(18,'Галина Ильинична Сысоева','gedeon08@hotmail.com ','Руководитель проектов','Проектный офис',NULL),(19,'Екатерина Валентиновна Виноградова','borislapin@mail.ru','Руководитель проектов','Проектный офис',NULL),(20,'Дорофеева Ираида Тарасовна','avde2007@rambler.ru','Руководитель проектов','Проектный офис',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_AFTER_UPDATE` AFTER UPDATE ON `user` FOR EACH ROW BEGIN
if user.fired = 1 then
	update mydb.task set user_user_id = 
	(select project.user_user_id from mydb.project where project.project_id = task.project_project_id);
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `help` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `help`()
BEGIN
select "База данных проектов и программ проектов";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_task_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_task_count`(id int)
BEGIN
DECLARE userid int;
select count(*) into userid from mydb.task where user_user_id = id and task_completed <=> null;
select userid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `contracts`
--

/*!50001 DROP VIEW IF EXISTS `contracts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `contracts` AS select `project`.`description` AS `Наименование проекта`,`contract`.`description` AS `Договор`,`partner`.`name` AS `Контрагент`,`partner`.`description` AS `Описание контрагента` from ((`project` join `contract`) join `partner`) where ((`project`.`project_id` = `contract`.`project_project_id`) and (`partner`.`partner_id` = `contract`.`partner_partner_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `overdue_task`
--

/*!50001 DROP VIEW IF EXISTS `overdue_task`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `overdue_task` AS select (select `program`.`programm_name` from `program` where (`program`.`programm_id` = (select `project`.`program_programm_id` from `project` where (`project`.`project_id` = `task`.`project_project_id`)))) AS `Программа`,(select `project`.`description` from `project` where (`project`.`project_id` = `task`.`project_project_id`)) AS `Проект`,`task`.`description` AS `Название задачи`,(select `user`.`name` from `user` where (`user`.`user_id` = `task`.`user_user_id`)) AS `Исполнитель`,(select (cast(now() as date) - cast(`task`.`task_end_plan` as date))) AS `Дней просрочено` from `task` where ((`task`.`task_end_plan` < now()) and (`task`.`task_completed` <=> NULL)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `programm budjets`
--

/*!50001 DROP VIEW IF EXISTS `programm budjets`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `programm budjets` AS select `program`.`programm_name` AS `Программа`,(select sum(`programm_budget`.`cost_plan`)) AS `плановые затраты программы`,`project`.`description` AS `Проект`,(select sum(`project_budget`.`cost_plan`)) AS `плановые затраты`,(select sum(`project_budget`.`cost_actual`)) AS `фактические затраты` from (((`program` left join `project` on((`project`.`program_programm_id` = `program`.`programm_id`))) left join `programm_budget` on((`programm_budget`.`program_programm_id` = `program`.`programm_id`))) left join `project_budget` on((`project`.`project_id` = `project_budget`.`project_project_id`))) group by `project`.`description` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `projects of programms`
--

/*!50001 DROP VIEW IF EXISTS `projects of programms`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `projects of programms` AS select `project`.`description` AS `Проект`,`program`.`programm_name` AS `Наименование программы`,`user`.`name` AS `руководитель программы` from ((`program` join `project`) join `user`) where ((`project`.`program_programm_id` = `program`.`programm_id`) and (`program`.`user_user_id` = `user`.`user_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-02 17:42:50
