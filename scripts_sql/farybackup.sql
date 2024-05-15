-- MariaDB dump 10.19  Distrib 10.11.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: faryadventures
-- ------------------------------------------------------
-- Server version	10.11.4-MariaDB-1~deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `id_character` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(24) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` char(1) NOT NULL,
  `level` int(11) NOT NULL,
  `health` int(11) NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `origin` char(2) NOT NULL,
  PRIMARY KEY (`id_character`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES
(1,'El Fary',86,'N',200,70,1.2,47,'GY'),
(2,'El Cigala',45,'M',150,80,2.4,150,'RO'),
(3,'El Churumbel',33,'M',33,33,3.3,333,'MA'),
(4,'El Kiko',1,'F',69,100,1.1,420,'RE'),
(5,'El Escalona',51,'M',10,50,1.7,80,'SB');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters_items`
--

DROP TABLE IF EXISTS `characters_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters_items` (
  `id_character_item` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_character` int(10) unsigned NOT NULL,
  `id_item` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_character_item`),
  KEY `id_character` (`id_character`),
  KEY `id_item` (`id_item`),
  CONSTRAINT `characters_items_ibfk_1` FOREIGN KEY (`id_character`) REFERENCES `characters` (`id_character`),
  CONSTRAINT `characters_items_ibfk_2` FOREIGN KEY (`id_item`) REFERENCES `items` (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters_items`
--

LOCK TABLES `characters_items` WRITE;
/*!40000 ALTER TABLE `characters_items` DISABLE KEYS */;
INSERT INTO `characters_items` VALUES
(1,1,5),
(2,2,5),
(3,4,5),
(4,2,7),
(5,1,6),
(6,2,2),
(7,2,6),
(8,1,2),
(9,3,6),
(10,1,7);
/*!40000 ALTER TABLE `characters_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters_weapons`
--

DROP TABLE IF EXISTS `characters_weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters_weapons` (
  `id_character_weapon` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_character` int(10) unsigned NOT NULL,
  `id_weapon` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_character_weapon`),
  KEY `id_character` (`id_character`),
  KEY `id_weapon` (`id_weapon`),
  CONSTRAINT `characters_weapons_ibfk_1` FOREIGN KEY (`id_character`) REFERENCES `characters` (`id_character`),
  CONSTRAINT `characters_weapons_ibfk_2` FOREIGN KEY (`id_weapon`) REFERENCES `weapons` (`id_weapon`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters_weapons`
--

LOCK TABLES `characters_weapons` WRITE;
/*!40000 ALTER TABLE `characters_weapons` DISABLE KEYS */;
INSERT INTO `characters_weapons` VALUES
(1,2,3),
(2,3,1),
(3,1,3),
(4,1,2);
/*!40000 ALTER TABLE `characters_weapons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id_item` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(24) NOT NULL,
  `type` varchar(24) NOT NULL,
  `weight` float NOT NULL,
  `shape` int(11) NOT NULL,
  `equippable` tinyint(1) NOT NULL,
  `rarity` int(11) NOT NULL,
  `uses` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES
(1,'Bollo','Comida',0.1,3,0,5,1,1),
(2,'Guitarra Flamenca','Instrumento',1,4,1,100,100,1),
(3,'Piti','Droga',0.01,1,1,10,1,1),
(4,'Portatil','Tecnologia',2,5,1,30,100,1),
(5,'Pandereta','Instrumento',0.2,1,1,40,1000,1),
(6,'Piano','Instrumento',6,1,1,75,2000,1),
(7,'Escobilla','Limpieza',0.1,1,1,20,1000,1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats` (
  `id_stat` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reputation` int(11) NOT NULL,
  `speed` int(11) NOT NULL,
  `morality` int(11) NOT NULL,
  `defense` int(11) NOT NULL,
  `hunger` int(11) NOT NULL,
  `reflex` int(11) NOT NULL,
  `stamina` int(11) NOT NULL,
  `id_character` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_stat`),
  KEY `id_character` (`id_character`),
  CONSTRAINT `stats_ibfk_1` FOREIGN KEY (`id_character`) REFERENCES `characters` (`id_character`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
INSERT INTO `stats` VALUES
(1,100,40,80,10,0,0,-1,1),
(2,60,50,40,5,0,1,10,2),
(3,75,30,75,7,0,0,50,3),
(4,90,60,80,4,0,1,30,4);
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapon_types`
--

DROP TABLE IF EXISTS `weapon_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weapon_types` (
  `id_weapon_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(24) NOT NULL,
  PRIMARY KEY (`id_weapon_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapon_types`
--

LOCK TABLES `weapon_types` WRITE;
/*!40000 ALTER TABLE `weapon_types` DISABLE KEYS */;
INSERT INTO `weapon_types` VALUES
(1,'melee'),
(2,'proyectil');
/*!40000 ALTER TABLE `weapon_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons`
--

DROP TABLE IF EXISTS `weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weapons` (
  `id_weapon` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weapon` varchar(24) NOT NULL,
  `level` int(11) NOT NULL,
  `damage` int(11) NOT NULL,
  `weight` float NOT NULL,
  `critical` int(11) NOT NULL,
  `id_weapon_type` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_weapon`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons`
--

LOCK TABLES `weapons` WRITE;
/*!40000 ALTER TABLE `weapons` DISABLE KEYS */;
INSERT INTO `weapons` VALUES
(1,'Puños',5,10,0.25,5,1),
(2,'SPAS-12',50,80,2,10,2),
(3,'Extensible',25,20,0.25,10,1),
(4,'Taser',30,40,0.25,50,1),
(5,'Maquinilla de Afeitar',30,15,0.25,5,1);
/*!40000 ALTER TABLE `weapons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-15 12:53:31
