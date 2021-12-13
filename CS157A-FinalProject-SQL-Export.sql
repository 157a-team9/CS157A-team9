CREATE DATABASE  IF NOT EXISTS `157a_team9` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `157a_team9`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: 157a_team9
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zipcode` varchar(45) NOT NULL,
  PRIMARY KEY (`address_id`),
  UNIQUE KEY `address_id_UNIQUE` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (17,'75 Robinhood Dr','San Francisco','CA','94127'),(18,'326 North 19th Street','San Jose','California','95112'),(19,'326 N 11St ','San Jose','CA','95112'),(20,'75 Robinhood D6','San Francisco','CA','94127'),(21,'32 N 11 Ave.','San Francisco','CA','94123'),(22,'32 Sherman Ave','San Jose','CA','94215'),(23,'324 Colorodo Dr','Santa Clara','CA','95132'),(24,'123 Address Ave','Address Ville','CA','92134'),(25,'321 MyStreet St.','San Jose','CA','95112'),(26,'43 C St.','Los Angeles','CA','91234'),(27,'12 D Rd.','Sacramento','CA','42421'),(28,'123 Address way','San Jose','CA','95112'),(29,'1 Washington Square','San Jose','CA','95112'),(30,'1 Washington Square','San Jose','CA','95112'),(31,'1 Washington Square','San Jose','CA','95112'),(32,'300 North 12th Street','San Jose','California','95112');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `belongs_to`
--

DROP TABLE IF EXISTS `belongs_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `belongs_to` (
  `user_id` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`address_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `address_id_UNIQUE` (`address_id`),
  CONSTRAINT `belongs_to_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE CASCADE,
  CONSTRAINT `belongs_to_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `seller` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belongs_to`
--

LOCK TABLES `belongs_to` WRITE;
/*!40000 ALTER TABLE `belongs_to` DISABLE KEYS */;
INSERT INTO `belongs_to` VALUES (1,17),(6,18),(8,19),(10,21),(11,22),(13,23),(14,24),(15,25),(17,26),(18,27),(19,28),(22,30),(23,31),(24,32);
/*!40000 ALTER TABLE `belongs_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(45) NOT NULL,
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `brand_id_UNIQUE` (`brand_id`),
  UNIQUE KEY `brand_name_UNIQUE` (`brand_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (4,'apple'),(7,'asus'),(2,'cherry'),(8,'corsair'),(11,'das'),(9,'drop'),(6,'ducky'),(16,'GMK'),(19,'kbdfans'),(5,'keychron'),(10,'kinesis'),(17,'kinetic labs'),(14,'knewkey'),(3,'logitech'),(12,'microsoft'),(15,'other'),(1,'razer'),(13,'xenta'),(18,'zeal');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_id_UNIQUE` (`category_id`),
  UNIQUE KEY `category_name_UNIQUE` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (13,'Accesories'),(16,'Artisan'),(10,'Case'),(6,'Custom Keyboard'),(11,'Key Caps'),(3,'Keyboard'),(5,'Mechanical'),(4,'Membrane'),(2,'New'),(17,'Other'),(8,'PCB'),(9,'Plate'),(12,'Service'),(15,'Stabilizers'),(7,'Switches'),(14,'Tools'),(1,'Used');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has_category`
--

DROP TABLE IF EXISTS `has_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `has_category` (
  `listing_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`category_id`,`listing_id`),
  KEY `has_category_ibfk_1` (`listing_id`),
  CONSTRAINT `has_category_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`listing_id`) ON DELETE CASCADE,
  CONSTRAINT `has_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has_category`
--

LOCK TABLES `has_category` WRITE;
/*!40000 ALTER TABLE `has_category` DISABLE KEYS */;
INSERT INTO `has_category` VALUES (44,2),(44,3),(44,5),(44,8),(44,9),(44,10),(44,12),(44,15),(46,5),(46,11),(47,11),(48,1),(48,2),(48,3),(48,5),(58,17),(60,7),(61,7),(62,11),(63,10),(64,1),(64,3),(64,4),(65,2),(65,9),(66,2),(66,11),(67,2),(67,5),(67,6),(67,8),(68,2),(68,10),(69,1),(69,3),(69,5),(70,2),(70,3),(70,5),(75,2),(75,11),(77,2),(77,3),(77,4),(77,5),(77,6),(77,10),(77,11),(77,13),(77,16),(77,17);
/*!40000 ALTER TABLE `has_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing`
--

DROP TABLE IF EXISTS `listing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listing` (
  `listing_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`listing_id`),
  UNIQUE KEY `listing_id_UNIQUE` (`listing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing`
--

LOCK TABLES `listing` WRITE;
/*!40000 ALTER TABLE `listing` DISABLE KEYS */;
INSERT INTO `listing` VALUES (44,'Ikki68 Aurora Stargaze','I am selling my spot in the group by for ikki68 aurora. ',10000),(46,'GMK Stargaze Keycaps','I am selling my spot in the GMK Stargaze group by. I have ordered the base set, spacebars and novelties. I will send them to you when they are shipped',50000),(47,'GMK Olive clones','I am selling clones of GMK olive. They are good quality.',5000),(48,'Razer Huntsman','Barely used, like new razer huntsman. Still have box',10000),(58,'Wooden wrist rest','Selling walnut wooden wrist rest. $30 OBO',3000),(59,'Kinetic Labs Hippo Switches','I am selling hippo switches in increments of 10 switches. $5 for 10 switches.',500),(60,'Kinetic Labs Hippos','I am selling lubed hippo switches in batches of 10. $4 per 10 switches',400),(61,'Zealios Switches','Selling Zealios switches. 10ct for $10',1000),(62,'GMK Earth Tones','I am selling gmk Earth Tones. I have the base set, novelties, and spacebars. Selling all for $500',50000),(63,'65% Wooden Case','Selling lightly used KBDfans Wooden case. It is a standard ANSI layout, tray mount case. Rosewood.',5000),(64,'Apple Magic Keyboard','Selling used Apple magic keyboard. Out of box, like new',10000),(65,'Polycarb plate','Selling new polycarb plates. These are 65%. And supports standard ANSI Layout.',3000),(66,'GMK Moomin Keycaps','I am selling my spot in the GMK moomin group by. I have everything coming. ',50000),(67,'Mysterium PCB','Selling a mysterium PCB. It is brand new straight from a PCB Manufacturer.',8000),(68,'Mysterium Acrylic Case','Selling Laser cut mysterium acrylic case. It is blue transparent acrylic.',10000),(69,'Keychron Q2','Selling Used keychron Q2 65% keyboard. It is in like new condition.',15000),(70,'Corsair K65','Selling new corsair K65. It has cherry mx red switches.',10000),(75,'Nord Keycaps','I am selling my nord keycaps. They are new and in excellent condition',10000),(77,'Edited Super secret google keyboard','Edited This is a super secret google protype keyboard. One of kind',1000000);
/*!40000 ALTER TABLE `listing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manf_by`
--

DROP TABLE IF EXISTS `manf_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manf_by` (
  `listing_id` int NOT NULL,
  `brand_id` int NOT NULL,
  PRIMARY KEY (`brand_id`,`listing_id`),
  KEY `listing_id` (`listing_id`),
  CONSTRAINT `manf_by_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`listing_id`) ON DELETE CASCADE,
  CONSTRAINT `manf_by_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manf_by`
--

LOCK TABLES `manf_by` WRITE;
/*!40000 ALTER TABLE `manf_by` DISABLE KEYS */;
INSERT INTO `manf_by` VALUES (44,15),(46,16),(47,16),(48,1),(58,19),(60,17),(61,18),(62,16),(63,19),(64,4),(65,15),(66,16),(67,15),(68,15),(69,5),(70,8),(75,16),(77,15);
/*!40000 ALTER TABLE `manf_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saves`
--

DROP TABLE IF EXISTS `saves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saves` (
  `user_id` int NOT NULL,
  `listing_id` int NOT NULL,
  UNIQUE KEY `saves` (`user_id`,`listing_id`),
  KEY `listing_id` (`listing_id`),
  CONSTRAINT `saves_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`listing_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saves`
--

LOCK TABLES `saves` WRITE;
/*!40000 ALTER TABLE `saves` DISABLE KEYS */;
INSERT INTO `saves` VALUES (1,44),(10,44),(24,44),(6,46),(10,58),(13,60),(13,61),(22,61),(12,62),(15,62),(23,63),(19,67),(19,70);
/*!40000 ALTER TABLE `saves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) NOT NULL,
  `isValid` tinyint DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'4159393125',1),(6,'14159393125',1),(8,'5101234567',1),(10,'5101224567',1),(11,'1235432345',1),(13,'1237894523',1),(14,'1234567890',1),(15,'3123123123',1),(17,'4145524234',1),(18,'4134343125',1),(19,'1231456789',1),(22,'4237558885',1),(23,'3163538564',1),(24,'14159394324',1);
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sold_by`
--

DROP TABLE IF EXISTS `sold_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sold_by` (
  `user_id` int NOT NULL,
  `listing_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`listing_id`),
  KEY `listing_id` (`listing_id`),
  CONSTRAINT `sold_by_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`listing_id`) ON DELETE CASCADE,
  CONSTRAINT `sold_by_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `seller` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sold_by`
--

LOCK TABLES `sold_by` WRITE;
/*!40000 ALTER TABLE `sold_by` DISABLE KEYS */;
INSERT INTO `sold_by` VALUES (6,44),(6,46),(6,47),(8,48),(10,58),(1,60),(11,61),(11,62),(10,63),(10,64),(13,65),(13,66),(14,67),(14,68),(15,69),(15,70),(1,75),(23,77);
/*!40000 ALTER TABLE `sold_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password_hash` varchar(128) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'sjkchang','sjkchang@gmail.com','$2b$10$4h/x1TQU1Gflmtx.jq5KnuVB5.3NjVY4TD97GubEzd9IeCAsdfory'),(6,'stchang','steven.chang@sjsu.edu','$2b$10$MxBDA1vVBWSIht944OOS6uSC7PyMBHeYLINmC.Uk34UiQ0NH5lwQG'),(8,'justin','justin.lo@sjsu.edu','$2b$10$z38tmWq8YXuukFO8mE69luCsQrOfUYCY1CJaMCUculNuFqZQQNqYy'),(10,'sayeed','sayeed.n@sjsu.edu','$2b$10$MDft5sAR/apXK6iRkxUq1uXN.HO5b0r8NZHjuDK1Jwltja31EuMj2'),(11,'username','email@gmail.com','$2b$10$dzdzeT/0yXuxKIoNEQTtCusqZebE3dgU7MeEutC/gFsNO3DRGpW2m'),(12,'searek','ssearek@gmail.com','$2b$10$CoQJVetZI40SoekslejZFe2mKrxvkACJR7mrWsnUMBEvbxTuRKWR.'),(13,'username2','testemail2@gmail.com','$2b$10$ywkygn68pyzP4T6grSFsqetPqOsO395YseTKO9T2WmfhSU8HnEhdK'),(14,'testuser','testuser@yahoo.com','$2b$10$al/E5TPhXio4G8hCoIxxFuL9nNJe61f83OtKaVtfxK9SpXkE0Yhs.'),(15,'aaa','aaa@aol.com','$2b$10$9r5Lzu0lh8yhHBwAN8Kgsul6JUyur5.p4HQ57kWvrLJy0EUAKHsya'),(16,'bbb','bbb@yahoo.com','$2b$10$o3lo3uVvZYOyHQtn7qAdK.7VSb9umYPMrmiZsdG7rExRqLIl56C6q'),(17,'ccc','ccc@gmail.com','$2b$10$X3GFBVzBy1bRq13jdJ3jNew4FbpxTZzfWT4ABMGpmApgcMBT2SKBa'),(18,'ddd','ddd@gmail.com','$2b$10$k0RS4A/VolF9IDSOnQcr3ubRTHNjH11McQidxQ9j6f33Iovj2nJU2'),(19,'asdf','asdf@gmail.com','$2b$10$St3u6uASZOyEtA8yhwvobeCz3KkCP5znpaKP/o3k8NEmiQ6Rzkfza'),(20,'eee','eee@gmail.com','$2b$10$54CsBJrPdhDPnYA6OSh6jee8wXsZusTpECiOkf/4OSDpxmC4.OFpW'),(22,'fff','fff@email.com','$2b$10$UEAKh7YaEMNYl5We.tYLfOzJ99MvVIY2NYU95M8QhlKhagK.2OM6.'),(23,'mikewu','mike.wu@sjsu.edu','$2b$10$gz7eDtvkYtjZiYEmfCPX3uuI3IDFHp7azu9GW516Lbg1.827tSHmq'),(24,'testaaa','testaaa@gmail.com','$2b$10$UXb2WgR2fRabNYsnBsnm1O/gr.ANTq.VdAOH2PaTOc9wunR5nYiMS');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-11 11:15:46
