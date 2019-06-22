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
-- Table structure for table `chamado_final`
--

DROP TABLE IF EXISTS `chamado_final`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chamado_final` (
  `cod_fechamento` int(11) NOT NULL AUTO_INCREMENT,
  `cod_chamado` int(11) NOT NULL,
  `id_dispositivo` varchar(40) NOT NULL,
  `data_fechamento` datetime NOT NULL,
  `valor` float NOT NULL,
  PRIMARY KEY (`cod_fechamento`),
  KEY `FK_cod_chamado_final` (`cod_chamado`),
  KEY `FK_id_dispositivo_final` (`id_dispositivo`),
  CONSTRAINT `FK_cod_chamado_final` FOREIGN KEY (`cod_chamado`) REFERENCES `chamado_cliente` (`cod_chamado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_dispositivo_final` FOREIGN KEY (`id_dispositivo`) REFERENCES `chamado_motorista_aceite` (`id_dispositivo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamado_final`
--

LOCK TABLES `chamado_final` WRITE;
/*!40000 ALTER TABLE `chamado_final` DISABLE KEYS */;
INSERT INTO `chamado_final` VALUES (12,37,'2','2010-12-10 00:37:14',50),(13,38,'2','2010-12-10 00:53:50',25),(14,39,'1','2010-12-10 00:56:15',25),(15,40,'1','2010-12-10 01:00:55',3000),(16,44,'1','2010-12-10 22:44:24',30),(17,45,'1','2010-12-12 16:59:38',120),(18,46,'1','2010-12-12 18:53:34',100),(19,47,'2','2010-12-12 18:59:53',34),(20,49,'2','2010-12-12 19:23:55',36),(21,52,'91293092','2010-12-13 16:35:40',100),(22,54,'91293092','2010-12-13 17:04:08',500),(23,55,'91293092','2010-12-13 20:01:56',100);
/*!40000 ALTER TABLE `chamado_final` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-12-14 18:15:48
