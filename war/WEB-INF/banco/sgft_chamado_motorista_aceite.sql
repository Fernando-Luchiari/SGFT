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
-- Table structure for table `chamado_motorista_aceite`
--

DROP TABLE IF EXISTS `chamado_motorista_aceite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chamado_motorista_aceite` (
  `cod_aceite` int(11) NOT NULL AUTO_INCREMENT,
  `id_dispositivo` varchar(40) NOT NULL,
  `cod_chamado` int(11) NOT NULL,
  `data_aceite` datetime NOT NULL,
  `justificativa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_aceite`),
  KEY `FK_id_dispositivo_aceite` (`id_dispositivo`),
  KEY `FK_cod_chamado_aceite` (`cod_chamado`),
  CONSTRAINT `FK_cod_chamado_aceite` FOREIGN KEY (`cod_chamado`) REFERENCES `chamado_cliente` (`cod_chamado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_dispositivo_aceite` FOREIGN KEY (`id_dispositivo`) REFERENCES `chamado_motorista_envio` (`id_dispositivo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamado_motorista_aceite`
--

LOCK TABLES `chamado_motorista_aceite` WRITE;
/*!40000 ALTER TABLE `chamado_motorista_aceite` DISABLE KEYS */;
INSERT INTO `chamado_motorista_aceite` VALUES (36,'2',36,'2010-12-09 23:52:49','Testeeeeeeee\r\n'),(37,'1',37,'2010-12-09 23:57:27','Testeeeee'),(38,'2',37,'2010-12-09 23:58:56',NULL),(39,'2',37,'2010-12-09 23:59:36',NULL),(40,'2',37,'2010-12-10 00:10:34',NULL),(41,'2',37,'2010-12-10 00:13:00',NULL),(42,'2',37,'2010-12-10 00:13:47',NULL),(43,'2',38,'2010-12-10 00:53:01',NULL),(44,'2',38,'2010-12-10 00:53:12',NULL),(45,'1',39,'2010-12-10 00:55:41',NULL),(46,'1',40,'2010-12-10 01:00:34',NULL),(47,'2',42,'2010-12-10 01:39:20','Chamado recusado por demora de resposta'),(48,'2',43,'2010-12-10 21:40:01','desculpaaaaaa'),(49,'2',44,'2010-12-10 22:43:06','recusei essa porra'),(50,'1',44,'2010-12-10 22:44:07',NULL),(51,'1',45,'2010-12-12 16:37:01',NULL),(52,'2',46,'2010-12-12 18:52:32','VAI SE FODER'),(53,'1',46,'2010-12-12 18:53:13',NULL),(54,'2',47,'2010-12-12 18:58:25',NULL),(55,'2',49,'2010-12-12 19:23:49',NULL),(56,'91293092',51,'2010-12-13 16:25:48','Não quero ir até lah.. é muito longe!!'),(57,'91293092',52,'2010-12-13 16:34:45',NULL),(58,'91293092',53,'2010-12-13 16:51:34','Chamado recusado por demora de resposta'),(59,'91293092',54,'2010-12-13 17:03:50',NULL),(60,'91293092',55,'2010-12-13 20:01:12',NULL),(61,'91293092',57,'2010-12-13 20:17:12','Chamado recusado por demora de resposta');
/*!40000 ALTER TABLE `chamado_motorista_aceite` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-12-14 18:15:49
