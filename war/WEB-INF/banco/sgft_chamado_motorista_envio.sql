CREATE DATABASE  IF NOT EXISTS `sgft` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sgft`;
-- MySQL dump 10.13  Distrib 5.1.40, for Win32 (ia32)
--
-- Host: localhost    Database: sgft
-- ------------------------------------------------------
-- Server version	5.1.46-community

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
-- Table structure for table `chamado_motorista_envio`
--

DROP TABLE IF EXISTS `chamado_motorista_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chamado_motorista_envio` (
  `cod_envio` int(11) NOT NULL AUTO_INCREMENT,
  `cod_chamado` int(11) NOT NULL,
  `id_dispositivo` varchar(40) NOT NULL,
  `data_envio` datetime NOT NULL,
  PRIMARY KEY (`cod_envio`),
  KEY `FK_cod_chamado` (`cod_chamado`),
  KEY `FK_id_dispositivo` (`id_dispositivo`),
  CONSTRAINT `FK_cod_chamado` FOREIGN KEY (`cod_chamado`) REFERENCES `chamado_cliente` (`cod_chamado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_dispositivo` FOREIGN KEY (`id_dispositivo`) REFERENCES `motorista` (`id_dispositivo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamado_motorista_envio`
--

LOCK TABLES `chamado_motorista_envio` WRITE;
/*!40000 ALTER TABLE `chamado_motorista_envio` DISABLE KEYS */;
INSERT INTO `chamado_motorista_envio` VALUES (28,36,'2','2010-12-09 23:42:19'),(29,37,'1','2010-12-09 23:51:29'),(30,37,'2','2010-12-09 23:57:27'),(31,38,'2','2010-12-10 00:50:00'),(32,39,'1','2010-12-10 00:52:13'),(33,40,'1','2010-12-10 00:59:35'),(34,42,'2','2010-12-10 01:20:28'),(35,43,'2','2010-12-10 21:35:27'),(36,43,'1','2010-12-10 21:40:02'),(37,44,'2','2010-12-10 22:42:01'),(38,44,'1','2010-12-10 22:43:08'),(39,45,'1','2010-12-12 16:35:12'),(40,46,'2','2010-12-12 18:46:00'),(41,46,'1','2010-12-12 18:52:32'),(42,47,'2','2010-12-12 18:56:36'),(43,48,'2','2010-12-12 19:06:06'),(44,49,'2','2010-12-12 19:22:58'),(45,51,'91293092','2010-12-13 15:50:00'),(46,52,'91293092','2010-12-13 16:31:58'),(47,53,'91293092','2010-12-13 16:42:04'),(48,54,'91293092','2010-12-13 17:03:07'),(49,55,'91293092','2010-12-13 19:55:00'),(50,57,'91293092','2010-12-13 20:07:37');
/*!40000 ALTER TABLE `chamado_motorista_envio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-12-14 18:15:46
