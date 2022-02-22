-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: vk
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
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_community_user1_idx` (`admin_id`),
  CONSTRAINT `fk_community_user1` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES (1,'autem','Nesciunt nemo laudantium quis temporibus rerum dolor sit.',102),(2,'minus','Velit ea similique odio illum aliquid nostrum sit.',106),(3,'dicta','Et voluptas ut voluptatibus accusamus ut rerum quas.',34),(4,'aut','Voluptatem quaerat repellat inventore ut a vel.',98),(5,'quae','Ipsa tenetur aliquam est.',58),(6,'ex','Et qui cumque consequatur aut quae soluta.',50),(7,'nihil','Dolor excepturi temporibus voluptas dolorem et rerum iure.',81),(8,'non','Omnis voluptas rerum ipsum velit numquam eos commodi quas.',95),(9,'enim','Quae velit nesciunt sed expedita quo.',112),(10,'explicabo','Qui molestiae quibusdam natus expedita et nemo.',115);
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_request`
--

DROP TABLE IF EXISTS `friend_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_request` (
  `from_user_id` int unsigned NOT NULL,
  `to_user_id` int unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1 - отказ; 0 - запрос; 1 - дружба',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`from_user_id`,`to_user_id`),
  KEY `fk_friend_request_user1_idx` (`from_user_id`),
  KEY `fk_friend_request_user2_idx` (`to_user_id`),
  CONSTRAINT `fk_friend_request_user1` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_friend_request_user2` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_request`
--

LOCK TABLES `friend_request` WRITE;
/*!40000 ALTER TABLE `friend_request` DISABLE KEYS */;
INSERT INTO `friend_request` VALUES (18,19,0,'1980-09-13 08:00:38',NULL),(19,67,-1,'1993-01-29 00:27:48','2021-03-23 22:13:17'),(22,94,-1,'1996-07-18 16:11:53','1987-09-19 13:44:54'),(25,95,1,'2004-06-06 04:01:01','1978-10-19 20:04:18'),(26,49,1,'2018-07-22 20:59:43','2000-04-28 14:50:01'),(27,69,-1,'2007-04-10 23:15:42','2021-03-23 22:13:17'),(28,58,-1,'2005-05-05 23:59:18','1982-07-25 06:07:38'),(29,50,-1,'1982-02-04 22:19:19','2021-03-23 22:13:17'),(30,30,1,'2010-06-18 07:35:36','2021-03-23 22:13:17'),(34,95,1,'1985-09-03 13:13:48','2021-03-23 22:13:17'),(35,24,1,'1981-12-27 23:39:30','1982-07-24 04:58:19'),(35,105,-1,'2012-08-16 15:40:37','2021-03-23 22:13:17'),(37,68,-1,'2020-03-07 15:24:53','2007-10-31 20:09:57'),(37,107,1,'2012-12-05 22:25:40','2021-03-23 22:13:17'),(39,19,0,'2019-04-20 13:30:06',NULL),(41,33,0,'1978-10-26 15:03:58',NULL),(41,36,0,'2001-08-15 23:02:57',NULL),(41,57,0,'2016-12-18 06:25:19',NULL),(41,73,1,'1981-12-09 16:59:20','2021-03-23 22:13:17'),(41,80,1,'2015-11-16 10:37:11','2021-03-23 22:13:17'),(42,16,-1,'1973-12-08 06:24:29','2013-09-05 02:58:58'),(42,56,0,'1978-06-26 13:10:07',NULL),(43,24,0,'2005-05-07 10:53:22',NULL),(44,95,1,'2004-07-01 08:21:50','1984-10-17 06:56:45'),(45,100,-1,'1982-02-24 17:01:57','2021-03-23 22:13:17'),(47,107,1,'2020-07-28 06:26:18','1982-05-19 07:54:43'),(49,43,-1,'1997-03-17 21:34:38','1986-04-09 18:03:10'),(49,49,0,'1987-02-15 00:31:16',NULL),(49,98,0,'1974-11-11 15:09:20',NULL),(51,55,0,'1999-07-27 14:43:27',NULL),(51,75,1,'2012-07-02 17:51:02','2014-05-23 07:33:51'),(52,84,1,'1970-02-05 06:51:27','2004-11-08 07:08:05'),(54,93,1,'1981-08-13 07:50:11','2021-03-23 22:13:17'),(55,48,0,'1998-05-07 16:49:34',NULL),(56,93,0,'1992-09-29 14:16:47',NULL),(56,104,0,'2006-10-01 05:03:52',NULL),(56,113,0,'2002-02-03 09:42:35',NULL),(57,37,0,'1990-09-13 11:41:26',NULL),(57,99,-1,'1989-06-26 14:50:52','2021-03-23 22:13:17'),(58,54,-1,'1992-06-11 15:04:12','1980-05-28 06:14:38'),(58,57,1,'2006-10-30 16:21:23','2011-07-21 15:16:12'),(58,81,0,'1977-02-24 05:57:52',NULL),(63,18,1,'1989-10-08 09:48:37','2011-09-28 16:42:15'),(65,60,1,'2020-03-04 00:37:16','2021-03-23 22:13:17'),(65,90,1,'1991-06-23 08:49:53','2021-03-23 22:13:17'),(66,16,0,'1994-07-05 16:24:52',NULL),(66,99,1,'2007-10-26 05:18:45','2021-03-23 22:13:17'),(73,58,-1,'1986-04-04 02:03:03','1979-10-17 03:20:18'),(73,85,0,'2018-05-13 22:54:56',NULL),(74,44,0,'1985-10-22 01:12:25',NULL),(75,65,0,'2004-03-09 10:08:25',NULL),(77,86,0,'1981-08-13 01:40:03',NULL),(78,17,1,'2010-11-13 20:58:01','2021-03-23 22:13:17'),(78,26,-1,'2000-11-18 14:16:57','1978-11-20 23:43:29'),(80,17,-1,'1986-07-26 07:55:44','1997-04-30 16:40:46'),(80,62,0,'1999-03-08 08:03:27',NULL),(81,79,1,'1978-11-10 10:11:10','2004-08-21 01:14:43'),(82,22,0,'2003-06-23 01:09:44',NULL),(82,52,0,'1997-01-04 07:57:38',NULL),(82,64,-1,'1974-01-02 15:34:35','2021-03-23 22:13:17'),(82,84,1,'1973-07-25 11:48:04','2003-06-12 20:12:37'),(82,107,-1,'2007-07-04 22:41:10','2021-03-23 22:13:17'),(82,115,1,'1987-12-15 08:19:45','1974-04-26 00:52:17'),(83,34,-1,'2013-03-27 13:47:51','2021-03-23 22:13:17'),(83,46,1,'1982-08-27 16:07:49','2021-03-23 22:13:17'),(84,37,0,'1985-12-22 10:32:39',NULL),(85,46,-1,'1992-07-13 08:30:09','2021-03-23 22:13:17'),(85,64,-1,'2004-04-29 13:56:29','1977-07-21 08:58:17'),(86,43,-1,'1987-08-13 06:09:31','2021-03-23 22:13:17'),(87,53,1,'2009-03-27 15:33:25','2021-03-23 22:13:17'),(88,21,0,'2008-12-12 06:36:12',NULL),(89,22,-1,'1976-04-10 16:28:15','2021-03-23 22:13:17'),(89,24,1,'1979-05-17 23:49:52','1989-01-07 08:21:22'),(89,83,0,'1972-12-08 16:27:07',NULL),(91,71,-1,'2011-09-24 19:55:49','2021-03-23 22:13:17'),(92,92,0,'1990-04-18 02:52:21',NULL),(95,30,1,'1983-06-14 14:43:38','2019-06-25 10:37:48'),(96,82,-1,'1994-09-21 08:38:20','2013-08-31 06:33:00'),(97,18,0,'2007-09-15 00:30:59',NULL),(97,57,-1,'1998-08-06 20:55:24','2010-01-16 23:15:21'),(98,38,0,'2007-07-09 08:58:18',NULL),(98,83,1,'1970-08-16 07:09:15','1997-01-09 21:22:14'),(99,21,1,'1990-12-06 20:47:53','2021-03-23 22:13:17'),(99,67,0,'1994-12-15 04:34:17',NULL),(100,18,0,'1996-03-22 19:56:08',NULL),(101,63,1,'2011-07-01 02:16:12','1997-02-05 05:18:35'),(101,78,-1,'2020-06-24 07:58:35','1975-01-20 21:58:05'),(104,27,-1,'2006-04-07 12:04:55','2021-03-23 22:13:17'),(109,70,1,'1990-11-28 02:23:54','2021-03-23 22:13:17'),(109,107,-1,'2019-09-28 01:16:21','2021-03-23 22:13:17'),(111,31,1,'1981-12-07 06:34:06','2021-03-23 22:13:17'),(111,43,1,'2014-10-13 12:16:37','1980-04-08 21:35:15'),(111,48,0,'2012-08-24 01:43:28',NULL),(111,58,0,'1975-02-04 01:02:13',NULL),(111,75,-1,'2001-09-16 00:07:38','2021-03-23 22:13:17'),(112,22,0,'2001-06-11 14:04:08',NULL),(113,42,0,'2019-08-20 08:59:09',NULL),(114,101,1,'1997-01-09 06:04:10','1976-09-21 05:00:34'),(115,101,1,'2006-06-29 00:18:07','1972-06-12 23:16:58');
/*!40000 ALTER TABLE `friend_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `media_id` int unsigned DEFAULT NULL,
  `post_id` int unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_UNIQUE` (`user_id`,`media_id`),
  UNIQUE KEY `post_UNIQUE` (`user_id`,`post_id`),
  KEY `fk_likes_user1_idx` (`user_id`),
  KEY `fk_likes_media1_idx` (`media_id`),
  KEY `fk_likes_post1_idx` (`post_id`),
  CONSTRAINT `fk_likes_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_likes_post1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `fk_likes_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,63,11,NULL,'2007-01-31 15:12:59'),(2,105,31,NULL,'1994-04-13 02:08:19'),(3,64,64,NULL,'1998-03-15 23:34:55'),(4,46,37,NULL,'1981-01-29 00:29:16'),(5,18,17,NULL,'1980-07-03 23:53:43'),(6,41,58,NULL,'1995-06-29 14:02:02'),(7,113,4,NULL,'2008-08-17 13:04:24'),(8,93,6,NULL,'2004-12-12 14:24:20'),(9,72,22,NULL,'1999-10-08 07:10:49'),(10,48,97,NULL,'1987-10-27 06:42:56'),(11,58,44,NULL,'2004-11-14 19:59:47'),(12,102,34,NULL,'1990-11-03 18:38:15'),(13,18,82,NULL,'2011-07-31 05:04:56'),(14,30,13,NULL,'1970-01-31 02:58:31'),(15,111,15,NULL,'1987-07-05 01:00:30'),(16,115,41,NULL,'1972-01-12 21:48:03'),(17,53,38,NULL,'2012-10-01 17:58:56'),(18,56,16,NULL,'1971-09-07 09:34:18'),(19,71,72,NULL,'1996-04-19 01:27:59'),(20,51,5,NULL,'1972-06-07 21:34:36'),(21,84,48,NULL,'1993-08-08 15:34:27'),(22,27,35,NULL,'2018-08-27 02:01:51'),(23,101,37,NULL,'2020-03-22 05:52:35'),(24,38,51,NULL,'1984-10-04 04:11:54'),(25,111,46,NULL,'1999-11-28 11:36:37'),(26,101,46,NULL,'2010-09-06 00:27:11'),(27,48,83,NULL,'2014-04-27 12:55:05'),(28,99,24,NULL,'1973-02-27 23:40:11'),(29,55,79,NULL,'2010-10-16 21:35:35'),(30,33,15,NULL,'2018-02-15 20:12:53'),(31,107,83,NULL,'1999-06-09 07:50:55'),(32,25,95,NULL,'1978-08-12 11:46:40'),(33,76,80,NULL,'2011-03-23 01:33:59'),(34,108,3,NULL,'1974-06-16 04:41:06'),(35,54,99,NULL,'1987-03-31 11:54:21'),(36,114,84,NULL,'2015-03-03 15:08:23'),(37,114,17,NULL,'1994-12-18 06:19:58'),(38,52,1,NULL,'1994-12-15 02:18:47'),(39,105,40,NULL,'1980-01-16 13:50:30'),(40,30,57,NULL,'2007-10-06 21:27:42'),(41,60,49,NULL,'2013-06-11 14:39:53'),(42,38,58,NULL,'1977-10-26 01:49:07'),(43,50,18,NULL,'1999-04-26 13:33:59'),(44,99,11,NULL,'1984-03-28 04:49:02'),(45,98,49,NULL,'2002-06-07 20:30:40'),(46,43,48,NULL,'1993-05-27 11:43:54'),(47,33,46,NULL,'1999-08-17 19:45:26'),(48,105,82,NULL,'2012-11-03 01:54:00'),(49,101,72,NULL,'1995-09-21 17:12:18'),(50,76,86,NULL,'2006-03-19 11:48:33'),(51,65,NULL,92,'2007-07-19 18:57:05'),(52,37,NULL,49,'1981-09-07 11:23:12'),(53,103,NULL,67,'1976-02-09 11:09:02'),(54,49,NULL,77,'2001-06-09 05:12:14'),(55,97,NULL,26,'2016-04-28 20:37:30'),(56,43,NULL,73,'1990-04-03 14:05:18'),(57,73,NULL,19,'2004-06-23 12:00:24'),(58,20,NULL,1,'2020-06-07 17:55:26'),(59,66,NULL,72,'1981-04-20 22:15:54'),(60,53,NULL,58,'2020-10-11 10:43:35'),(61,96,NULL,88,'1993-04-29 16:11:46'),(62,88,NULL,41,'1987-01-01 10:43:47'),(63,37,NULL,29,'2015-11-14 03:06:10'),(64,103,NULL,100,'2017-07-18 15:30:00'),(65,80,NULL,53,'2006-02-28 09:00:25'),(66,106,NULL,34,'1974-03-04 04:37:05'),(67,79,NULL,31,'2011-07-29 17:40:44'),(68,97,NULL,18,'1980-06-11 04:14:30'),(69,97,NULL,91,'2021-02-14 01:59:25'),(70,69,NULL,25,'1980-08-17 13:22:11'),(71,26,NULL,9,'2004-05-26 13:29:30'),(72,114,NULL,15,'2011-09-30 17:39:34'),(73,55,NULL,8,'1996-09-14 13:48:29'),(74,84,NULL,36,'1976-08-20 16:29:56'),(75,83,NULL,45,'2010-06-14 06:09:51'),(76,36,NULL,81,'2018-08-12 09:18:58'),(77,69,NULL,76,'2012-08-04 20:49:20'),(78,100,NULL,74,'2019-03-31 03:01:48'),(79,17,NULL,24,'2020-02-10 09:12:57'),(80,108,NULL,10,'2000-11-28 02:09:48'),(81,33,NULL,78,'2000-01-01 02:22:41'),(82,41,NULL,17,'2000-11-30 16:19:26'),(83,55,NULL,78,'1971-12-07 13:23:01'),(84,63,NULL,27,'1982-06-15 11:32:14'),(85,98,NULL,41,'2017-12-06 13:51:39'),(86,42,NULL,45,'2010-10-03 18:39:26'),(87,23,NULL,12,'2007-07-03 12:56:12'),(88,98,NULL,61,'1987-05-29 17:33:41'),(89,72,NULL,92,'2021-03-19 02:31:00'),(90,96,NULL,76,'2007-01-22 22:52:18'),(91,105,NULL,71,'1986-01-30 20:39:20'),(92,83,NULL,64,'1977-01-31 02:24:44'),(93,99,NULL,96,'1997-03-05 02:58:01'),(94,77,NULL,97,'1990-04-13 17:47:52'),(95,104,NULL,65,'2004-04-30 19:58:41'),(96,44,NULL,55,'1993-03-30 02:41:21'),(97,88,NULL,97,'1984-10-14 01:04:26'),(98,100,NULL,25,'2017-11-28 10:01:04'),(99,61,NULL,54,'1996-10-04 07:38:28'),(100,53,NULL,75,'2010-11-01 15:23:57');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `url` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` blob,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_media_media_type1_idx` (`media_type_id`),
  KEY `fk_media_user1_idx` (`user_id`),
  CONSTRAINT `fk_media_media_type1` FOREIGN KEY (`media_type_id`) REFERENCES `media_type` (`id`),
  CONSTRAINT `fk_media_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `media_chk_1` CHECK (json_valid(`metadata`))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,77,'application/yang',NULL,NULL,'1993-08-17 13:45:29'),(2,2,95,'application/vnd.ezpix-package',NULL,NULL,'1998-05-24 02:02:14'),(3,3,74,'application/vnd.stepmania.stepchart',NULL,NULL,'1989-04-28 02:03:35'),(4,1,35,'application/x-texinfo',NULL,NULL,'1979-11-15 11:14:40'),(5,2,17,'application/vnd.sailingtracker.track',NULL,NULL,'1975-06-03 15:37:41'),(6,3,56,'application/x-msclip',NULL,NULL,'2020-07-25 10:05:52'),(7,1,47,'application/vnd.wolfram.player',NULL,NULL,'2001-11-11 18:39:51'),(8,2,77,'model/vnd.gtw',NULL,NULL,'1976-09-08 11:27:10'),(9,3,103,'video/x-ms-wvx',NULL,NULL,'1988-05-13 00:00:27'),(10,1,104,'application/vnd.epson.ssf',NULL,NULL,'1995-11-13 10:17:10'),(11,2,69,'application/vnd.syncml.dm+xml',NULL,NULL,'1988-08-30 08:38:03'),(12,3,84,'text/x-vcalendar',NULL,NULL,'1987-04-02 03:19:18'),(13,1,99,'application/vnd.sema',NULL,NULL,'2020-09-01 11:58:18'),(14,2,62,'application/vnd.openxmlformats-officedocument.wordprocessingml.template',NULL,NULL,'2020-06-18 01:05:24'),(15,3,63,'application/xproc+xml',NULL,NULL,'2011-12-03 00:40:11'),(16,1,67,'image/x-mrsid-image',NULL,NULL,'1996-12-30 16:36:10'),(17,2,109,'application/vnd.ms-ims',NULL,NULL,'1996-03-30 13:40:52'),(18,3,68,'application/x-cdlink',NULL,NULL,'1987-05-31 07:53:21'),(19,1,84,'application/vnd.lotus-organizer',NULL,NULL,'1985-03-05 23:46:53'),(20,2,63,'audio/x-wav',NULL,NULL,'1987-07-02 06:47:45'),(21,3,33,'text/cache-manifest',NULL,NULL,'2002-06-01 23:19:36'),(22,1,22,'application/vnd.shana.informed.formdata',NULL,NULL,'2013-11-30 06:46:15'),(23,2,110,'application/x-mscardfile',NULL,NULL,'1996-05-14 21:22:03'),(24,3,64,'video/x-flv',NULL,NULL,'1998-03-01 09:05:21'),(25,1,67,'image/x-xpixmap',NULL,NULL,'1989-08-06 15:20:17'),(26,2,24,'application/yin+xml',NULL,NULL,'1989-04-01 22:07:07'),(27,3,33,'model/x3d+binary',NULL,NULL,'1972-06-04 04:01:24'),(28,1,79,'application/wspolicy+xml',NULL,NULL,'2000-04-25 02:08:23'),(29,2,40,'text/vnd.in3d.3dml',NULL,NULL,'1992-09-16 07:19:22'),(30,3,82,'application/vnd.oasis.opendocument.image',NULL,NULL,'2020-12-08 04:56:40'),(31,1,76,'application/x-chat',NULL,NULL,'2005-02-05 17:55:29'),(32,2,102,'application/vnd.oasis.opendocument.presentation-template',NULL,NULL,'1998-12-24 15:05:54'),(33,3,62,'text/uri-list',NULL,NULL,'2016-11-21 21:56:00'),(34,1,34,'image/vnd.fastbidsheet',NULL,NULL,'1974-01-17 16:38:35'),(35,2,21,'application/vnd.kde.kword',NULL,NULL,'2006-09-06 01:37:48'),(36,3,63,'video/vnd.dece.mobile',NULL,NULL,'2010-10-10 18:07:18'),(37,1,74,'application/vnd.tcpdump.pcap',NULL,NULL,'1977-12-10 11:30:15'),(38,2,52,'application/x-msclip',NULL,NULL,'1992-05-09 17:05:01'),(39,3,25,'application/pkixcmp',NULL,NULL,'2019-02-26 03:59:33'),(40,1,61,'application/vnd.sun.xml.impress',NULL,NULL,'1975-06-13 09:29:13'),(41,2,41,'image/x-cmu-raster',NULL,NULL,'1988-01-16 18:05:45'),(42,3,79,'application/vnd.ms-artgalry',NULL,NULL,'1971-03-17 13:45:03'),(43,1,30,'text/vnd.curl.mcurl',NULL,NULL,'1971-02-23 08:32:04'),(44,2,24,'video/x-ms-wvx',NULL,NULL,'1983-04-25 23:44:22'),(45,3,25,'application/vnd.lotus-1-2-3',NULL,NULL,'1971-03-25 14:51:39'),(46,1,78,'image/vnd.fujixerox.edmics-mmr',NULL,NULL,'2016-06-04 13:57:59'),(47,2,76,'video/webm',NULL,NULL,'2002-10-09 21:44:09'),(48,3,19,'application/vnd.epson.msf',NULL,NULL,'2002-05-13 22:43:55'),(49,1,31,'video/x-f4v',NULL,NULL,'1982-02-07 02:18:18'),(50,2,45,'text/vnd.graphviz',NULL,NULL,'2006-01-09 22:42:21'),(51,3,66,'model/x3d+vrml',NULL,NULL,'1977-02-10 00:45:35'),(52,1,48,'application/x-t3vm-image',NULL,NULL,'2021-01-26 16:29:05'),(53,2,52,'application/x-blorb',NULL,NULL,'2017-01-03 00:54:15'),(54,3,61,'audio/x-mpegurl',NULL,NULL,'2018-07-15 02:19:38'),(55,1,96,'application/sbml+xml',NULL,NULL,'2005-12-18 23:24:36'),(56,2,104,'application/vnd.lotus-freelance',NULL,NULL,'2009-09-13 14:55:04'),(57,3,69,'application/vnd.openxmlformats-officedocument.wordprocessingml.template',NULL,NULL,'2002-06-12 16:47:28'),(58,1,113,'video/quicktime',NULL,NULL,'2015-06-19 18:21:06'),(59,2,67,'application/vnd.ms-powerpoint.slide.macroenabled.12',NULL,NULL,'2006-09-11 19:15:25'),(60,3,94,'video/mpeg',NULL,NULL,'1975-06-22 22:15:07'),(61,1,80,'audio/x-ms-wax',NULL,NULL,'2020-01-21 09:18:30'),(62,2,27,'application/vnd.recordare.musicxml+xml',NULL,NULL,'2016-11-18 06:08:55'),(63,3,80,'application/xenc+xml',NULL,NULL,'1981-02-23 16:07:27'),(64,1,26,'application/x-stuffit',NULL,NULL,'2001-10-03 11:37:10'),(65,2,46,'application/zip',NULL,NULL,'2016-05-23 06:08:46'),(66,3,85,'application/vnd.xara',NULL,NULL,'1998-06-30 08:42:51'),(67,1,74,'video/vnd.dece.video',NULL,NULL,'1981-08-02 14:34:44'),(68,2,105,'application/sbml+xml',NULL,NULL,'1988-01-30 13:49:56'),(69,3,22,'application/x-tex-tfm',NULL,NULL,'1970-02-13 07:06:43'),(70,1,84,'application/vnd.ms-excel.template.macroenabled.12',NULL,NULL,'1982-11-02 05:25:56'),(71,2,50,'image/vnd.fastbidsheet',NULL,NULL,'2019-08-25 12:36:49'),(72,3,48,'application/vnd.rn-realmedia-vbr',NULL,NULL,'1991-06-01 01:27:35'),(73,1,47,'application/vnd.fdf',NULL,NULL,'2014-08-15 19:50:01'),(74,2,65,'application/x-director',NULL,NULL,'1972-05-09 07:07:39'),(75,3,57,'application/wspolicy+xml',NULL,NULL,'2016-07-04 14:09:35'),(76,1,57,'application/rtf',NULL,NULL,'1992-02-22 11:44:51'),(77,2,28,'application/x-freearc',NULL,NULL,'2012-02-12 06:53:49'),(78,3,17,'image/cgm',NULL,NULL,'2010-08-20 08:26:48'),(79,1,60,'application/vnd.ms-htmlhelp',NULL,NULL,'1980-11-14 18:08:28'),(80,2,43,'application/vnd.ibm.secure-container',NULL,NULL,'1983-10-11 17:06:05'),(81,3,47,'text/calendar',NULL,NULL,'2007-11-01 18:40:26'),(82,1,111,'application/vnd.vsf',NULL,NULL,'2004-09-27 10:59:20'),(83,2,75,'application/x-mie',NULL,NULL,'1985-05-08 19:01:56'),(84,3,83,'application/vnd.wolfram.player',NULL,NULL,'1974-12-13 11:17:45'),(85,1,56,'application/vnd.openxmlformats-officedocument.presentationml.template',NULL,NULL,'2014-09-15 10:34:41'),(86,2,55,'application/vnd.ms-xpsdocument',NULL,NULL,'1990-04-08 09:15:47'),(87,3,71,'video/webm',NULL,NULL,'1976-08-17 09:42:05'),(88,1,109,'text/prs.lines.tag',NULL,NULL,'2010-05-01 20:31:57'),(89,2,53,'application/x-tcl',NULL,NULL,'2006-10-04 07:03:33'),(90,3,22,'image/png',NULL,NULL,'2018-05-05 11:50:36'),(91,1,88,'application/jsonml+json',NULL,NULL,'1992-12-19 17:16:21'),(92,2,17,'image/sgi',NULL,NULL,'2000-12-22 13:38:34'),(93,3,34,'application/xml-dtd',NULL,NULL,'1970-05-25 12:16:42'),(94,1,52,'application/voicexml+xml',NULL,NULL,'2020-11-24 19:50:24'),(95,2,28,'image/ktx',NULL,NULL,'1993-06-28 06:37:48'),(96,3,64,'application/vnd.lotus-screencam',NULL,NULL,'2019-04-29 13:04:35'),(97,1,22,'application/vnd.fdsn.mseed',NULL,NULL,'1979-12-10 12:13:53'),(98,2,87,'audio/webm',NULL,NULL,'2015-04-05 18:23:15'),(99,3,53,'application/vnd.dpgraph',NULL,NULL,'2016-06-05 01:13:39'),(100,1,28,'application/vnd.xfdl',NULL,NULL,'1999-08-31 02:31:55');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_type`
--

DROP TABLE IF EXISTS `media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_type`
--

LOCK TABLES `media_type` WRITE;
/*!40000 ALTER TABLE `media_type` DISABLE KEYS */;
INSERT INTO `media_type` VALUES (1,'image'),(2,' audio'),(3,' video');
/*!40000 ALTER TABLE `media_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` int unsigned NOT NULL,
  `to_user_id` int unsigned NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_id` int unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_message_user1_idx` (`from_user_id`),
  KEY `fk_message_user2_idx` (`to_user_id`),
  KEY `fk_message_media1_idx` (`media_id`),
  CONSTRAINT `fk_message_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_message_user1` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_message_user2` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,82,92,'Tempore id harum esse id nisi.',NULL,'2001-04-13 03:53:05','1997-10-10 09:31:33',NULL),(2,76,113,'',NULL,'1981-01-15 02:39:08',NULL,NULL),(3,113,24,'Eius id at vitae asperiores dicta.',NULL,'1971-10-21 18:06:54','1981-03-06 16:17:06',NULL),(4,25,114,'Veniam eum aspernatur recusandae voluptatem occaecati.',NULL,'2018-07-31 10:24:32','2000-01-19 22:07:08',NULL),(5,101,24,'',NULL,'1974-07-23 18:37:19',NULL,NULL),(6,115,36,'Modi dicta accusantium animi cumque porro et esse.',NULL,'1976-12-25 19:21:21','1984-04-25 03:48:18',NULL),(7,105,71,'',NULL,'2000-06-29 10:55:31',NULL,NULL),(8,50,100,'Non est dolorum illo.',NULL,'1999-06-15 21:05:27','1994-09-16 06:15:13',NULL),(9,59,28,'',NULL,'2014-08-16 14:48:41','1998-08-21 08:43:39',NULL),(10,70,62,'Eius quasi unde minima asperiores.',NULL,'2009-09-18 16:41:40',NULL,NULL),(11,109,56,'Placeat expedita labore quidem repellat et vel quam repellendus.',NULL,'2009-10-03 06:10:07',NULL,NULL),(12,30,106,'Blanditiis in voluptas enim sit assumenda.',NULL,'1976-10-19 03:09:18',NULL,NULL),(13,91,65,'Aut et officia optio rerum.',NULL,'2004-11-23 18:37:10','1972-08-13 20:13:40',NULL),(14,22,21,'',NULL,'1978-09-12 21:47:23','1972-06-25 23:42:38',NULL),(15,102,20,'Iusto minus ratione omnis dignissimos.',NULL,'1975-10-13 22:29:32','1974-02-23 15:37:52',NULL),(16,27,68,'Iusto blanditiis consequuntur eaque qui id molestiae.',NULL,'1984-05-07 17:00:10',NULL,NULL),(17,97,88,'',NULL,'1986-02-26 06:56:07',NULL,NULL),(18,66,95,'Temporibus dolores eveniet sint.',NULL,'2019-08-24 05:05:48',NULL,NULL),(19,96,76,'',NULL,'2002-12-19 16:40:55',NULL,NULL),(20,93,82,'',NULL,'1973-03-27 13:39:18','2001-02-16 04:27:24',NULL),(21,84,93,'',NULL,'2001-04-06 05:29:33','1998-07-01 22:25:13',NULL),(22,102,73,'Sunt enim deleniti commodi dolore placeat.',NULL,'2014-03-21 17:46:31','1971-05-30 10:36:32',NULL),(23,48,36,'',NULL,'1976-05-29 03:26:02','2015-09-28 12:27:23',NULL),(24,58,92,'',NULL,'1990-05-17 19:26:08','1989-12-20 06:35:10',NULL),(25,49,112,'',NULL,'2007-10-30 23:38:24','2000-06-26 05:11:29',NULL),(26,38,43,'',NULL,'1985-04-02 12:11:54',NULL,NULL),(27,52,53,'',NULL,'2013-04-15 04:58:59','2013-06-27 18:04:40',NULL),(28,34,28,'Corrupti vel occaecati asperiores rerum deserunt aliquid quia.',NULL,'1983-01-29 14:50:53',NULL,NULL),(29,103,40,'Blanditiis excepturi eius expedita non eveniet est fugiat.',NULL,'2017-01-27 02:16:53',NULL,NULL),(30,33,90,'',NULL,'2013-02-08 00:19:44','1990-09-10 04:40:34',NULL),(31,45,45,'',NULL,'1992-10-03 01:40:08','1993-05-11 01:25:39',NULL),(32,42,26,'Repellendus sit illo dolorem deleniti ut nostrum nemo.',NULL,'1977-07-26 02:21:27','2015-05-06 12:57:01',NULL),(33,17,93,'Voluptas autem sed sit quod id.',NULL,'1981-07-23 05:50:57','2015-10-10 13:18:23',NULL),(34,105,98,'',NULL,'2015-10-15 21:58:23','1997-04-06 21:32:25',NULL),(35,53,83,'',NULL,'1990-09-14 23:11:06','2006-08-21 10:22:22',NULL),(36,64,22,'Pariatur qui quibusdam nobis omnis.',NULL,'1989-01-05 09:23:20','1987-06-18 17:41:13',NULL),(37,60,51,'Et laborum praesentium assumenda similique accusantium et.',NULL,'1986-03-13 13:39:53','1989-09-03 04:45:12',NULL),(38,80,92,'',NULL,'1995-07-06 01:56:48',NULL,NULL),(39,72,22,'Nihil deserunt voluptate quos dolore ea inventore ipsa.',NULL,'2008-03-10 11:37:47',NULL,NULL),(40,69,106,'Tenetur architecto dolorem omnis autem vitae.',NULL,'1986-11-13 10:12:07',NULL,NULL),(41,19,91,'Quo ut velit id quod tempore.',NULL,'2006-08-09 10:29:58',NULL,NULL),(42,34,56,'',NULL,'1978-11-10 03:21:14',NULL,NULL),(43,29,52,'Cum laboriosam eligendi aliquam nisi laudantium eum excepturi.',NULL,'1971-11-28 19:25:11',NULL,NULL),(44,68,16,'Aut ducimus maxime quo rerum.',NULL,'1983-08-09 19:10:42',NULL,NULL),(45,77,86,'',NULL,'2005-01-05 15:28:29','1975-01-19 23:27:40',NULL),(46,90,106,'Quo eos sapiente maxime ea facilis.',NULL,'1977-04-04 20:59:12','1980-12-11 10:39:57',NULL),(47,115,17,'Sint ipsa a fugiat dicta est.',NULL,'1977-07-28 04:59:04',NULL,NULL),(48,17,17,'',NULL,'1970-06-05 07:24:07','1971-03-06 20:42:35',NULL),(49,94,106,'Laborum sunt quos dolores quis.',NULL,'1994-12-14 21:46:51','2005-06-17 02:20:04',NULL),(50,99,31,'',NULL,'2013-04-13 04:04:18',NULL,NULL),(51,74,48,'Dolor veritatis nulla tempora maiores earum vitae qui.',NULL,'2020-02-23 03:00:24',NULL,NULL),(52,37,18,'',NULL,'2015-09-13 22:05:15','2012-04-17 06:38:33',NULL),(53,84,101,'',NULL,'2014-09-24 06:35:12',NULL,NULL),(54,95,40,'Amet unde molestiae ullam voluptas.',NULL,'2000-06-01 15:23:49','2020-11-21 07:05:39',NULL),(55,108,48,'',NULL,'1993-10-23 19:01:48',NULL,NULL),(56,30,111,'Sequi totam libero eum et voluptatem.',NULL,'1977-10-17 11:44:58','1979-04-10 05:25:57',NULL),(57,24,48,'Unde et ut quo non in eos officia repellat.',NULL,'1989-09-05 13:17:48','2012-02-11 01:38:13',NULL),(58,51,37,'',NULL,'1972-04-09 19:57:11','2006-02-22 08:28:12',NULL),(59,85,104,'Maiores est sed qui.',NULL,'1987-11-24 23:41:54',NULL,NULL),(60,38,46,'Quis fugit in assumenda rem.',NULL,'1979-07-09 13:43:32','2006-03-06 13:02:31',NULL),(61,74,113,'Maxime totam maiores molestias voluptatem in.',NULL,'1973-02-06 08:38:36','1999-06-04 23:34:28',NULL),(62,36,73,'',NULL,'1975-03-02 09:28:19',NULL,NULL),(63,114,38,'',NULL,'1991-07-02 02:22:23','2004-10-10 01:16:04',NULL),(64,75,93,'Est ad recusandae eos odio.',NULL,'1997-10-18 16:57:51','2020-03-26 18:06:32',NULL),(65,28,59,'Doloribus sed quo tempore eius voluptas voluptatum sunt.',NULL,'1997-12-12 23:42:13','2016-03-05 06:45:42',NULL),(66,108,86,'',NULL,'1990-02-24 16:36:52',NULL,NULL),(67,92,30,'Praesentium dolorem corporis veritatis quam.',NULL,'1981-08-19 01:11:35',NULL,NULL),(68,89,60,'',NULL,'2000-01-30 16:46:14',NULL,NULL),(69,16,68,'Dolorem aspernatur tenetur est.',NULL,'1981-03-05 06:40:30',NULL,NULL),(70,84,108,'Consequatur autem repellat quidem eaque at magnam.',NULL,'1996-01-19 05:41:54',NULL,NULL),(71,100,99,'Nihil tenetur a officia odit nesciunt facere nesciunt.',NULL,'2008-07-17 18:54:10',NULL,NULL),(72,104,108,'Autem eius ullam dolore aliquid nihil.',NULL,'2008-02-10 11:04:18','2017-07-27 23:50:56',NULL),(73,32,39,'',NULL,'2016-07-27 16:28:34',NULL,NULL),(74,30,101,'Iusto facere eius eius saepe voluptatem nulla.',NULL,'1971-04-17 15:36:42',NULL,NULL),(75,28,52,'Reprehenderit enim laborum et dolores sit recusandae quam a.',NULL,'1998-06-02 15:29:14','1972-01-19 08:57:49',NULL),(76,32,86,'',NULL,'2006-06-10 06:43:07','2015-02-09 21:31:52',NULL),(77,50,52,'',NULL,'2004-09-18 15:56:59','2015-05-24 16:26:29',NULL),(78,44,48,'Eum tenetur tempora dolorem.',NULL,'2012-07-16 04:45:02',NULL,NULL),(79,75,103,'Qui non qui iusto laborum architecto non magni.',NULL,'1970-07-12 01:59:43','1974-01-11 15:59:08',NULL),(80,26,87,'',NULL,'2016-03-05 01:11:40',NULL,NULL),(81,46,19,'Debitis dolor quaerat molestiae nihil magni dicta eos.',NULL,'2017-02-24 02:31:13','1990-11-30 12:56:06',NULL),(82,58,22,'Et odio aliquam voluptatem.',NULL,'2018-06-15 07:19:32',NULL,NULL),(83,33,32,'Non ratione nam et quas sit distinctio exercitationem.',NULL,'1994-12-26 12:04:11',NULL,NULL),(84,66,34,'Rem explicabo illum molestias id in dolor ad.',NULL,'2002-07-20 12:14:24','2009-10-16 16:55:46',NULL),(85,84,35,'Accusamus minima sed culpa vitae.',NULL,'1973-10-07 16:56:34','2000-12-28 18:58:32',NULL),(86,27,68,'Et aut ut cum maiores quo.',NULL,'1972-12-28 08:50:26','1999-09-03 13:55:35',NULL),(87,19,115,'',NULL,'2002-07-22 15:43:51','1979-03-25 19:18:45',NULL),(88,61,35,'',NULL,'2019-06-11 02:04:47','2019-01-03 18:15:54',NULL),(89,39,76,'',NULL,'2008-08-01 22:58:26',NULL,NULL),(90,21,51,'Ducimus sit aut quia et deleniti aliquid aperiam.',NULL,'1975-10-11 07:35:29','1979-09-07 17:13:03',NULL),(91,113,37,'Nisi pariatur officiis aspernatur et enim.',NULL,'2003-06-17 02:03:02','1985-07-28 15:54:13',NULL),(92,21,47,'Eligendi beatae vel mollitia quis ex laudantium.',NULL,'1994-06-10 11:08:19',NULL,NULL),(93,74,49,'Dolorum ipsam harum cupiditate placeat illo aliquid.',NULL,'1984-04-05 22:38:10','2005-02-15 04:11:57',NULL),(94,80,33,'',NULL,'2014-07-03 23:47:26',NULL,NULL),(95,37,90,'Molestias natus aut nihil quod velit.',NULL,'2009-04-22 03:46:57','2017-05-12 07:48:27',NULL),(96,105,67,'Dolorum qui excepturi fugiat ut ratione.',NULL,'2018-12-16 19:27:26',NULL,NULL),(97,93,48,'Hic recusandae tempore impedit assumenda.',NULL,'2009-03-20 21:45:42',NULL,NULL),(98,73,111,'',NULL,'1970-07-07 01:21:40','1971-09-17 15:32:31',NULL),(99,64,24,'',NULL,'2015-02-11 09:51:08','1983-01-09 10:03:26',NULL),(100,30,32,'Aut non accusamus exercitationem.',NULL,'2020-12-15 01:58:12',NULL,NULL);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `community_id` int unsigned DEFAULT NULL,
  `post_id` int unsigned DEFAULT NULL,
  `text` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` int unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_post_user1_idx` (`user_id`),
  KEY `fk_post_community1_idx` (`community_id`),
  KEY `fk_post_media1_idx` (`media_id`),
  KEY `fk_post_post1_idx` (`post_id`),
  CONSTRAINT `fk_post_community1` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`),
  CONSTRAINT `fk_post_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_post_post1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `fk_post_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,88,NULL,NULL,'Aperiam quae adipisci similique libero autem aperiam sed.',NULL,'2014-05-16 07:33:31'),(2,94,NULL,NULL,'Aut repellendus et quo repellendus aut porro.',NULL,'1984-06-21 18:01:51'),(3,17,NULL,NULL,'Et unde et quo omnis ut eos vero.',NULL,'1970-08-27 16:07:35'),(4,63,NULL,NULL,'Id qui sint architecto earum animi et.',NULL,'2011-06-10 07:02:18'),(5,17,NULL,NULL,'Eum dolore esse ipsum exercitationem sapiente asperiores at.',NULL,'2010-06-24 07:07:05'),(6,57,NULL,NULL,'Sequi qui vel quas dolor quod nihil expedita.',NULL,'2004-01-28 10:58:33'),(7,94,NULL,NULL,'Iusto ex odit tenetur molestiae enim officia accusamus.',NULL,'1975-04-01 19:55:26'),(8,97,NULL,NULL,'Dolorem voluptas illo qui.',NULL,'1981-11-30 11:47:18'),(9,37,NULL,NULL,'Vel voluptate facilis eos dolores.',NULL,'1973-01-11 08:42:21'),(10,90,NULL,NULL,'Odio eveniet eligendi incidunt aliquam ut illo et.',NULL,'2007-07-05 12:19:38'),(11,44,NULL,NULL,'Dicta ullam ut odit sunt itaque.',NULL,'1988-12-13 15:47:04'),(12,21,NULL,NULL,'Et sed ipsum laboriosam odio.',NULL,'1995-02-05 11:39:46'),(13,83,NULL,NULL,'Eveniet dolores mollitia veniam aliquam.',NULL,'2000-11-26 08:13:26'),(14,25,NULL,NULL,'Laboriosam sit perferendis numquam quis atque eaque.',NULL,'2007-08-28 07:11:24'),(15,110,NULL,NULL,'Incidunt quibusdam autem minus inventore.',NULL,'1977-09-20 23:34:48'),(16,50,NULL,NULL,'Consectetur praesentium quae commodi natus odit quo et.',NULL,'1970-09-28 04:43:31'),(17,26,NULL,NULL,'Aliquid voluptatem aut animi autem facilis.',NULL,'1991-06-03 19:40:36'),(18,89,NULL,NULL,'Occaecati id earum necessitatibus illo.',NULL,'1991-12-27 18:46:11'),(19,38,NULL,NULL,'Officiis in voluptate cumque dicta.',NULL,'1974-01-16 01:42:29'),(20,49,NULL,NULL,'Saepe veritatis quia autem neque quas.',NULL,'2008-05-13 07:00:12'),(21,54,NULL,NULL,'Ut tempora laudantium aliquam porro eaque odit omnis.',NULL,'1993-10-11 16:48:50'),(22,96,NULL,NULL,'Vero voluptates facere est qui minus.',NULL,'1998-04-25 16:40:09'),(23,102,NULL,NULL,'Omnis minus ut et dolorem qui beatae sit.',NULL,'1993-06-19 16:18:31'),(24,80,NULL,NULL,'Assumenda aut labore nisi expedita similique facilis et.',NULL,'2010-07-29 08:54:18'),(25,110,NULL,NULL,'Consectetur dolores consequatur reprehenderit unde ex et.',NULL,'2000-12-20 20:05:31'),(26,79,NULL,NULL,'Aut consequatur minima sapiente illo atque consequatur aut.',NULL,'2006-04-23 17:26:38'),(27,89,NULL,NULL,'Omnis aperiam nostrum voluptatem ut magni sed veniam.',NULL,'2020-07-14 22:32:28'),(28,115,NULL,NULL,'Distinctio porro aut eum inventore veritatis.',NULL,'1986-03-24 18:54:35'),(29,53,NULL,NULL,'Tenetur ut voluptatibus eum in.',NULL,'2016-11-17 20:46:28'),(30,45,NULL,NULL,'Numquam dolore autem praesentium hic expedita impedit laudantium.',NULL,'1972-06-17 20:13:40'),(31,109,NULL,NULL,'Error itaque quo officia velit.',NULL,'2013-04-02 20:42:21'),(32,25,NULL,NULL,'Molestias non numquam unde nam necessitatibus.',NULL,'2012-10-11 21:52:50'),(33,23,NULL,NULL,'Autem velit et ea unde cupiditate beatae expedita.',NULL,'1990-07-15 15:34:13'),(34,111,NULL,NULL,'Exercitationem libero alias voluptate eligendi molestiae atque.',NULL,'1986-12-23 23:52:02'),(35,73,NULL,NULL,'Veniam sequi dolorem deserunt sit.',NULL,'2006-12-18 06:59:12'),(36,25,NULL,NULL,'Suscipit hic recusandae consequuntur.',NULL,'2018-10-02 14:41:56'),(37,53,NULL,NULL,'Et amet veritatis culpa labore voluptas.',NULL,'1978-12-05 03:45:04'),(38,52,NULL,NULL,'Aut facilis aut ut sequi.',NULL,'2011-09-25 11:18:04'),(39,107,NULL,NULL,'Qui nihil aut est.',NULL,'1997-03-17 18:10:59'),(40,74,NULL,NULL,'Id pariatur ut et.',NULL,'1995-04-30 10:20:53'),(41,26,NULL,NULL,'Beatae veritatis earum animi et occaecati quia quidem.',NULL,'1970-12-13 18:04:18'),(42,35,NULL,NULL,'Sit velit repellendus debitis iure quisquam eos.',NULL,'2009-11-14 20:56:22'),(43,79,NULL,NULL,'Sint mollitia odio assumenda.',NULL,'2020-04-04 17:29:41'),(44,94,NULL,NULL,'Dolore ex quidem cumque itaque et delectus quam.',NULL,'1994-05-05 17:57:32'),(45,45,NULL,NULL,'Molestiae eos cumque non illum sed nemo.',NULL,'2006-06-30 03:44:00'),(46,73,NULL,NULL,'Debitis id nemo recusandae deleniti minima in.',NULL,'1970-03-14 04:10:03'),(47,28,NULL,NULL,'Minus ab magni nisi.',NULL,'1996-01-11 19:24:48'),(48,55,NULL,NULL,'Quam vel omnis recusandae minima incidunt.',NULL,'1973-07-09 01:07:00'),(49,47,NULL,NULL,'Ab eos corporis quo doloribus inventore.',NULL,'1975-06-24 22:57:12'),(50,50,NULL,NULL,'Culpa sed incidunt ad possimus libero.',NULL,'1997-03-05 18:46:08'),(51,89,NULL,NULL,'Quia esse ipsum a ab omnis consequatur.',NULL,'2015-07-18 04:42:16'),(52,86,NULL,NULL,'Explicabo temporibus facilis sit laudantium.',NULL,'2015-06-01 06:26:10'),(53,31,NULL,NULL,'Quibusdam esse quis id fuga.',NULL,'1973-12-09 04:25:23'),(54,76,NULL,NULL,'Atque at assumenda aut magnam error vel.',NULL,'2007-05-01 02:04:22'),(55,50,NULL,NULL,'Accusantium fugiat et iusto sit voluptas.',NULL,'2015-05-10 12:38:28'),(56,26,NULL,NULL,'Sed quia quidem et harum alias aliquam.',NULL,'2013-02-27 01:25:35'),(57,39,NULL,NULL,'Aut quasi maxime accusamus id commodi vitae nisi.',NULL,'1976-02-11 02:21:31'),(58,24,NULL,NULL,'Sed consequatur cum ad voluptatum consequuntur sed sunt.',NULL,'1993-04-10 03:52:14'),(59,26,NULL,NULL,'Cum aut et nobis vel animi amet laboriosam sint.',NULL,'1970-09-17 12:45:33'),(60,76,NULL,NULL,'Est aperiam voluptatem maxime incidunt maiores non sed.',NULL,'2017-03-23 00:09:40'),(61,53,NULL,NULL,'Ut perspiciatis eveniet quam soluta qui perspiciatis.',NULL,'2017-06-11 08:35:09'),(62,20,NULL,NULL,'Impedit id sit sed.',NULL,'1999-05-22 14:26:37'),(63,86,NULL,NULL,'Aut unde qui magni quos.',NULL,'2014-03-14 21:10:17'),(64,60,NULL,NULL,'Eveniet aut qui dolorem distinctio qui omnis.',NULL,'1989-12-29 18:47:17'),(65,115,NULL,NULL,'Occaecati et dolor ex harum mollitia nisi.',NULL,'2008-10-27 23:38:47'),(66,43,NULL,NULL,'Dolorem accusamus sapiente sunt adipisci reprehenderit.',NULL,'1975-11-09 00:02:29'),(67,70,NULL,NULL,'Possimus sunt in voluptatem ullam voluptatem vero qui.',NULL,'2011-11-04 18:21:10'),(68,53,NULL,NULL,'Architecto quidem consectetur omnis illo.',NULL,'2014-04-09 12:16:36'),(69,80,NULL,NULL,'Consectetur et sint voluptas quis voluptates sequi quia.',NULL,'2001-02-12 17:21:51'),(70,61,NULL,NULL,'Aut cum consectetur est iste dolorem facilis ducimus.',NULL,'1985-06-28 20:14:49'),(71,111,NULL,NULL,'Sint deserunt a sit maiores voluptas est.',NULL,'1975-07-19 23:17:13'),(72,90,NULL,NULL,'Quia incidunt rerum sint ut.',NULL,'1987-02-16 15:14:06'),(73,80,NULL,NULL,'Nobis iste maxime reiciendis quia.',NULL,'2019-12-07 18:26:12'),(74,74,NULL,NULL,'Commodi ipsa sed accusamus sit veritatis.',NULL,'1982-11-10 21:52:58'),(75,69,NULL,NULL,'Rerum eos consequatur consequatur est.',NULL,'1981-07-22 03:47:44'),(76,109,NULL,NULL,'Reiciendis enim iusto aliquam ea facere incidunt amet.',NULL,'1986-03-30 03:40:28'),(77,32,NULL,NULL,'Repellendus illo et est nostrum ad illo qui qui.',NULL,'2000-03-18 16:57:18'),(78,82,NULL,NULL,'Adipisci ut aut mollitia sit.',NULL,'1986-08-15 08:55:18'),(79,49,NULL,NULL,'Doloribus quisquam tempore optio sed perferendis eveniet.',NULL,'1975-04-09 19:34:36'),(80,63,NULL,NULL,'Pariatur aut nobis dolorum iusto error.',NULL,'1995-06-16 05:14:32'),(81,17,NULL,NULL,'Vitae modi adipisci et ut.',NULL,'1987-04-30 18:25:47'),(82,22,NULL,NULL,'Doloribus delectus vero tempore dignissimos itaque sed.',NULL,'1986-09-28 01:36:31'),(83,33,NULL,NULL,'Distinctio rerum amet ut qui.',NULL,'1993-08-30 23:40:35'),(84,32,NULL,NULL,'Adipisci voluptatum odio dolor.',NULL,'1976-10-16 13:47:42'),(85,82,NULL,NULL,'Quia eius earum sunt sunt ab quia aut.',NULL,'2006-12-28 15:25:45'),(86,68,NULL,NULL,'Tempora eligendi aut et consequatur quod mollitia aut.',NULL,'1986-05-22 10:10:13'),(87,43,NULL,NULL,'Aut consequatur et perspiciatis optio dolor ea.',NULL,'1997-10-26 08:25:04'),(88,106,NULL,NULL,'Quos soluta debitis vitae praesentium sunt.',NULL,'2000-01-28 06:21:10'),(89,76,NULL,NULL,'Quo sed atque nihil fugiat consequuntur totam animi.',NULL,'1994-01-09 01:29:05'),(90,53,NULL,NULL,'Earum voluptatibus architecto ut accusantium.',NULL,'2006-08-24 02:18:50'),(91,66,NULL,NULL,'Quidem qui est corrupti mollitia voluptatem ipsa ullam.',NULL,'1981-12-27 22:38:10'),(92,113,NULL,NULL,'Ducimus omnis quia repellendus est incidunt eius sed.',NULL,'1991-06-10 21:24:35'),(93,57,NULL,NULL,'Labore dignissimos a blanditiis deleniti hic dolores quia.',NULL,'2013-11-27 13:56:37'),(94,37,NULL,NULL,'Nobis velit et sint fuga tenetur.',NULL,'2000-02-25 00:31:17'),(95,58,NULL,NULL,'Sint dolor sed alias non eius ea omnis.',NULL,'1988-12-16 21:29:32'),(96,57,NULL,NULL,'Voluptas et ullam qui quasi illo ea.',NULL,'1977-10-05 13:15:29'),(97,65,NULL,NULL,'Ea vero magni ut provident aperiam sint eius.',NULL,'1971-07-01 03:56:30'),(98,113,NULL,NULL,'Ut rem impedit omnis explicabo.',NULL,'1982-08-21 18:50:24'),(99,94,NULL,NULL,'Sunt commodi deserunt veniam amet et et.',NULL,'2019-09-12 14:52:30'),(100,29,NULL,NULL,'Eligendi molestias eius qui est dolor cupiditate tempore.',NULL,'2020-12-30 08:41:25');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `user_id` int unsigned NOT NULL,
  `firstname` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('m','f','x') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `address` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_id` int unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_profile_media1_idx` (`photo_id`),
  CONSTRAINT `fk_profile_media1` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (16,'Reinhold','Murazik','f','2019-04-25','938 Stanton Cape Suite 777',73,NULL),(17,'Kyler','Mills','f','1980-10-24','95716 Kirlin Track',67,NULL),(18,'Brody','Bode','m','2015-11-27','979 Richard Walk',99,NULL),(19,'Ima','Cormier','m','2006-12-20','5559 Stone Wall',27,NULL),(20,'Otto','Roberts','m','1972-03-26','470 Abe Knoll',87,NULL),(21,'Matilda','Collins','f','1973-06-17','2943 Carmela Fall Suite 190',82,NULL),(22,'Omer','Ortiz','m','1977-11-07','359 Chanel Villages Suite 214',89,NULL),(23,'Trever','Gleason','f','1977-01-27','6722 Marty Roads Suite 468',35,NULL),(24,'Peter','Casper','f','1984-05-25','027 Ritchie Ports',29,NULL),(25,'Kay','Cartwright','f','1970-02-10','472 Blick Estates',43,NULL),(26,'Janick','Bergstrom','m','1975-04-22','91357 Miller Circle Apt. 494',66,NULL),(27,'Green','Kerluke','m','1997-02-03','03894 Fadel Gateway Apt. 786',39,NULL),(28,'Mina','Wuckert','m','2000-06-07','09758 Rhianna Turnpike',69,NULL),(29,'Edyth','Funk','f','1974-06-12','761 Melisa Falls Apt. 819',60,NULL),(30,'Ola','Goodwin','f','2011-09-18','29663 Wehner Valley Apt. 217',46,NULL),(31,'Mariane','Schroeder','f','2014-10-02','045 Terry Trail Apt. 453',84,NULL),(32,'Amely','Torp','f','1982-05-09','0874 Lorena Loop Suite 915',71,NULL),(33,'Zander','Welch','f','1990-04-15','394 Margarita Circles',66,NULL),(34,'Blaise','Monahan','m','1979-10-15','64420 Christa River Apt. 173',99,NULL),(35,'Corrine','Lind','f','1996-03-18','65145 Mitchell Locks Suite 437',64,NULL),(36,'Isabel','Roberts','m','1986-02-06','6601 Chris Ford',45,NULL),(37,'Dedric','Blanda','m','2012-12-05','23269 Bernita Neck Suite 846',34,NULL),(38,'Karina','Spinka','m','1979-03-06','5653 Mohammad Park',95,NULL),(39,'Lacey','Kuphal','m','2013-10-04','2876 Adams Locks Suite 758',72,NULL),(40,'Jakayla','Howe','f','2006-05-18','41037 Shawna Garden',74,NULL),(41,'Ashlee','Kiehn','m','2009-05-06','68423 Cremin Gardens Apt. 410',86,NULL),(42,'Trinity','Wolf','m','2020-03-15','97524 Legros Valleys',68,NULL),(43,'Mariane','Leffler','m','2021-01-15','401 Xander Forge Apt. 151',49,NULL),(44,'Misty','Kshlerin','m','1979-06-08','65075 Johns Hollow',73,NULL),(45,'Susie','O\'Conner','m','1976-11-30','69508 Medhurst Fort',7,NULL),(46,'Adrian','Kulas','m','1993-03-20','996 Christian Locks Apt. 537',6,NULL),(47,'Guy','Sipes','m','1970-04-04','70938 Williamson Ford',45,NULL),(48,'Hoyt','Crist','f','1999-05-04','65909 Enos Forge',74,NULL),(49,'Jewell','Feest','f','1977-02-18','6052 Mariane Bridge Apt. 737',4,NULL),(50,'Thora','Ortiz','f','1979-11-10','8300 Ethyl Vista',72,NULL),(51,'Chris','Kohler','m','1973-07-08','625 Marquardt Union',61,NULL),(52,'Tyrel','Anderson','f','1993-01-31','53965 Satterfield Plain',85,NULL),(53,'Briana','Ryan','m','1973-07-01','4620 Ambrose Lights Suite 610',60,NULL),(54,'Lewis','Grady','m','1994-02-18','71416 Trantow Drive',95,NULL),(55,'Jorge','Hackett','f','1998-03-23','82257 Abernathy Street Suite 566',14,NULL),(56,'Gudrun','Greenholt','m','1994-02-07','8996 Mikayla Corner Apt. 591',3,NULL),(57,'Leone','O\'Conner','m','2003-06-12','2430 Alexandro Meadow Suite 974',60,NULL),(58,'Oswaldo','Franecki','m','2016-09-02','07051 Karley Streets',52,NULL),(59,'Lambert','Hayes','f','1970-06-05','402 Erna Circle Apt. 428',71,NULL),(60,'Alena','Wunsch','m','1998-05-12','178 Witting Plaza',20,NULL),(61,'Chester','Abshire','m','1977-12-20','805 Josefina Trail Apt. 725',98,NULL),(62,'Sydnee','Kertzmann','f','1976-07-05','52716 Becker Route Suite 028',55,NULL),(63,'Lilly','Fay','m','1977-05-22','0762 Monahan Valley',91,NULL),(64,'Allen','Aufderhar','m','2013-05-10','31326 Wintheiser Divide',64,NULL),(65,'Virgie','Blanda','f','1979-07-09','87626 Morar Roads Suite 506',53,NULL),(66,'Ada','Hudson','f','2003-07-12','73425 Alexanne Drive',55,NULL),(67,'Amos','Huel','m','1990-11-23','359 Corwin Light Apt. 744',8,NULL),(68,'Reinhold','Davis','m','2013-05-22','976 Adams Crest Suite 850',87,NULL),(69,'Amie','McGlynn','f','1975-10-06','38872 Lavern Summit',49,NULL),(70,'Brendan','Marks','m','2006-11-28','42907 Howard Hills',79,NULL),(71,'Alexane','Sawayn','f','1997-07-15','8700 Dane Spur Apt. 764',60,NULL),(72,'Chanelle','Davis','f','1987-05-16','820 Orn Key',34,NULL),(73,'Gloria','Feeney','f','2008-01-11','8355 Katrine Row',47,NULL),(74,'Hester','Kemmer','m','2005-09-01','45809 Mark Hill Suite 378',8,NULL),(75,'Joyce','Hintz','m','1998-01-31','4916 Calista Points Apt. 458',7,NULL),(76,'Marquise','Weissnat','f','1974-11-15','44312 Royce Groves Suite 102',54,NULL),(77,'Justen','Ondricka','f','2012-02-28','201 Weissnat Ways',13,NULL),(78,'Modesto','Beer','m','1996-07-28','02076 Batz Dam Apt. 434',52,NULL),(79,'Marquis','Farrell','m','1977-06-14','74756 Raynor Well',28,NULL),(80,'Concepcion','Jacobs','f','2006-09-06','0438 Erna Overpass Suite 975',17,NULL),(81,'Guadalupe','Kilback','m','1995-03-11','946 Paula Hollow Suite 835',23,NULL),(82,'Nelson','Corwin','f','1973-01-13','824 Adolph Spur Apt. 226',88,NULL),(83,'Stewart','Hartmann','m','2016-12-06','04703 Frankie Knolls',2,NULL),(84,'Mathew','Lubowitz','m','1974-02-09','528 Pietro Mount Suite 723',83,NULL),(85,'Dejon','Kiehn','f','1990-05-22','676 Kshlerin Crescent',82,NULL),(86,'Hugh','Walker','m','2011-08-20','6205 Zemlak Highway',15,NULL),(87,'Davonte','Hirthe','f','1973-06-30','70394 Daniel Tunnel Apt. 792',85,NULL),(88,'Delia','Morissette','f','2003-07-31','506 Zechariah Burg',42,NULL),(89,'Glen','Borer','f','2001-01-09','79076 Theron Canyon Suite 840',67,NULL),(90,'Jovany','Bode','m','2017-11-20','6467 Jenkins Cliffs',55,NULL),(91,'Antoinette','Osinski','f','1983-05-13','8634 Schuyler Ridges Apt. 019',61,NULL),(92,'Keven','Trantow','f','1986-05-26','752 Hayden Freeway Suite 075',64,NULL),(93,'Donnie','Waters','f','1973-05-11','7430 Nasir Plains',10,NULL),(94,'Heber','Wilderman','f','2010-12-01','9486 Trystan Ranch Apt. 082',52,NULL),(95,'Terrell','Rowe','m','2013-05-08','881 Friesen Springs',27,NULL),(96,'Melvina','Moore','f','2003-10-15','536 Gorczany Islands',62,NULL),(97,'Charlotte','Hilll','m','1977-02-13','41639 Brekke Curve Suite 171',6,NULL),(98,'Madie','Abbott','f','1992-02-08','72978 Deshaun Ville Suite 399',35,NULL),(99,'Maymie','Rodriguez','m','2019-08-27','8856 Rhett Plains Apt. 795',49,NULL),(100,'Lina','Aufderhar','m','1999-09-23','703 Justyn Knolls',55,NULL),(101,'Ezekiel','Harvey','f','1974-08-09','61285 Caleigh Mountains Suite 007',14,NULL),(102,'Raphael','Wisoky','f','1993-12-27','3796 Amanda Green Apt. 432',8,NULL),(103,'Ally','Bernhard','m','1979-08-15','278 Breanne Mission Suite 034',89,NULL),(104,'Jeffrey','Lockman','f','1980-01-13','7002 Kyler Throughway',61,NULL),(105,'Verda','Wolff','f','2015-01-23','308 Bode Fall Suite 399',16,NULL),(106,'Earline','Kreiger','m','1974-10-06','44694 Berge Courts',95,NULL),(107,'Breanna','Huel','m','2017-01-03','15048 Kohler Passage Apt. 490',15,NULL),(108,'Alverta','Hamill','f','1983-01-14','328 Streich View Apt. 667',29,NULL),(109,'Harley','Veum','f','1976-08-31','1660 Harber Forks',46,NULL),(110,'Rhianna','Ward','f','1986-12-30','35663 Sanford Mount Suite 697',42,NULL),(111,'Amira','Nitzsche','f','2005-06-02','4076 Annetta Common Suite 106',45,NULL),(112,'Hunter','Ortiz','m','2021-01-27','932 Jennings Place',69,NULL),(113,'Doyle','Connelly','m','1976-06-19','569 Huel Plains',29,NULL),(114,'Sister','Pollich','m','1999-01-05','5458 Stewart Hills Suite 569',46,NULL),(115,'Christ','Lehner','m','1997-05-29','0173 Lacey Dale Apt. 398',52,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint unsigned NOT NULL,
  `password_hash` char(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (16,'frederique65@example.net',89009009394,'3a0fb5173cb60b36016ff2e4ae99a164860c9461','1999-02-09 14:23:21',NULL),(17,'angelica35@example.org',89009009753,'97d6ddffbee06916d60c2bc99614f5993c8219fc','1992-04-19 23:55:07',NULL),(18,'ledner.nikko@example.net',89009009898,'24d21fd6fd1bff047c691f50fc766adfbd169d70','1975-02-04 19:23:38',NULL),(19,'harmony.wiegand@example.org',89009009541,'7edac038532be7ac95b067fcffa77de76794308a','2019-02-19 07:59:35',NULL),(20,'ngreenfelder@example.net',89009009201,'05bb3ebdb64ede8e7bdad28b48b707e5747a2121','1971-08-15 05:38:03',NULL),(21,'blanda.garry@example.com',89009009252,'8e6dab470cb6ad465dadb9e2fbc9f1925ac233df','1975-08-05 22:04:46',NULL),(22,'robert40@example.net',89009009873,'9bbe6c345127d9c2c61cf60aef1c7bb067c4c265','1971-11-02 09:38:09',NULL),(23,'lorena72@example.org',89009009884,'041f6adf9acde076f8cb77e4a0b962c9e0250cb9','2004-04-28 15:52:08',NULL),(24,'denesik.zoe@example.net',89009009839,'11104e1a9a1d20e15e0d349c56db4f195111a134','1976-12-22 17:15:54',NULL),(25,'stephon45@example.net',89009009700,'39f95d12f8b0cea1d0217eb4ddafbaf53e93ac0a','1980-06-13 17:18:22',NULL),(26,'chauncey.lebsack@example.net',89009009508,'2ef8fb4e1863ed4a0cd6c01ec17328a27f265b09','1972-03-19 19:15:31',NULL),(27,'henriette95@example.net',89009009410,'1ef1f27f08d2a665deac664cbbc7f6fa40346018','1996-11-21 15:42:46',NULL),(28,'hester48@example.net',89009009808,'e341f1232b339e2c6e857b35dd97c0464f44be43','1997-05-30 12:57:55',NULL),(29,'marcelina.howell@example.com',89009009853,'ccf068352b2ef3deabfc9936a31b46edc5f01b6d','1986-05-02 06:18:27',NULL),(30,'taya.effertz@example.com',89009009640,'8698e3e9997bf5b5cce4070f1fd0fd13249e2780','2010-02-15 20:26:34',NULL),(31,'sonya.dickens@example.net',89009009202,'fd77205c0146730563709438c9b04a0bf74b717d','2007-05-27 13:51:53',NULL),(32,'fritz.lakin@example.com',89009009994,'94197bc9fe706f2ba2ce1e3dc50abd3ff3ab9054','2014-02-11 18:51:22',NULL),(33,'cassandra87@example.com',89009009944,'b7e39d2267074a6e9109bd0d345d67b37b399973','1995-06-06 14:23:39',NULL),(34,'mazie.harber@example.net',89009009818,'0759a511bf3aa303cc034ac5856224c4dc434b88','2007-05-09 16:47:12',NULL),(35,'zdach@example.com',89009009709,'866de635fe3034cf139b5970e85beef82b0c128c','1977-03-01 16:44:01',NULL),(36,'adah.franecki@example.net',89009009599,'a35849ed82a4b90ee7c984d95e0cbfe2bded3d29','2011-02-20 09:22:46',NULL),(37,'johns.thurman@example.org',89009009005,'0e9148b67ec8db900a6ae9e69310bf89117991c9','1982-09-25 03:04:56',NULL),(38,'gleichner.catalina@example.org',89009009462,'2e36ed2694969d08068ccb2ec07560c6c8a39771','1996-10-28 19:47:25',NULL),(39,'wilford87@example.net',89009009469,'d170e1c5cecff18b093609ae6119fa17962f032c','1979-11-21 02:49:19',NULL),(40,'carter60@example.com',89009009988,'0b325615b7124c5afb7b3ce80587fafd5587104e','1998-01-06 18:13:35',NULL),(41,'wdouglas@example.com',89009009802,'2c934ff3bc8189cb6a0376352aa0e7f34267bc49','2001-01-04 19:29:44',NULL),(42,'cummerata.forrest@example.com',89009009870,'050f0284caa08280cdc0bd2f9a57f3f3311fa3f9','1991-10-23 02:46:48',NULL),(43,'anjali07@example.org',89009009586,'161f17f26572d600cf0b1db675fcff966333a43d','2000-08-06 06:02:11',NULL),(44,'xparisian@example.com',89009009583,'942d955fe3f660619816ddfc7fd44614aa66817c','1992-11-01 14:26:28',NULL),(45,'pearlie21@example.org',89009009623,'545733ee4ca8d95ab30a9329dc4904cc49996a54','1973-12-26 04:08:02',NULL),(46,'schaefer.ellie@example.net',89009009612,'91d05d1dae846c3e0a1dac3091347a352cd8ec7d','1986-10-30 04:14:15',NULL),(47,'zbraun@example.net',89009009100,'753e2fcf66a78aa3fd24da6b607cba2a932b3495','2003-04-15 01:31:38',NULL),(48,'renner.cayla@example.com',89009009580,'7e96f630779a72df8272a8a25de2450a4f8efd34','1984-11-14 01:30:36',NULL),(49,'harrison37@example.com',89009009819,'19a05399b5f0fa529be8c927444dcdffbafa42da','1998-07-09 03:41:10',NULL),(50,'do\'keefe@example.net',89009009161,'984b4b0231fc53222449dcecc3390e0e3f5eed91','1998-05-15 07:59:07',NULL),(51,'melyna44@example.com',89009009277,'c450f9f46fbe16e9528372e5531928c6007d5a5f','1979-09-26 01:23:01',NULL),(52,'wiegand.bettye@example.com',89009009738,'6959398b37e163280e9c3d131e10b0aa0f85c5b9','1977-07-20 10:49:54',NULL),(53,'schimmel.destiney@example.com',89009009054,'bf79d0854e30a2d3c7d5bb402ebd8af335faac5c','2019-12-19 00:57:57',NULL),(54,'chance.schumm@example.net',89009009729,'b9f4910472f20876da9c93e7b7106c8c4dd4b575','1995-12-09 15:09:25',NULL),(55,'hassie51@example.com',89009009532,'dc26c55eb3e775aa12099dafd0d46fceb45cbb84','2005-02-20 21:55:51',NULL),(56,'emmitt28@example.org',89009009937,'f9bef1f9ab416f84012f056b9b77807979103bfa','1979-04-24 14:22:03',NULL),(57,'stephan84@example.org',89009009431,'76fefa60696f0fb1d0a34727ae8438467789ed67','1999-09-22 19:10:59',NULL),(58,'freeda04@example.org',89009009389,'40ab9cd0fc391962ab1f82d14bef215312617389','1976-01-30 02:58:35',NULL),(59,'kerluke.richard@example.org',89009009721,'93b1c06eb6813cb15fb1892c7069c12dd4ecb86c','2015-08-17 19:28:27',NULL),(60,'christelle93@example.net',89009009195,'fb7a19b8f8a121e1d1fc933ad3eeabde55bea97f','2007-07-09 00:51:42',NULL),(61,'lueilwitz.elza@example.com',89009009091,'21fa38eba7a054c3e2a6c988f808ad61c57f320a','1986-03-08 19:17:26',NULL),(62,'myrtice49@example.net',89009009219,'106eb11aadc3b9402f6b6b201baf616424cefab7','1991-01-21 04:33:06',NULL),(63,'lauriane.reichel@example.net',89009009289,'8366ff6440d762a8a3cd81c122ad8f207415c7cb','2006-10-05 19:30:17',NULL),(64,'bergstrom.dewitt@example.org',89009009433,'794fcd3f6b7ed8814cac4041529f0880cfbc744a','1990-08-12 16:47:06',NULL),(65,'dusty.eichmann@example.net',89009009426,'2ee1f53b40c52a18acb200a6823fa2eb128ac072','1992-03-07 02:05:36',NULL),(66,'qdaugherty@example.net',89009009777,'1fd5d4053523a2e8cf97b8395f34c03719eca605','1989-08-08 23:13:25',NULL),(67,'bcartwright@example.org',89009009897,'2bba497fdfaf54ec7be1c2255e006d1c47910d58','2007-08-19 05:52:48',NULL),(68,'aileen.terry@example.com',89009009160,'88353bc13474ac2884ac04206c603e57ce782cc3','1978-11-13 19:51:36',NULL),(69,'ifadel@example.org',89009009783,'c34b6c8f16df2a01adab819826274d73209c127f','1984-07-14 19:11:04',NULL),(70,'camryn57@example.org',89009009112,'87ef776fd205040112a77b3c0da8115c18cae439','2012-11-26 21:15:16',NULL),(71,'jconsidine@example.org',89009009019,'a1700401121a9eb2502a9913305bc660d4a74716','1985-06-29 01:02:07',NULL),(72,'aaron.reilly@example.net',89009009812,'f1dd6a41f55b195b0255fac3d3986c0c4e3e77e8','2019-09-07 10:31:40',NULL),(73,'xkshlerin@example.net',89009009240,'6db05690304d9ab7e6fe43c069179b9487746560','1975-11-24 12:09:50',NULL),(74,'marlen.fritsch@example.net',89009009719,'0968e5249a1c5bbfdeaf0c47c4c2b570cfd70e83','2001-11-10 14:25:30',NULL),(75,'darius.cummerata@example.net',89009009704,'e0fd5f6bdea653057005a8538e4f51cd91c7547d','2004-05-28 03:11:12',NULL),(76,'asha.denesik@example.org',89009009587,'37ce20e129321a30518db995cf6c0afcf5827d15','1983-04-22 03:58:57',NULL),(77,'larry64@example.com',89009009911,'4e18fe0831cf7edc962ced4414c96684a1cd6b70','1988-05-26 11:15:58',NULL),(78,'fnienow@example.org',89009009357,'c34f3642cbcf9b51d4fc7247da280d605fc84508','2016-08-31 20:17:49',NULL),(79,'herta25@example.com',89009009018,'4c50829e6ca2a91a9b430ec87a18a76f527cc534','2009-01-05 10:52:21',NULL),(80,'schuppe.tre@example.com',89009009291,'3349c1dadbfc3bb0bdbba6d2e03d3302098d4910','1984-04-24 20:25:28',NULL),(81,'graham.retha@example.com',89009009667,'738e06a002208e0f0513e6dd1581acb100aec732','1994-06-01 07:34:37',NULL),(82,'devante28@example.net',89009009917,'7edcfcec8374a795bd760672e91a48544d41fc7b','1982-02-20 19:56:16',NULL),(83,'sledner@example.org',89009009693,'c9ee9bb473289c46ceb48848e65242b460edd037','1997-02-09 12:54:23',NULL),(84,'maurice.quigley@example.org',89009009643,'4155bcad156136c4eff57c35b91290d10c875516','1972-04-21 06:32:00',NULL),(85,'harold21@example.org',89009009087,'e613dfb5a462a8486b43f27809ba90db805e2343','1980-09-16 16:48:03',NULL),(86,'francis32@example.com',89009009155,'e328a6af90f64b4a2e2dcea63202fef61f195a75','1979-07-16 22:03:59',NULL),(87,'gorczany.lafayette@example.com',89009009424,'538d0a0db549c2114a6a0ee4d42f8a4e31305a23','1984-03-12 14:12:40',NULL),(88,'dicki.alfonzo@example.net',89009009524,'dcd9df156a8aea010eb77cda1c363957f05f9ce8','1987-05-17 09:12:23',NULL),(89,'rudy.erdman@example.org',89009009578,'d7ace2eecf610b99fe2f1afbdc174cfb5abf9d07','1976-04-15 00:41:20',NULL),(90,'tamia.hoeger@example.net',89009009677,'845fa959e3464410b4fbef825a250e4ece9462b6','1990-10-07 03:15:02',NULL),(91,'luettgen.cameron@example.com',89009009185,'a0555328c1cd810efb08bb595c4f407f1d1eeb90','1984-01-22 08:51:18',NULL),(92,'lhills@example.org',89009009214,'6757a77e1f6aa05c649bca3470dad70dbf8883cb','2004-08-12 16:42:52',NULL),(93,'freda.jakubowski@example.org',89009009067,'63f515bf8f397b4c31711bedfaee9c979d8873bb','1994-01-29 14:49:46',NULL),(94,'ipollich@example.org',89009009836,'ca54cf102ab580df8e2cf4fbffad2ed7beaa4e13','1988-11-12 14:38:52',NULL),(95,'isadore.fadel@example.com',89009009333,'dd42bcc13b6897b16f95084d389dc79c801f2101','2016-09-23 01:41:33',NULL),(96,'shaniya27@example.org',89009009912,'47c709c3533c75b34a522a722a36709a06345c2a','2006-12-22 03:45:15',NULL),(97,'cara.pfeffer@example.com',89009009881,'7b88ed3e32b4f9b172081ff57fa2802deee3884e','2016-09-05 23:02:52',NULL),(98,'nwilkinson@example.com',89009009621,'41bcc7ee89a0035503a53697de890f494dfac946','1998-03-19 00:45:09',NULL),(99,'nader.nichole@example.org',89009009475,'9186878077b54d214568678b300c790b7dcbd512','1993-02-13 19:06:54',NULL),(100,'stefan63@example.org',89009009144,'83f034dc0c19bf4d822bc200616fc430802d4e7f','2000-12-24 15:47:57',NULL),(101,'ewell74@example.com',89009009169,'ed173cafd5d7f86da76d16b93d23e312b7e87170','1971-07-14 10:28:29',NULL),(102,'arthur.dare@example.com',89009009801,'fe2b086d2154889d311fd1df0992a29a483fe792','1992-04-18 23:19:00',NULL),(103,'srippin@example.org',89009009744,'cbd0cb69c91a2c11ec225a1bc8b9d0e9e87d48df','1973-03-02 10:28:14',NULL),(104,'pollich.astrid@example.org',89009009384,'1dc63d8146b51fde46ec3d1051f6c20dccddc669','1989-01-29 17:16:36',NULL),(105,'joel.white@example.net',89009009048,'fcb11db9d78329a3e7bf4a33f76344868c901004','1992-12-17 16:18:13',NULL),(106,'rosenbaum.kathlyn@example.org',89009009918,'bf8e65ef9a67e711c66358d035081f4aced8c8c9','1985-05-26 00:18:15',NULL),(107,'colton79@example.com',89009009236,'b1b359b4a3e0471caf5af5cac0419b84d0289622','2005-03-31 23:31:27',NULL),(108,'cruickshank.alba@example.net',89009009371,'495dea7663a203a16eb3b267a67ed76e147cf8fa','2019-05-10 17:21:55',NULL),(109,'clay.walter@example.com',89009009883,'3160d244c44fc7d1e1ce7ecacc6fcd40c7785a8e','2020-09-08 14:55:42',NULL),(110,'lmueller@example.com',89009009080,'129567429f782cbd6cdc1f87048d663cc4f7bca2','1973-03-02 16:39:00',NULL),(111,'mohr.weston@example.com',89009009052,'5be6665dfaa70d394997ecac3e1d4f073bc5b985','1978-03-03 04:09:41',NULL),(112,'pemard@example.org',89009009712,'8c86983ae8931ad0c59c23e651118a57961edb2d','1993-08-13 13:14:02',NULL),(113,'wvon@example.org',89009009786,'4cd5f84eb2ffe1e0cdfe0d07a0394b4f9eac1a39','1981-11-26 06:20:34',NULL),(114,'herminio.wiegand@example.com',89009009477,'fa155d2e9d0f4be456d5fadf0772875fed2b448d','1993-07-13 14:59:18',NULL),(115,'lera.lockman@example.org',89009009344,'a2000adbfd1dc54927e06087cd01a91c9a1eb7b2','2005-09-06 02:40:43',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_community`
--

DROP TABLE IF EXISTS `user_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_community` (
  `community_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`community_id`,`user_id`),
  KEY `fk_user_has_community_community1_idx` (`community_id`),
  KEY `fk_user_has_community_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_community_community1` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`),
  CONSTRAINT `fk_user_has_community_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_community`
--

LOCK TABLES `user_community` WRITE;
/*!40000 ALTER TABLE `user_community` DISABLE KEYS */;
INSERT INTO `user_community` VALUES (1,17),(1,35),(1,38),(1,39),(1,47),(1,53),(1,55),(1,56),(1,72),(1,79),(1,108),(1,114),(1,115),(2,50),(2,94),(2,108),(2,112),(3,39),(3,78),(3,86),(3,87),(3,95),(3,96),(3,103),(4,22),(4,25),(4,26),(4,45),(4,50),(4,72),(4,109),(4,111),(4,115),(5,21),(5,39),(5,41),(5,45),(5,51),(5,66),(5,68),(5,92),(5,96),(5,107),(5,111),(6,23),(6,29),(6,31),(6,44),(6,51),(6,58),(6,68),(6,79),(6,102),(6,115),(7,16),(7,17),(7,29),(7,30),(7,43),(7,44),(7,45),(7,49),(7,61),(7,64),(7,79),(7,85),(7,99),(7,103),(8,16),(8,21),(8,32),(8,69),(8,71),(8,75),(8,82),(8,89),(8,109),(8,115),(9,16),(9,20),(9,35),(9,78),(9,105),(9,111),(10,18),(10,29),(10,49),(10,57),(10,67),(10,83),(10,84),(10,86),(10,91),(10,92),(10,93),(10,97);
/*!40000 ALTER TABLE `user_community` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-23 22:20:40
