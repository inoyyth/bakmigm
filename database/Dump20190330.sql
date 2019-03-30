-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: edocument
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
-- Table structure for table `tb_menus`
--

DROP TABLE IF EXISTS `tb_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `parent` tinyint(4) DEFAULT NULL,
  `type` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_menus`
--

LOCK TABLES `tb_menus` WRITE;
/*!40000 ALTER TABLE `tb_menus` DISABLE KEYS */;
INSERT INTO `tb_menus` VALUES (1,'Pencarian','C_menu','fa-bookmark',0,1),(2,'Favoritku','bookmarks',NULL,0,1),(4,'Aktivitas','notification',NULL,0,1),(5,'News','news',NULL,0,0),(6,'Persetujuan','approval',NULL,0,0),(7,'Kontribusi','contribution',NULL,0,1),(8,'Report','report',NULL,0,1),(9,'Komentar','comentar',NULL,0,0),(10,'Setting','#',NULL,0,1),(11,'General Setting','#',NULL,NULL,1),(12,'Data Master','C_setting_data_master',NULL,10,1),(13,'Struktur Organisasi','C_setting_structure_organization',NULL,10,1),(14,'User','C_setting_user',NULL,10,1),(15,'Struktur Dokumen','C_setting_sturcture_document',NULL,10,1),(16,'Aturan Bisnis','C_setting_business_rule',NULL,10,1),(17,'Tingkat Akses Dokumen','C_setting_document_access_level',NULL,10,1),(18,'Welcome Speech','C_general_setting/welcome_speech',NULL,11,1),(19,'Nomor Dokumen','C_general_setting/nomor',NULL,11,1),(20,'Sharelink','C_general_setting/sharelink',NULL,11,1),(21,'Watermark','C_general_setting/watermark',NULL,11,1),(22,'Role Menus','role-menus',NULL,10,1),(23,'Pengkinian','revise',NULL,0,0),(24,'Sharelink Document','sharelink-document',NULL,0,0);
/*!40000 ALTER TABLE `tb_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_roles`
--

DROP TABLE IF EXISTS `tb_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_roles` (
  `RS_ID` varchar(255) NOT NULL DEFAULT '-',
  `RS_DESC` text NOT NULL,
  `RS_BY` varchar(255) NOT NULL,
  `RS_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RS_INDEX` int(255) NOT NULL,
  `ROLE_MENUS` text,
  PRIMARY KEY (`RS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_roles`
--

LOCK TABLES `tb_roles` WRITE;
/*!40000 ALTER TABLE `tb_roles` DISABLE KEYS */;
INSERT INTO `tb_roles` VALUES ('ADMIN DOKUMEN','Admin dokumen','ADMIN KONFIGURASI','2019-01-22 23:34:23',3,'a:19:{i:0;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"1\";s:5:\"value\";s:1:\"0\";}}i:1;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"2\";s:5:\"value\";s:1:\"0\";}}i:2;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"4\";s:5:\"value\";s:1:\"0\";}}i:3;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"5\";s:5:\"value\";s:1:\"0\";}}i:4;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"6\";s:5:\"value\";s:1:\"0\";}}i:5;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"7\";s:5:\"value\";s:1:\"0\";}}i:6;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"8\";s:5:\"value\";s:1:\"0\";}}i:7;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"9\";s:5:\"value\";s:1:\"0\";}}i:8;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"12\";s:5:\"value\";s:1:\"1\";}}i:9;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"13\";s:5:\"value\";s:1:\"1\";}}i:10;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"14\";s:5:\"value\";s:1:\"1\";}}i:11;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"15\";s:5:\"value\";s:1:\"1\";}}i:12;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"16\";s:5:\"value\";s:1:\"1\";}}i:13;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"17\";s:5:\"value\";s:1:\"1\";}}i:14;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"18\";s:5:\"value\";s:1:\"0\";}}i:15;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"19\";s:5:\"value\";s:1:\"0\";}}i:16;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"20\";s:5:\"value\";s:1:\"0\";}}i:17;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"21\";s:5:\"value\";s:1:\"0\";}}i:18;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"22\";s:5:\"value\";s:1:\"0\";}}}'),('ADMIN KONFIGURASI','Konfigurasi aplikasi','ADMIN KONFIGURASI','2019-01-22 23:34:23',5,'a:19:{i:0;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"1\";s:5:\"value\";s:1:\"0\";}}i:1;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"2\";s:5:\"value\";s:1:\"0\";}}i:2;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"4\";s:5:\"value\";s:1:\"0\";}}i:3;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"5\";s:5:\"value\";s:1:\"0\";}}i:4;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"6\";s:5:\"value\";s:1:\"0\";}}i:5;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"7\";s:5:\"value\";s:1:\"0\";}}i:6;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"8\";s:5:\"value\";s:1:\"0\";}}i:7;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"9\";s:5:\"value\";s:1:\"0\";}}i:8;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"12\";s:5:\"value\";s:1:\"0\";}}i:9;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"13\";s:5:\"value\";s:1:\"0\";}}i:10;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"14\";s:5:\"value\";s:1:\"0\";}}i:11;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"15\";s:5:\"value\";s:1:\"0\";}}i:12;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"16\";s:5:\"value\";s:1:\"0\";}}i:13;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"17\";s:5:\"value\";s:1:\"0\";}}i:14;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"18\";s:5:\"value\";s:1:\"1\";}}i:15;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"19\";s:5:\"value\";s:1:\"1\";}}i:16;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"20\";s:5:\"value\";s:1:\"1\";}}i:17;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"21\";s:5:\"value\";s:1:\"1\";}}i:18;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"22\";s:5:\"value\";s:1:\"1\";}}}'),('ATASAN PENCIPTA','Atasan pencipta dokumen','ADMIN KONFIGURASI','2019-01-22 23:34:23',1,'a:19:{i:0;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"1\";s:5:\"value\";s:1:\"0\";}}i:1;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"2\";s:5:\"value\";s:1:\"0\";}}i:2;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"4\";s:5:\"value\";s:1:\"0\";}}i:3;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"5\";s:5:\"value\";s:1:\"1\";}}i:4;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"6\";s:5:\"value\";s:1:\"1\";}}i:5;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"7\";s:5:\"value\";s:1:\"1\";}}i:6;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"8\";s:5:\"value\";s:1:\"1\";}}i:7;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"9\";s:5:\"value\";s:1:\"1\";}}i:8;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"12\";s:5:\"value\";s:1:\"0\";}}i:9;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"13\";s:5:\"value\";s:1:\"0\";}}i:10;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"14\";s:5:\"value\";s:1:\"0\";}}i:11;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"15\";s:5:\"value\";s:1:\"0\";}}i:12;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"16\";s:5:\"value\";s:1:\"0\";}}i:13;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"17\";s:5:\"value\";s:1:\"0\";}}i:14;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"18\";s:5:\"value\";s:1:\"0\";}}i:15;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"19\";s:5:\"value\";s:1:\"0\";}}i:16;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"20\";s:5:\"value\";s:1:\"0\";}}i:17;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"21\";s:5:\"value\";s:1:\"0\";}}i:18;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"22\";s:5:\"value\";s:1:\"0\";}}}'),('PENCIPTA','Pencipta dokumen','ADMIN KONFIGURASI','2019-01-22 23:34:23',4,'a:20:{i:0;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"1\";s:5:\"value\";s:1:\"1\";}}i:1;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"2\";s:5:\"value\";s:1:\"1\";}}i:2;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"4\";s:5:\"value\";s:1:\"1\";}}i:3;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"5\";s:5:\"value\";s:1:\"1\";}}i:4;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"6\";s:5:\"value\";s:1:\"0\";}}i:5;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"7\";s:5:\"value\";s:1:\"1\";}}i:6;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"8\";s:5:\"value\";s:1:\"1\";}}i:7;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"9\";s:5:\"value\";s:1:\"1\";}}i:8;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"12\";s:5:\"value\";s:1:\"0\";}}i:9;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"13\";s:5:\"value\";s:1:\"0\";}}i:10;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"14\";s:5:\"value\";s:1:\"0\";}}i:11;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"15\";s:5:\"value\";s:1:\"0\";}}i:12;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"16\";s:5:\"value\";s:1:\"0\";}}i:13;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"17\";s:5:\"value\";s:1:\"0\";}}i:14;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"18\";s:5:\"value\";s:1:\"0\";}}i:15;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"19\";s:5:\"value\";s:1:\"0\";}}i:16;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"20\";s:5:\"value\";s:1:\"0\";}}i:17;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"21\";s:5:\"value\";s:1:\"0\";}}i:18;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"22\";s:5:\"value\";s:1:\"0\";}}i:19;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"23\";s:5:\"value\";s:1:\"1\";}}}'),('PENDISTRIBUSI','Distribusi dokumen','ADMIN KONFIGURASI','2019-01-22 23:34:23',2,'a:19:{i:0;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"1\";s:5:\"value\";s:1:\"0\";}}i:1;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"2\";s:5:\"value\";s:1:\"0\";}}i:2;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"4\";s:5:\"value\";s:1:\"1\";}}i:3;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"5\";s:5:\"value\";s:1:\"1\";}}i:4;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"6\";s:5:\"value\";s:1:\"1\";}}i:5;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"7\";s:5:\"value\";s:1:\"0\";}}i:6;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"8\";s:5:\"value\";s:1:\"0\";}}i:7;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"9\";s:5:\"value\";s:1:\"0\";}}i:8;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"12\";s:5:\"value\";s:1:\"0\";}}i:9;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"13\";s:5:\"value\";s:1:\"0\";}}i:10;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"14\";s:5:\"value\";s:1:\"0\";}}i:11;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"15\";s:5:\"value\";s:1:\"0\";}}i:12;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"16\";s:5:\"value\";s:1:\"0\";}}i:13;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"17\";s:5:\"value\";s:1:\"0\";}}i:14;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"18\";s:5:\"value\";s:1:\"0\";}}i:15;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"19\";s:5:\"value\";s:1:\"0\";}}i:16;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"20\";s:5:\"value\";s:1:\"0\";}}i:17;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"21\";s:5:\"value\";s:1:\"0\";}}i:18;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"22\";s:5:\"value\";s:1:\"0\";}}}'),('PENGGUNA','Pengguna dokumen','ADMIN KONFIGURASI','2019-01-22 23:34:23',4,'a:20:{i:0;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"1\";s:5:\"value\";s:1:\"1\";}}i:1;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"2\";s:5:\"value\";s:1:\"1\";}}i:2;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"4\";s:5:\"value\";s:1:\"0\";}}i:3;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"5\";s:5:\"value\";s:1:\"0\";}}i:4;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"6\";s:5:\"value\";s:1:\"0\";}}i:5;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"7\";s:5:\"value\";s:1:\"0\";}}i:6;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"8\";s:5:\"value\";s:1:\"0\";}}i:7;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:1:\"9\";s:5:\"value\";s:1:\"0\";}}i:8;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"12\";s:5:\"value\";s:1:\"0\";}}i:9;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"13\";s:5:\"value\";s:1:\"0\";}}i:10;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"14\";s:5:\"value\";s:1:\"0\";}}i:11;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"15\";s:5:\"value\";s:1:\"0\";}}i:12;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"16\";s:5:\"value\";s:1:\"0\";}}i:13;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"17\";s:5:\"value\";s:1:\"0\";}}i:14;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"18\";s:5:\"value\";s:1:\"0\";}}i:15;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"19\";s:5:\"value\";s:1:\"0\";}}i:16;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"20\";s:5:\"value\";s:1:\"0\";}}i:17;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"21\";s:5:\"value\";s:1:\"0\";}}i:18;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"22\";s:5:\"value\";s:1:\"0\";}}i:19;a:1:{s:4:\"menu\";a:2:{s:3:\"key\";s:2:\"23\";s:5:\"value\";s:1:\"0\";}}}');
/*!40000 ALTER TABLE `tb_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-30 19:26:31
