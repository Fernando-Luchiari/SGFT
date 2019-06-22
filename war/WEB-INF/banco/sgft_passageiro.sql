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
-- Table structure for table `passageiro`
--

DROP TABLE IF EXISTS `passageiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passageiro` (
  `cod_passageiro` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(12) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `estado` char(2) NOT NULL,
  `conveniado` bit(1) NOT NULL,
  `cod_convenio` int(11) DEFAULT NULL,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  `dataInclusao` datetime NOT NULL,
  `cep` char(10) NOT NULL,
  `telefone` char(10) NOT NULL,
  `ddd` char(3) NOT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_passageiro`),
  UNIQUE KEY `cod_passageiro_UNIQUE` (`cod_passageiro`),
  KEY `cod_convenio` (`cod_convenio`),
  KEY `passageiro_convenio` (`cod_convenio`),
  CONSTRAINT `passageiro_convenio` FOREIGN KEY (`cod_convenio`) REFERENCES `convenio` (`cod_convenio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passageiro`
--

LOCK TABLES `passageiro` WRITE;
/*!40000 ALTER TABLE `passageiro` DISABLE KEYS */;
INSERT INTO `passageiro` VALUES (36,'Denis Cassiano','23022708866','Rua Amborés','106','Cidade Vargas','São Paulo','SP','',8,'','2010-12-09 23:26:14','','50213227','11',''),(37,'Brandon Jacobs','51365556450','Av. Jabaquara','1501','Saúde','São Paulo','SP','',8,'','2010-12-09 23:33:37','','20204343','11',''),(38,'Reinaldo','64934826580','Ilha de Tatuoca','159','São Miguel','São Paulo','SP','',9,'','2010-12-13 15:29:15','08042120','35492138','11','Cidade Nova'),(39,'Manocchio','27413158418','Ilha de Tatuoca','130','São Miguel','São Paulo','SP','',8,'','2010-12-13 17:00:49','08042120','35492138','11','');
/*!40000 ALTER TABLE `passageiro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-12-14 18:15:47
