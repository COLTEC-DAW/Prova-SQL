-- MySQL dump 10.13  Distrib 5.6.17, for osx10.7 (x86_64)
--
-- Host: localhost    Database: federacao_tenis
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `campeonatos`
--

LOCK TABLES `campeonatos` WRITE;
/*!40000 ALTER TABLE `campeonatos` DISABLE KEYS */;
INSERT INTO `campeonatos` VALUES (1,'US Open','1','2000-01-01 00:00:00',250000.00),(2,'Wimbledon','3','2014-01-01 00:00:00',100000.00),(3,'Roland Garros','1','2000-01-01 00:00:00',10000.00),(4,'Roland Garros','2','2002-01-01 00:00:00',10000.00),(5,'Australia Open','12','2015-01-01 00:00:00',500000.00),(6,'Brazil Open','10','2014-01-01 00:00:00',250000.00),(7,'US Open','2','2010-01-01 00:00:00',1000000.00);
/*!40000 ALTER TABLE `campeonatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Amador'),(2,'Profissional');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `jogos`
--

LOCK TABLES `jogos` WRITE;
/*!40000 ALTER TABLE `jogos` DISABLE KEYS */;
INSERT INTO `jogos` VALUES (1,2,1,10000,3,0,1),(1,2,3,12000,3,1,2),(1,4,3,15000,2,3,2),(2,1,4,9000,3,0,5),(2,5,2,8000,1,3,6),(3,5,2,17000,0,3,6),(4,6,5,15000,3,0,3),(6,1,5,25000,3,1,3),(6,2,5,20000,2,3,3),(6,3,5,12000,3,2,3),(6,9,5,8500,1,3,3),(7,8,3,9500,1,3,9),(7,8,4,10500,3,0,9),(8,7,2,13500,1,3,6),(8,7,3,15000,3,6,6),(8,7,5,12000,3,2,3),(9,1,5,6500,3,0,5),(9,1,6,5000,3,1,5);
/*!40000 ALTER TABLE `jogos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `quadras`
--

LOCK TABLES `quadras` WRITE;
/*!40000 ALTER TABLE `quadras` DISABLE KEYS */;
INSERT INTO `quadras` VALUES (1,'Saibro','Inglaterra'),(2,'Saibro','França'),(3,'Saibro','Austrália'),(4,'Saibro','Estados Unidos'),(5,'Saibro','Brasil'),(6,'Grama','Inglaterra'),(7,'Grama','Estados Unidos'),(8,'Grama','Brasil'),(9,'Grama','França'),(10,'Grama','Alemanha');
/*!40000 ALTER TABLE `quadras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tenistas`
--

LOCK TABLES `tenistas` WRITE;
/*!40000 ALTER TABLE `tenistas` DISABLE KEYS */;
INSERT INTO `tenistas` VALUES (1,'Guga','1980-08-08 00:00:00','',2),(2,'Federer','1986-01-01 00:00:00','',2),(3,'Nadal','1975-01-01 00:00:00','',2),(4,'Djokovic','1984-01-01 00:00:00','',2),(5,'Murray','1981-01-01 00:00:00','',2),(6,'Wawrinka','1985-01-01 00:00:00','',2),(7,'Serena','1980-01-01 00:00:00','\0',2),(8,'Sharapova','1989-01-01 00:00:00','\0',2),(9,'Daniel San','1995-01-01 00:00:00','',1);
/*!40000 ALTER TABLE `tenistas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-24 22:29:52
