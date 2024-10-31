-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: javafxTest
-- ------------------------------------------------------
-- Server version	8.0.39

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

create database if not exists javafxTest;
use javafxTest;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
                              `id_ingredient` int NOT NULL AUTO_INCREMENT,
                              `name_ingredient` varchar(40) NOT NULL,
                              `cost_ingredient` decimal(6,0) NOT NULL,
                              `nalichie` varchar(40) NOT NULL,
                              PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Мясо свинина 1 кг',2000,'Yes'),(2,'Мясо говядина 1 кг',3800,'Yes'),(3,'Мясо курица 1 кг',2400,'Yes'),(4,'Сосиски 10 штук',3000,'Yes'),(5,'Сыр 1 кг',1800,'Yes'),(6,'Тесто 1 кг',1500,'No'),(7,'Лук 1кг',1700,'Yes'),(8,'Огурцы 1кг',800,'Yes'),(9,'Помидоры 1кг',900,'Yes'),(10,'Майонез 10 пачек',1900,'No'),(11,'Приправа 1кг',3000,'No'),(12,'Соус острый 10 пачек',4000,'Yes'),(13,'Капуста 1кг',689,'Yes'),(14,'Яйца куриные 10 ячеек',500,'Yes'),(15,'Морковка 1 кг',600,'Yes'),(16,'Чай заварной 1 кг',790,'Yes'),(17,'Кофе 1 кг',4031,'Yes'),(18,'Молоко 10 пачек',1000,'Yes'),(19,'Сливки 10 пачек',2000,'Yes'),(20,'Сахар 1 кг',3621,'Yes'),(21,'Лаваш',2312,'Yes');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dostavka`
--

DROP TABLE IF EXISTS `dostavka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dostavka` (
    `id_dostavka` int NOT NULL AUTO_INCREMENT,
    `data_time_dostavka` datetime DEFAULT NULL,
    `id_dish` int NOT NULL,
    `cost_dostavka` decimal(6,0) NOT NULL,
    PRIMARY KEY (`id_dostavka`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dostavka`
--

LOCK TABLES `dostavka` WRITE;
/*!40000 ALTER TABLE `dostavka` DISABLE KEYS */;
INSERT INTO `dostavka` VALUES (1,'2011-12-26 06:08:54',20,40),(2,'2012-03-14 22:35:44',3,20),(3,'2000-06-13 09:45:40',17,100),(4,'2003-03-22 14:27:28',5,30),(5,'2013-05-02 23:29:11',1,25),(6,'2021-02-22 19:07:46',16,26),(7,'1998-06-02 08:03:22',4,18),(8,'2010-03-31 09:02:20',9,89),(9,'2012-03-17 13:31:22',15,12),(10,'2016-12-11 15:54:59',14,42),(11,'2006-07-04 11:25:22',1,56),(12,'2010-03-18 20:16:22',12,31),(13,'2003-02-26 10:17:34',10,23),(14,'2009-09-08 12:06:45',9,42),(15,'2003-03-03 18:12:15',7,15);
/*!40000 ALTER TABLE `dostavka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient_has_postavki`
--

DROP TABLE IF EXISTS `ingredient_has_postavki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient_has_postavki` (
     `id` int NOT NULL AUTO_INCREMENT,
     `id_ingredient` int NOT NULL,
     `id_postavshik` int NOT NULL,
     PRIMARY KEY (`id`),
     KEY `id_ingredient` (`id_ingredient`),
     KEY `id_postavshik` (`id_postavshik`),
     CONSTRAINT `ingredient_has_postavki_ibfk_1` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`) ON DELETE RESTRICT ON UPDATE RESTRICT,
     CONSTRAINT `ingredient_has_postavki_ibfk_2` FOREIGN KEY (`id_postavshik`) REFERENCES `postavki` (`id_postavshik`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_has_postavki`
--

LOCK TABLES `ingredient_has_postavki` WRITE;
/*!40000 ALTER TABLE `ingredient_has_postavki` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredient_has_postavki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
     `id_dish` int NOT NULL AUTO_INCREMENT,
     `name_dish` varchar(40) NOT NULL,
     `cost_dish` decimal(6,0) DEFAULT NULL,
     `stoplist` varchar(40) NOT NULL,
     PRIMARY KEY (`id_dish`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Хачапури по Аджарски',40,'Yes'),(2,'Сосиска в тесте',46,'No'),(3,'Шаурма со свининой',170,'Yes'),(4,'Шаурма с говядиной',200,'No'),(5,'Шаурма с курицей',180,'No'),(6,'Беляш',50,'No'),(7,'Самса с курицей',45,'No'),(8,'Самса с вишней',40,'Yes'),(9,'Кофе со сливками',36,'No'),(10,'Кофе с сахаром',31,'No'),(11,'Латте',41,'No'),(12,'Донер с курицей',190,'Yes'),(13,'Пирог с яблоками',20,'No'),(14,'Пирог с луком и яйцом',20,'No'),(15,'Чай',10,'No'),(16,'Кола со льдом',21,'No'),(17,'Шашлык свинина 100 грамм',70,'No'),(18,'Шашлык говядина 100 грамм',80,'No'),(19,'Шашлык курица 100 грамм',65,'No');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_has_dostavka`
--

DROP TABLE IF EXISTS `menu_has_dostavka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_has_dostavka` (
    `id` int NOT NULL AUTO_INCREMENT,
    `id_dish` int NOT NULL,
    `id_dostavka` int NOT NULL,
    PRIMARY KEY (`id`),
    KEY `id_dish` (`id_dish`),
    KEY `id_dostavka` (`id_dostavka`),
    CONSTRAINT `menu_has_dostavka_ibfk_1` FOREIGN KEY (`id_dish`) REFERENCES `menu` (`id_dish`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `menu_has_dostavka_ibfk_2` FOREIGN KEY (`id_dostavka`) REFERENCES `dostavka` (`id_dostavka`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_has_dostavka`
--

LOCK TABLES `menu_has_dostavka` WRITE;
/*!40000 ALTER TABLE `menu_has_dostavka` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_has_dostavka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postavki`
--

DROP TABLE IF EXISTS `postavki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postavki` (
    `id_postavshik` int NOT NULL AUTO_INCREMENT,
    `name_postavshik` varchar(40) NOT NULL,
    `data_time_postavka` datetime DEFAULT NULL,
    `id_ingredient` int NOT NULL,
    PRIMARY KEY (`id_postavshik`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postavki`
--

LOCK TABLES `postavki` WRITE;
/*!40000 ALTER TABLE `postavki` DISABLE KEYS */;
INSERT INTO `postavki` VALUES (1,'Агзамов Ренат','2017-09-27 17:46:33',1),(2,'Ивлев Константин','2004-06-04 02:10:39',2),(3,'Агзамов Ренат','2010-07-23 19:55:14',3),(4,'Агзамов Ренат','2017-05-04 20:49:08',4),(5,'Левицкий Дмитрий','2010-06-28 19:45:18',5),(6,'Левицкий Дмитрий','2016-07-27 21:08:37',6),(7,'Левицкий Дмитрий','2004-05-27 01:31:32',7),(8,'Ивлев Константин','2000-07-26 06:54:16',8),(9,'Ивлев Константин','2021-10-24 19:08:37',9),(10,'Левицкий Дмитрий','2002-08-27 07:25:22',10),(11,'Агзамов Ренат','2006-03-20 04:51:22',11),(12,'Агзамов Ренат','2014-11-23 08:08:28',12),(13,'Агзамов Ренат','2016-02-12 05:29:45',13),(14,'Левицкий Дмитрий','2012-07-04 06:58:29',14),(15,'Левицкий Дмитрий','2014-02-06 19:04:23',15),(16,'Левицкий Дмитрий','2002-08-11 07:51:00',16),(17,'Ивлев Константин','2019-11-21 07:14:14',17),(18,'Левицкий Дмитрий','2007-10-12 05:07:59',18),(19,'Левицкий Дмитрий','2002-07-06 15:53:40',19),(20,'Агзамов Ренат','2021-07-22 04:38:54',20),(21,'Агзамов Ренат','2010-05-24 14:53:28',21);
/*!40000 ALTER TABLE `postavki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `povar`
--

DROP TABLE IF EXISTS `povar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `povar` (
    `id_povar` int NOT NULL AUTO_INCREMENT,
    `fio_povar` varchar(100) NOT NULL,
    `id_dish` int NOT NULL,
    `zarplata` decimal(6,0) NOT NULL,
    `id_ingredient` int NOT NULL,
    PRIMARY KEY (`id_povar`),
    KEY `povar_FK` (`id_dish`),
    CONSTRAINT `povar_FK` FOREIGN KEY (`id_dish`) REFERENCES `menu` (`id_dish`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `povar`
--

LOCK TABLES `povar` WRITE;
/*!40000 ALTER TABLE `povar` DISABLE KEYS */;
INSERT INTO `povar` VALUES (1,'Петров Артём',1,12900,1),(2,'Петров Артём',2,45000,2),(3,'Рахматов Саид',3,4500,3),(4,'Олимов Равшан',4,6790,4),(5,'Соломонов Давид',5,67900,5),(6,'Лесова Лариса',6,38723,6),(7,'Лесова Лариса',7,42141,7),(8,'Олимов Равшан',8,3134,8),(9,'Петров Артём',9,13113,9),(10,'Рахматов Саид',10,34131,10),(11,'Лесова Лариса',11,8762,11),(12,'Рахматов Саид',12,7342,12),(13,'Олимов Равшан',13,26173,13),(14,'Олимов Равшан',14,13431,14),(15,'Соломонов Давид',15,32614,15);
/*!40000 ALTER TABLE `povar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `povar_has_ingredient`
--

DROP TABLE IF EXISTS `povar_has_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `povar_has_ingredient` (
     `id` int NOT NULL AUTO_INCREMENT,
     `id_povar` int NOT NULL,
     `id_ingredient` int NOT NULL,
     PRIMARY KEY (`id`),
     KEY `id_povar` (`id_povar`),
     KEY `id_ingredient` (`id_ingredient`),
     CONSTRAINT `povar_has_ingredient_ibfk_1` FOREIGN KEY (`id_povar`) REFERENCES `povar` (`id_povar`) ON DELETE RESTRICT ON UPDATE RESTRICT,
     CONSTRAINT `povar_has_ingredient_ibfk_2` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `povar_has_ingredient`
--

LOCK TABLES `povar_has_ingredient` WRITE;
/*!40000 ALTER TABLE `povar_has_ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `povar_has_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
      `name` varchar(40) NOT NULL,
      `pass` varchar(40) DEFAULT NULL,
      PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('root','Chudnenko357');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zakaz`
--

DROP TABLE IF EXISTS `zakaz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zakaz` (
     `id_zakaz` int NOT NULL AUTO_INCREMENT,
     `id_pokupatel` int NOT NULL,
     `name_pokupatel` varchar(40) NOT NULL,
     `id_dish` int NOT NULL,
     `data_time_zakaz` datetime DEFAULT NULL,
     PRIMARY KEY (`id_zakaz`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zakaz`
--

LOCK TABLES `zakaz` WRITE;
/*!40000 ALTER TABLE `zakaz` DISABLE KEYS */;
INSERT INTO `zakaz` VALUES (1,1,'Дэвид Блэк',1,'2023-03-09 13:30:56'),(2,2,'Джейсон Стетхем',2,'2019-06-02 15:55:20'),(3,3,'Дженсен Эклз',3,'2011-05-22 08:32:58'),(4,4,'Марго Робби',4,'2009-08-28 17:22:22'),(5,5,'Иванов Иван',5,'2020-07-27 13:13:19'),(6,6,'Сидоров Сидор',6,'2022-01-28 03:39:05'),(7,7,'Землянинова Мария',7,'2010-12-06 10:54:24'),(8,8,'Автомобилёв Владимир',8,'2019-12-02 08:22:59'),(9,9,'Орлова Оксана',9,'2013-10-07 08:39:05'),(10,10,'Панюшкин Артём',10,'2012-07-17 14:27:58'),(11,11,'Шрамов Шурик',11,'2005-06-01 02:23:55'),(12,12,'Балбесова Агафья',12,'2015-11-16 14:12:48'),(13,13,'Есенин Роман',13,'2003-06-27 04:51:29'),(14,14,'Александров Александр',14,'2009-02-13 06:10:31'),(15,15,'Обедов Василий',15,'2005-08-16 22:49:51'),(16,16,'Дин Винчестер',16,'2023-03-09 13:30:56'),(17,17,'Дженсен Эклз',17,'2021-03-19 14:10:03');
/*!40000 ALTER TABLE `zakaz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zakaz_has_menu`
--

DROP TABLE IF EXISTS `zakaz_has_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zakaz_has_menu` (
     `id` int NOT NULL AUTO_INCREMENT,
     `id_dish` int NOT NULL,
     `id_zakaz` int NOT NULL,
     PRIMARY KEY (`id`),
     KEY `id_dish` (`id_dish`),
     KEY `id_zakaz` (`id_zakaz`),
     CONSTRAINT `zakaz_has_menu_ibfk_1` FOREIGN KEY (`id_dish`) REFERENCES `menu` (`id_dish`) ON DELETE RESTRICT ON UPDATE RESTRICT,
     CONSTRAINT `zakaz_has_menu_ibfk_2` FOREIGN KEY (`id_zakaz`) REFERENCES `zakaz` (`id_zakaz`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zakaz_has_menu`
--

LOCK TABLES `zakaz_has_menu` WRITE;
/*!40000 ALTER TABLE `zakaz_has_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `zakaz_has_menu` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-28 16:11:33
