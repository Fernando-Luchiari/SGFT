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
-- Table structure for table `motorista`
--

DROP TABLE IF EXISTS `motorista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motorista` (
  `id_dispositivo` varchar(40) NOT NULL,
  `cod_funcionario` int(11) NOT NULL,
  `ano_veiculo` int(11) NOT NULL,
  `modelo_veiculo` varchar(45) NOT NULL,
  `placa_veiculo` varchar(10) NOT NULL,
  `proprietario` bit(1) NOT NULL,
  `senha` varchar(7) NOT NULL,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  `dataInclusao` datetime NOT NULL,
  `status` int(11) DEFAULT '0',
  `statusWeb` int(1) DEFAULT '0',
  PRIMARY KEY (`id_dispositivo`),
  KEY `motorista_funcionario` (`cod_funcionario`),
  CONSTRAINT `motorista_funcionario` FOREIGN KEY (`cod_funcionario`) REFERENCES `funcionario` (`cod_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motorista`
--

LOCK TABLES `motorista` WRITE;
/*!40000 ALTER TABLE `motorista` DISABLE KEYS */;
INSERT INTO `motorista` VALUES ('1',80,2010,'Camaro','CAM-2010','','1','','2010-12-09 23:22:57',0,0),('2',81,2011,'Fiat Stilo','XXX-2090','','2','','2010-12-09 23:36:35',1,0),('91293092',83,0,'','','\0','senha','','2010-12-12 21:05:56',0,1),('99304809',87,0,'','','\0','senha','','2010-12-14 09:23:11',0,0);
/*!40000 ALTER TABLE `motorista` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-12-14 18:15:51
