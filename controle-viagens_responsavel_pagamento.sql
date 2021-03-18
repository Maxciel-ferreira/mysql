-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: controle-viagens
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `responsavel_pagamento`
--

DROP TABLE IF EXISTS `responsavel_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsavel_pagamento` (
  `ID_ResPagamanento` int NOT NULL AUTO_INCREMENT,
  `centroDeCusto` varchar(8) DEFAULT NULL,
  `ContaContabil` varchar(10) DEFAULT NULL,
  `GestorResponsavel` varchar(150) DEFAULT NULL,
  `ConfereGestor` varchar(3) DEFAULT NULL,
  `Nºsolicitacao` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`ID_ResPagamanento`),
  KEY `fk_SolResPagamento` (`Nºsolicitacao`),
  CONSTRAINT `fk_SolResPagamento` FOREIGN KEY (`Nºsolicitacao`) REFERENCES `viajantes` (`Nºsolicitacao`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsavel_pagamento`
--

LOCK TABLES `responsavel_pagamento` WRITE;
/*!40000 ALTER TABLE `responsavel_pagamento` DISABLE KEYS */;
INSERT INTO `responsavel_pagamento` VALUES (1,'90100214','411075001','ELCIO MADRUGA','SIM','255234'),(2,'90100215','411075002','ELCIO MADRUGA','','255235'),(3,'90100216','411075001','CARLOS MIGUEL','SIM','255236'),(4,'90100214','411075001','IVETE NUNES','','255237'),(5,'90100217','411075003','CATIA MEDEIROS','','255238'),(6,'90100217','411075003','EDUARDO BARROS','','255239');
/*!40000 ALTER TABLE `responsavel_pagamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `responsavel_pagamento_AFTER_UPDATE` AFTER UPDATE ON `responsavel_pagamento` FOR EACH ROW BEGIN
INSERT INTO conferencia VALUES(NULL,old.GestorResponsavel,OLD.Nºsolicitacao);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-18 13:17:43
