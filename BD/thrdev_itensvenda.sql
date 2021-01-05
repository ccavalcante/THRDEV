CREATE DATABASE  IF NOT EXISTS `thrdev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `thrdev`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: thrdev
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `itensvenda`
--

DROP TABLE IF EXISTS `itensvenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itensvenda` (
  `IDITENSVENDA` int NOT NULL AUTO_INCREMENT,
  `IDVENDAS` int DEFAULT NULL,
  `IDPRODUTOS` int DEFAULT NULL,
  `DESCRICAO` varchar(60) DEFAULT NULL,
  `QUANTIDADE` decimal(10,0) DEFAULT NULL,
  `VALORTOTAL` double DEFAULT NULL,
  `DATAVENDA` date DEFAULT NULL,
  PRIMARY KEY (`IDITENSVENDA`),
  KEY `idvendas_idx` (`IDVENDAS`),
  KEY `idprodutos_idx` (`IDPRODUTOS`),
  CONSTRAINT `idprodutos` FOREIGN KEY (`IDPRODUTOS`) REFERENCES `produtos` (`IDPRODUTOS`),
  CONSTRAINT `idvendas` FOREIGN KEY (`IDVENDAS`) REFERENCES `vendas` (`IDVENDAS`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itensvenda`
--

LOCK TABLES `itensvenda` WRITE;
/*!40000 ALTER TABLE `itensvenda` DISABLE KEYS */;
INSERT INTO `itensvenda` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL),(2,46,3,'Calça Jeans',3,168,'2021-01-02'),(3,46,4,'Blusa social',3,201,'2021-01-02'),(4,46,5,'Meia esportiva',6,72,'2021-01-02'),(5,48,8,'Camiseta de moleton',5,325,'2021-01-02'),(6,48,7,'Camiseta polo',7,455,'2021-01-02'),(7,48,6,'Cueca ',6,324,'2021-01-02'),(8,48,2,'Calça moleton',5,280,'2021-01-02'),(9,49,2,'Calça moleton',2,112,'2021-01-02'),(10,49,3,'Calça Jeans',3,168,'2021-01-02'),(11,50,6,'Cueca ',7,378,'2021-01-02'),(12,50,3,'Calça Jeans',3,168,'2021-01-02'),(13,50,5,'Meia esportiva',4,48,'2021-01-02'),(14,51,3,'Calça Jeans',3,168,'2021-01-02'),(15,51,3,'Calça Jeans',3,168,'2021-01-02'),(16,51,5,'Meia esportiva',5,60,'2021-01-02'),(17,51,7,'Camiseta polo',4,260,'2021-01-02'),(18,52,3,'Calça Jeans',3,168,'2021-01-02'),(19,52,2,'Calça moleton',4,224,'2021-01-02'),(20,52,6,'Cueca ',8,432,'2021-01-02'),(21,53,3,'Calça Jeans',3,168,'2021-01-02'),(22,53,4,'Blusa social',4,268,'2021-01-02'),(23,53,5,'Meia esportiva',7,84,'2021-01-02'),(24,54,3,'Calça Jeans',3,168,'2021-01-02'),(25,54,2,'Calça moleton',1,56,'2021-01-02'),(26,54,4,'Blusa social',4,268,'2021-01-02'),(27,55,2,'Calça moleton',3,168,'2021-01-02'),(28,55,1,'Calça moleton',3,195,'2021-01-02'),(29,56,3,'Calça Jeans',3,168,'2021-01-02'),(30,56,2,'Calça moleton',2,112,'2021-01-02'),(31,57,6,'Cueca ',7,378,'2021-01-02'),(32,57,4,'Blusa social',3,201,'2021-01-02'),(33,58,3,'Calça Jeans',3,168,'2021-01-02'),(34,58,4,'Blusa social',4,268,'2021-01-02'),(35,59,2,'Calça moleton',2,112,'2021-01-02'),(36,59,3,'Calça Jeans',3,168,'2021-01-02'),(37,60,3,'Calça Jeans',3,168,'2021-01-02'),(38,60,4,'Blusa social',4,268,'2021-01-02'),(39,61,3,'Calça Jeans',4,224,'2021-01-02'),(40,61,4,'Blusa social',5,335,'2021-01-02'),(41,61,7,'Camiseta polo',8,520,'2021-01-02'),(42,62,3,'Calça Jeans',3,168,'2021-01-02'),(43,62,4,'Blusa social',4,268,'2021-01-02'),(44,63,3,'Calça Jeans',3,168,'2021-01-02'),(45,63,4,'Blusa social',4,268,'2021-01-02'),(46,64,3,'Calça Jeans',3,168,'2021-01-02'),(47,64,2,'Calça moleton',3,168,'2021-01-02'),(48,64,5,'Meia esportiva',7,84,'2021-01-02'),(49,65,3,'Calça Jeans',3,168,'2021-01-02'),(50,65,2,'Calça moleton',3,168,'2021-01-02'),(51,66,2,'Calça moleton',2,112,'2021-01-02'),(52,66,4,'Blusa social',4,268,'2021-01-02'),(53,67,2,'Calça moleton',2,112,'2021-01-02'),(54,67,3,'Calça Jeans',3,168,'2021-01-02'),(55,68,2,'Calça moleton',2,112,'2021-01-02'),(56,68,5,'Meia esportiva',5,60,'2021-01-02'),(57,68,3,'Calça Jeans',7,392,'2021-01-02'),(58,69,3,'Calça Jeans',3,168,'2021-01-02'),(59,69,2,'Calça moleton',5,280,'2021-01-02'),(60,69,6,'Cueca ',6,324,'2021-01-02'),(61,69,5,'Meia esportiva',6,72,'2021-01-02'),(62,70,2,'Calça moleton',3,168,'2021-01-02'),(63,70,4,'Blusa social',4,268,'2021-01-02'),(64,70,2,'Calça moleton',4,224,'2021-01-02'),(65,70,6,'Cueca ',7,378,'2021-01-02'),(66,71,3,'Calça Jeans',3,168,'2021-01-02'),(67,71,4,'Blusa social',4,268,'2021-01-02'),(68,71,6,'Cueca ',4,216,'2021-01-02'),(69,71,5,'Meia esportiva',3,36,'2021-01-02'),(70,72,2,'Calça moleton',2,112,'2021-01-02'),(71,72,6,'Cueca ',3,162,'2021-01-02'),(72,72,5,'Meia esportiva',3,36,'2021-01-02'),(73,72,4,'Blusa social',4,268,'2021-01-02'),(74,73,2,'Calça moleton',2,112,'2021-01-02'),(75,73,3,'Calça Jeans',3,168,'2021-01-02'),(76,73,3,'Calça Jeans',3,168,'2021-01-02'),(77,74,3,'Calça Jeans',3,168,'2021-01-02'),(78,74,3,'Calça Jeans',3,168,'2021-01-02'),(79,74,4,'Blusa social',3,201,'2021-01-02'),(80,74,7,'Camiseta polo',7,455,'2021-01-02'),(81,74,6,'Cueca ',7,378,'2021-01-02'),(82,74,7,'Camiseta polo',7,455,'2021-01-02');
/*!40000 ALTER TABLE `itensvenda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-05  9:52:42
