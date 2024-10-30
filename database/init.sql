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
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films` (
                         `Film_number` int NOT NULL,
                         `Name` varchar(60) DEFAULT NULL,
                         `Session_start` time DEFAULT NULL,
                         `End_of_session` time DEFAULT NULL,
                         PRIMARY KEY (`Film_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,'Зеленая миля','14:30:00','17:39:00'),(2,'Побег из Шоушенка','18:00:00','20:22:00'),(3,'Список Шиндлера','19:10:00','22:25:00'),(4,'Интерстеллар','15:40:00','18:29:00'),(5,'Бойцовский клуб','13:00:00','15:19:00'),(6,'Иван Васильевич меняет профессию','18:05:00','19:33:00'),(7,'Шрэк','12:20:00','13:50:00'),(8,'Король Лев','11:00:00','12:28:00'),(9,'Назад в будущее','16:05:00','18:01:00'),(10,'Москва слезам не верит','17:25:00','19:55:00'),(11,'Остров проклятых','19:40:00','21:58:00'),(12,'Леон','20:00:00','22:13:00'),(13,'Темный рыцарь','13:10:00','15:42:00'),(14,'...А зори здесь тихие ','15:15:00','17:55:00'),(15,'Зеленая книга','14:20:00','16:30:00'),(16,'Бриллиантовая рука','17:50:00','19:24:00'),(17,'Клаус','12:05:00','13:41:00'),(18,'Большой куш','10:00:00','11:44:00'),(19,'Гарри Поттер и Тайная комната','14:10:00','16:51:00'),(20,'Титаник','16:00:00','19:14:00'),(24,'Мрачные тени','15:00:00','16:53:00');
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films_has_halls`
--

DROP TABLE IF EXISTS `films_has_halls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_has_halls` (
                                   `Film_number` int NOT NULL,
                                   `Hall_number` int NOT NULL,
                                   PRIMARY KEY (`Film_number`,`Hall_number`),
                                   KEY `fk_Films_has_Halls_Halls1_idx` (`Hall_number`),
                                   KEY `fk_Films_has_Halls_Films1_idx` (`Film_number`),
                                   CONSTRAINT `fk_Films_has_Halls_Films1` FOREIGN KEY (`Film_number`) REFERENCES `films` (`Film_number`),
                                   CONSTRAINT `fk_Films_has_Halls_Halls1` FOREIGN KEY (`Hall_number`) REFERENCES `halls` (`Hall_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_has_halls`
--

LOCK TABLES `films_has_halls` WRITE;
/*!40000 ALTER TABLE `films_has_halls` DISABLE KEYS */;
INSERT INTO `films_has_halls` VALUES (11,2),(11,3),(6,4),(19,4),(1,5),(8,5),(6,6),(20,6),(7,7),(14,7),(1,8),(3,8),(5,9),(14,11),(17,16),(3,17),(4,18),(8,18);
/*!40000 ALTER TABLE `films_has_halls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `halls`
--

DROP TABLE IF EXISTS `halls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `halls` (
                         `Hall_number` int NOT NULL,
                         `Number_of_seats` int DEFAULT NULL,
                         `Screen_format` varchar(45) DEFAULT NULL,
                         PRIMARY KEY (`Hall_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halls`
--

LOCK TABLES `halls` WRITE;
/*!40000 ALTER TABLE `halls` DISABLE KEYS */;
INSERT INTO `halls` VALUES (1,23,'Стандартный'),(2,17,'Широкоэкранный'),(3,37,'IMAX'),(4,34,'IMAX'),(5,56,'Стандартный'),(6,65,'Стандартный'),(7,32,'Стандартный'),(8,58,'IMAX'),(9,45,'3D-экран'),(10,43,'Широкоэкранный'),(11,44,'IMAX'),(12,47,'Широкоэкранный'),(13,23,'3D-экран'),(14,19,'Широкоэкранный'),(15,55,'Стандартный'),(16,65,'Стандартный'),(17,46,'IMAX'),(18,35,'Стандартный'),(19,46,'Широкоэкранный'),(20,28,'Широкоэкранный');
/*!40000 ALTER TABLE `halls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
                           `Ticket_number` int NOT NULL,
                           `Price` int DEFAULT NULL,
                           PRIMARY KEY (`Ticket_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (100,230),(101,340),(102,400),(103,320),(104,500),(105,260),(106,390),(107,470),(108,330),(109,560),(110,450),(111,380),(112,220),(113,550),(114,390),(115,290),(116,180),(117,380),(118,550),(119,230),(120,540),(121,276);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
                         `name` varchar(40) NOT NULL,
                         `pass` varchar(45) DEFAULT NULL,
                         PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('root','12345678'),('rot','1234');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitors` (
                            `Visitor_s_number` int NOT NULL,
                            `Surname` varchar(45) DEFAULT NULL,
                            `Name` varchar(45) DEFAULT NULL,
                            `Middle_name` varchar(45) DEFAULT NULL,
                            `Phone_number` varchar(15) DEFAULT NULL,
                            `Ticket_number` int NOT NULL,
                            PRIMARY KEY (`Visitor_s_number`),
                            KEY `fk_Visitors_Tickets1_idx` (`Ticket_number`),
                            CONSTRAINT `fk_Visitors_Tickets1` FOREIGN KEY (`Ticket_number`) REFERENCES `tickets` (`Ticket_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
INSERT INTO `visitors` VALUES (1,'Кудрявцев','Олег','Юрьевич','+78760984567',109),(2,'Ширяев','Юрий','Алексеевич','+76734876567',100),(3,'Дмитриева','Надежда','Павловна','+73286756385',114),(4,'Федотов','Кирилл','Петрович','+78349756676',112),(5,'Воронов','Игорь','Олегович','+73286756327',108),(6,'Нестеров','Евгений','Валентинович','+72386763455',105),(7,'Гордеева','Карина','Алексеевна','+75326237563',104),(8,'Сидоров','Владимир','Александрович','+73652623465',102),(9,'Семёнов','Борис','Егорович','+76234452563',118),(10,'Третьяков','Артём','Борисович','+71342134555',115),(11,'Лапина','Анастасия','Николаевна','+73422222545',102),(12,'Якушев','Александр','Валерьевич','+70289328787',107),(13,'Морозов','Алексей','Олегович','+79038732465',117),(14,'Поляков','Валентин','Юрьевич','+70349587578',103),(15,'Аксёнов','Валерий','Валентинович','+72364365563',106),(16,'Горбачёв','Егор','Егорович','+72374367646',115),(17,'Авдеева','Мария','Александровна','+71453123546',118),(18,'Власов','Павел','Олегович','+72156353245',120),(19,'Соколов','Пётр','Николаевич','+76235437234',116),(20,'Тихонов','Николай','Борисович','+71324324356',101);
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitors_has_films`
--

DROP TABLE IF EXISTS `visitors_has_films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitors_has_films` (
                                      `Visitor_s_number` int NOT NULL,
                                      `Film_number` int NOT NULL,
                                      PRIMARY KEY (`Visitor_s_number`,`Film_number`),
                                      KEY `fk_Visitors_has_Films_Films1_idx` (`Film_number`),
                                      KEY `fk_Visitors_has_Films_Visitors1_idx` (`Visitor_s_number`),
                                      CONSTRAINT `fk_Visitors_has_Films_Films1` FOREIGN KEY (`Film_number`) REFERENCES `films` (`Film_number`),
                                      CONSTRAINT `fk_Visitors_has_Films_Visitors1` FOREIGN KEY (`Visitor_s_number`) REFERENCES `visitors` (`Visitor_s_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors_has_films`
--

LOCK TABLES `visitors_has_films` WRITE;
/*!40000 ALTER TABLE `visitors_has_films` DISABLE KEYS */;
INSERT INTO `visitors_has_films` VALUES (14,2),(1,3),(7,3),(17,3),(3,4),(1,5),(13,5),(1,7),(19,7),(14,9),(11,11),(12,14),(3,15),(16,15),(18,16),(9,17),(9,18),(9,19),(8,20);
/*!40000 ALTER TABLE `visitors_has_films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workers` (
                           `Kod_workers` int NOT NULL,
                           `Surname` varchar(45) DEFAULT NULL,
                           `Name` varchar(45) DEFAULT NULL,
                           `Middle_name` varchar(45) DEFAULT NULL,
                           `Post` varchar(45) DEFAULT NULL,
                           `Phone_number` varchar(15) DEFAULT NULL,
                           `Adress` varchar(50) DEFAULT NULL,
                           `Passport_series` int DEFAULT NULL,
                           `Passport_number` int DEFAULT NULL,
                           PRIMARY KEY (`Kod_workers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workers`
--

LOCK TABLES `workers` WRITE;
/*!40000 ALTER TABLE `workers` DISABLE KEYS */;
INSERT INTO `workers` VALUES (10576,'Антонов','Валентин','Павлович','Уборщик','+76546788990','Н.Новгород, ул. Бекетова, д. 9, к. 34',2218,786543),(11564,'Третьякова','Галина','Всеволодович','Кассир','+78764352134','Кстово, ул. Берёзовая, д. 3, к. 32',2246,980765),(12768,'Данилова','Евгения','Данилович','Охранник','+79087635468','Н.Новгород, ул. Нартова, д. 16, к. 109',2367,122345),(13466,'Лебедев','Георгий','Евгеньевич','Бухгалтер','+78765432309','Княгинино, ул. Урицкого, д. 29, к. 204',2135,234354),(14465,'Максимов','Кирилл','Семёнович','Администратор','+78764535789','Бор, ул. Ленина, д. 3, к. 309',2478,879545),(15254,'Лавров','Константин','Максимович','Контролёр','+76566889642','Дзержинск, ул. Чапаева, д. 45, к. 50',2355,987755),(15673,'Абалаков','Павел','Захарович','Киномеханик','+74565678329','Дзержинск, ул. Матросова, д. 6, к. 38',2256,211253),(16098,'Кошелева','Надежда','Павлович','Кассир','+71223344354','Н.Новгород, ул. Бекетова, д. 7, к. 15',2365,766545),(17575,'Шарова','Полина','Валентинович','Охранник','+78976553244','Княгинино, ул. Урицкого, д. 56, к. 20',2133,123234),(18478,'Ершов','Роман','Евгеньевич','Охранник','+71244573890','Кстово, ул. Герцена, д. 78, к. 49',2488,909877),(19767,'Маслов','Сергей','Артёмович','Кассир','+76878909634','Кстово, ул. Зелёная, д. 89, к. 100',2899,564544),(20664,'Евсеев','Семён','Павлович','Кассир','+73122233445','Москва, ул. Ленина, д. 77, к. 129',2468,979655),(24676,'Смирнов','Руслан','Константинович','Администратор','+75333456800','Н.Новгород, ул. Ванеева, д. 33, к. 150',2890,454765),(33256,'Карпов','Михаил','Кириллович','Киномеханик','+79643232540','Н.Новгород, ул. Головнина, д. 90, к. 3',2237,224366),(46589,'Гуляева','Дарья','Петрович','Охранник','+73645245767','Дзержинск, ул. Чапаева, д. 4, к. 128',2134,876756),(57532,'Турова','Валерия','Николаевич','Контролёр','+72343524155','Княгинино, ул. Урицкого, д. 7, к. 38',2893,122353),(68009,'Мельников','Всеволод','Игоревич','Кассир','+70694585656','Н.Новгород, ул. Нартова, д. 8, к. 57',2245,567889),(75654,'Сорокин','Даниил','Руслонович','Киномеханик','+73435458738','Дзержинск, ул. Пирогова, д. 47, к. 12',2177,675656),(84356,'Макаров','Максим','Борисович','Охранник','+71224435665','Дзержинск, ул. Строителей, д. 68, к. 28',2276,766567),(94535,'Яковлев','Игорь','Сергеевич','Кассир','+78435093465','Н.Новгород, ул. Заярская, д. 87, к. 43',2166,975544),(95898,'Иванов','Владимир','Романович','Уборщик','+78563435677','Н.Новгород, ул. Горловская, д. 58, к. 97',2290,378945);
/*!40000 ALTER TABLE `workers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workers_has_halls`
--

DROP TABLE IF EXISTS `workers_has_halls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workers_has_halls` (
                                     `Kod_workers` int NOT NULL,
                                     `Hall_number` int NOT NULL,
                                     PRIMARY KEY (`Kod_workers`,`Hall_number`),
                                     KEY `fk_Workers_has_Halls_Halls1_idx` (`Hall_number`),
                                     KEY `fk_Workers_has_Halls_Workers1_idx` (`Kod_workers`),
                                     CONSTRAINT `fk_Workers_has_Halls_Halls1` FOREIGN KEY (`Hall_number`) REFERENCES `halls` (`Hall_number`),
                                     CONSTRAINT `fk_Workers_has_Halls_Workers1` FOREIGN KEY (`Kod_workers`) REFERENCES `workers` (`Kod_workers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workers_has_halls`
--

LOCK TABLES `workers_has_halls` WRITE;
/*!40000 ALTER TABLE `workers_has_halls` DISABLE KEYS */;
INSERT INTO `workers_has_halls` VALUES (10576,1),(10576,3),(10576,5),(33256,5),(10576,7),(10576,8),(15254,8),(15673,8),(33256,9),(33256,11),(57532,12),(57532,13),(15673,15),(57532,16),(10576,18),(15673,19),(15254,20);
/*!40000 ALTER TABLE `workers_has_halls` ENABLE KEYS */;
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
