-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: phan_mem_ql_tour
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
-- Table structure for table `tblchitiettour`
--

DROP TABLE IF EXISTS `tblchitiettour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblchitiettour` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `tblVeId` bigint NOT NULL,
  `tblTourId` bigint NOT NULL,
  `ngayxuatphat` date DEFAULT NULL,
  `dongia` float NOT NULL,
  `soluongdadat` int NOT NULL,
  `soluongtoida` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKtblChitiet155212` (`tblTourId`),
  CONSTRAINT `FKtblChitiet155212` FOREIGN KEY (`tblTourId`) REFERENCES `tbltour` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblchitiettour`
--

LOCK TABLES `tblchitiettour` WRITE;
/*!40000 ALTER TABLE `tblchitiettour` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblchitiettour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldiadiem`
--

DROP TABLE IF EXISTS `tbldiadiem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldiadiem` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) DEFAULT NULL,
  `mota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldiadiem`
--

LOCK TABLES `tbldiadiem` WRITE;
/*!40000 ALTER TABLE `tbldiadiem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldiadiem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldiadiemlichtrinh`
--

DROP TABLE IF EXISTS `tbldiadiemlichtrinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldiadiemlichtrinh` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `tblLichtrinhId` bigint NOT NULL,
  `tblDiadiemId` bigint NOT NULL,
  `thoigianden` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKtblDiadiem84883` (`tblDiadiemId`),
  KEY `FKtblDiadiem721586` (`tblLichtrinhId`),
  CONSTRAINT `FKtblDiadiem721586` FOREIGN KEY (`tblLichtrinhId`) REFERENCES `tbllichtrinh` (`Id`),
  CONSTRAINT `FKtblDiadiem84883` FOREIGN KEY (`tblDiadiemId`) REFERENCES `tbldiadiem` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldiadiemlichtrinh`
--

LOCK TABLES `tbldiadiemlichtrinh` WRITE;
/*!40000 ALTER TABLE `tbldiadiemlichtrinh` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldiadiemlichtrinh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldichvu`
--

DROP TABLE IF EXISTS `tbldichvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldichvu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) DEFAULT NULL,
  `mota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldichvu`
--

LOCK TABLES `tbldichvu` WRITE;
/*!40000 ALTER TABLE `tbldichvu` DISABLE KEYS */;
INSERT INTO `tbldichvu` VALUES (1,'Xe bus','xe bus van chuyen'),(2,'Buffet',NULL),(3,'Tàu Lượn',NULL),(4,'Nhảy dù',NULL),(5,'CÔng viên',NULL),(6,'Cáp treo',NULL),(7,'Tàu',NULL),(8,'Bè',NULL),(9,'Khu giải trí',NULL),(10,'Rạp chiếu phim',NULL);
/*!40000 ALTER TABLE `tbldichvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldichvudoitac`
--

DROP TABLE IF EXISTS `tbldichvudoitac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldichvudoitac` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `tblDoitacId` bigint NOT NULL,
  `tblDichvuid` bigint NOT NULL,
  `dongia` float NOT NULL,
  `ngaytao` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKtblDichvud302651` (`tblDichvuid`),
  KEY `FKtblDichvud303643` (`tblDoitacId`),
  CONSTRAINT `FKtblDichvud302651` FOREIGN KEY (`tblDichvuid`) REFERENCES `tbldichvu` (`id`),
  CONSTRAINT `FKtblDichvud303643` FOREIGN KEY (`tblDoitacId`) REFERENCES `tbldoitac` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldichvudoitac`
--

LOCK TABLES `tbldichvudoitac` WRITE;
/*!40000 ALTER TABLE `tbldichvudoitac` DISABLE KEYS */;
INSERT INTO `tbldichvudoitac` VALUES (1,1,1,10000,NULL),(2,1,2,10000,NULL),(3,1,3,10000,NULL),(4,1,4,10000,NULL),(5,2,1,10000,NULL),(6,2,2,10000,NULL),(7,3,1,10000,NULL),(8,3,5,10000,NULL),(9,3,6,10000,NULL),(10,4,1,10000,NULL),(11,4,3,10000,NULL),(12,4,7,10000,NULL),(13,5,5,10000,NULL),(14,6,6,10000,NULL),(15,6,7,10000,NULL),(16,6,8,10000,NULL),(17,6,9,10000,NULL),(18,7,10,10000,NULL);
/*!40000 ALTER TABLE `tbldichvudoitac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldichvusudung`
--

DROP TABLE IF EXISTS `tbldichvusudung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldichvusudung` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `tblDichVuDoiTacId` bigint NOT NULL,
  `tblLichTrinhId` bigint NOT NULL,
  `dongia` float NOT NULL,
  `soluong` int NOT NULL,
  `thanhtien` float NOT NULL,
  `ngaybatdau` date DEFAULT NULL,
  `tblHoadondvthangId` bigint DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKtblDichvus462517` (`tblLichTrinhId`),
  KEY `FKtblDichvus888515` (`tblDichVuDoiTacId`),
  KEY `tblHoadondvthangId` (`tblHoadondvthangId`),
  CONSTRAINT `FKtblDichvus462517` FOREIGN KEY (`tblLichTrinhId`) REFERENCES `tbllichtrinh` (`Id`),
  CONSTRAINT `FKtblDichvus888515` FOREIGN KEY (`tblDichVuDoiTacId`) REFERENCES `tbldichvudoitac` (`Id`),
  CONSTRAINT `tbldichvusudung_ibfk_1` FOREIGN KEY (`tblHoadondvthangId`) REFERENCES `tblhoadondvthang` (`Id`),
  CONSTRAINT `tbldichvusudung_ibfk_2` FOREIGN KEY (`tblHoadondvthangId`) REFERENCES `tblhoadondvthang` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldichvusudung`
--

LOCK TABLES `tbldichvusudung` WRITE;
/*!40000 ALTER TABLE `tbldichvusudung` DISABLE KEYS */;
INSERT INTO `tbldichvusudung` VALUES (1,1,1,10000,20,200000,'2021-11-27',1),(2,2,1,10000,20,200000,'2021-11-28',1),(3,3,1,10000,20,200000,'2021-11-29',1),(4,4,1,10000,20,200000,'2021-11-30',1),(5,5,1,10000,20,200000,'2021-11-29',2),(6,6,1,10000,20,200000,'2021-11-25',2),(7,7,1,10000,20,200000,'2021-11-24',3),(8,8,1,10000,20,200000,'2021-11-23',3),(9,9,1,10000,20,200000,'2021-11-22',3),(10,10,1,10000,20,200000,'2021-11-21',4),(11,11,1,10000,20,200000,'2021-11-20',4),(12,12,1,10000,20,200000,'2021-11-19',4),(13,13,1,10000,20,200000,'2021-11-18',5),(14,14,1,10000,20,200000,'2021-11-17',6),(15,15,1,10000,20,200000,'2021-11-16',6),(16,16,1,10000,20,200000,'2021-11-15',6),(17,17,1,10000,20,200000,'2021-11-14',6),(18,18,1,10000,20,200000,'2021-11-13',7),(19,1,1,10000,20,200000,'2021-11-12',1),(20,2,1,10000,20,200000,'2021-11-11',1),(21,3,1,10000,20,200000,'2021-11-10',1),(22,4,1,10000,20,200000,'2021-11-09',1),(23,5,1,10000,20,200000,'2021-11-08',2),(24,6,1,10000,20,200000,'2021-11-07',2),(25,7,1,10000,20,200000,'2021-11-06',3),(26,8,1,10000,20,200000,'2021-11-05',3),(27,9,1,10000,20,200000,'2021-11-04',3),(28,10,1,10000,20,200000,'2021-11-03',4),(29,11,1,10000,20,200000,'2021-11-02',4),(30,12,1,10000,20,200000,'2021-11-01',4),(31,13,1,10000,20,200000,'2021-10-01',5),(32,14,1,10000,20,200000,'2021-10-02',6),(33,15,1,10000,20,200000,'2021-10-03',6),(34,16,1,10000,20,200000,'2021-10-04',6),(35,17,1,10000,20,200000,'2021-10-05',6),(36,18,1,10000,20,200000,'2021-11-27',7),(37,1,1,10000,20,200000,'2021-11-28',1),(38,2,1,10000,20,200000,'2021-11-29',1),(39,3,1,10000,20,200000,'2021-11-30',1),(40,4,1,10000,20,200000,'2021-11-26',1),(41,5,1,10000,20,200000,'2021-11-25',2),(42,6,1,10000,20,200000,'2021-11-24',2),(43,7,1,10000,20,200000,'2021-11-23',3),(44,8,1,10000,20,200000,'2021-11-22',3),(45,9,1,10000,20,200000,'2021-11-21',3);
/*!40000 ALTER TABLE `tbldichvusudung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldoitac`
--

DROP TABLE IF EXISTS `tbldoitac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldoitac` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sodienthoai` varchar(255) DEFAULT NULL,
  `mota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldoitac`
--

LOCK TABLES `tbldoitac` WRITE;
/*!40000 ALTER TABLE `tbldoitac` DISABLE KEYS */;
INSERT INTO `tbldoitac` VALUES (1,'HaNoiService','hanoiservice@gmail.com','0333444555','ha noi service'),(2,'Hạ Long Servie','hlservice@gmail.com','0111222333','halongsv'),(3,'Ninh Bình DV','hlservice@gmail.com','0111222333','halongsv'),(4,'ABC T','hlservice@gmail.com','0111222333','halongsv'),(5,'Thiên ĐƯờng Bảo Sơn','hlservice@gmail.com','0111222333','halongsv'),(6,'Timecity','hlservice@gmail.com','0111222333','halongsv'),(7,'RoyalCity','hlservice@gmail.com','0111222333','halongsv');
/*!40000 ALTER TABLE `tbldoitac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhoadondvthang`
--

DROP TABLE IF EXISTS `tblhoadondvthang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblhoadondvthang` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `ngaybatdau` date DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  `thanhtien` float NOT NULL,
  `dathanhtoan` bit(1) NOT NULL,
  `thoigian` date DEFAULT NULL,
  `tblDoitacId` bigint NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKtblHoadond259630` (`tblDoitacId`),
  CONSTRAINT `FKtblHoadond259630` FOREIGN KEY (`tblDoitacId`) REFERENCES `tbldoitac` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhoadondvthang`
--

LOCK TABLES `tblhoadondvthang` WRITE;
/*!40000 ALTER TABLE `tblhoadondvthang` DISABLE KEYS */;
INSERT INTO `tblhoadondvthang` VALUES (1,'2021-11-27',11,111111,_binary '','2021-11-27',1),(2,'2021-11-27',11,111111,_binary '','2021-11-27',2),(3,'2021-11-27',11,111111,_binary '','2021-11-27',3),(4,'2021-11-27',11,111111,_binary '','2021-11-27',4),(5,'2021-11-27',11,111111,_binary '','2021-11-27',5),(6,'2021-11-27',11,111111,_binary '','2021-11-27',6),(7,'2021-11-27',11,111111,_binary '','2021-11-27',7);
/*!40000 ALTER TABLE `tblhoadondvthang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhoadonphat`
--

DROP TABLE IF EXISTS `tblhoadonphat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblhoadonphat` (
  `tienphat` float NOT NULL,
  `ngaytrave` date DEFAULT NULL,
  `phantramphat` int NOT NULL,
  `tblVeId` bigint NOT NULL,
  PRIMARY KEY (`tblVeId`),
  CONSTRAINT `FKtblHoadonp179521` FOREIGN KEY (`tblVeId`) REFERENCES `tblve` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhoadonphat`
--

LOCK TABLES `tblhoadonphat` WRITE;
/*!40000 ALTER TABLE `tblhoadonphat` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhoadonphat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblkhachhang`
--

DROP TABLE IF EXISTS `tblkhachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblkhachhang` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) NOT NULL,
  `soID` varchar(255) NOT NULL,
  `loaitheID` varchar(255) NOT NULL,
  `sodienthoai` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `diachi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblkhachhang`
--

LOCK TABLES `tblkhachhang` WRITE;
/*!40000 ALTER TABLE `tblkhachhang` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblkhachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllichtrinh`
--

DROP TABLE IF EXISTS `tbllichtrinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbllichtrinh` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `tblTourId` bigint NOT NULL,
  `mota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKtblLichtri221217` (`tblTourId`),
  CONSTRAINT `FKtblLichtri221217` FOREIGN KEY (`tblTourId`) REFERENCES `tbltour` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllichtrinh`
--

LOCK TABLES `tbllichtrinh` WRITE;
/*!40000 ALTER TABLE `tbllichtrinh` DISABLE KEYS */;
INSERT INTO `tbllichtrinh` VALUES (1,1,'lich trinh 1');
/*!40000 ALTER TABLE `tbllichtrinh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnhanvien`
--

DROP TABLE IF EXISTS `tblnhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblnhanvien` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `soID` varchar(255) NOT NULL,
  `hoten` varchar(255) NOT NULL,
  `chucvu` varchar(255) NOT NULL,
  `ngaybatdau` date DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ngaysinh` date DEFAULT NULL,
  `gioitinh` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sodienthoai` varchar(255) DEFAULT NULL,
  `diachi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnhanvien`
--

LOCK TABLES `tblnhanvien` WRITE;
/*!40000 ALTER TABLE `tblnhanvien` DISABLE KEYS */;
INSERT INTO `tblnhanvien` VALUES (1,'ID123','Vũ Thúy Hằng','nhanvienketoan','2020-11-11','username1','password','1999-11-11','nữ','vth@gmail.com','0911111111','ninh bình'),(2,'ID123','Bùi Thế Vương','nhanvienquanly','2020-11-11','username2','password','1999-11-11','nam','btv@gmail.com','0911111111','hạ long'),(3,'ID123','SaleStaff','nhanvienbanve','2020-11-11','username3','password','1999-11-11','nữ','vth@gmail.com','0911111111','ninh bình');
/*!40000 ALTER TABLE `tblnhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnhanvienbanve`
--

DROP TABLE IF EXISTS `tblnhanvienbanve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblnhanvienbanve` (
  `tongsoveban` bigint NOT NULL,
  `diemdanhgia` int DEFAULT NULL,
  `tblNhanvienId` bigint NOT NULL,
  PRIMARY KEY (`tblNhanvienId`),
  CONSTRAINT `FKtblNhanvie480934` FOREIGN KEY (`tblNhanvienId`) REFERENCES `tblnhanvien` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnhanvienbanve`
--

LOCK TABLES `tblnhanvienbanve` WRITE;
/*!40000 ALTER TABLE `tblnhanvienbanve` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblnhanvienbanve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnhanvienketoan`
--

DROP TABLE IF EXISTS `tblnhanvienketoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblnhanvienketoan` (
  `sogiaodich` bigint DEFAULT NULL,
  `tblNhanvienId` bigint NOT NULL,
  PRIMARY KEY (`tblNhanvienId`),
  CONSTRAINT `FKtblNhanvie851535` FOREIGN KEY (`tblNhanvienId`) REFERENCES `tblnhanvien` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnhanvienketoan`
--

LOCK TABLES `tblnhanvienketoan` WRITE;
/*!40000 ALTER TABLE `tblnhanvienketoan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblnhanvienketoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnhanvienquanly`
--

DROP TABLE IF EXISTS `tblnhanvienquanly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblnhanvienquanly` (
  `gioithieu` varchar(255) DEFAULT NULL,
  `tblNhanvienId` bigint NOT NULL,
  PRIMARY KEY (`tblNhanvienId`),
  CONSTRAINT `FKtblNhanvie836325` FOREIGN KEY (`tblNhanvienId`) REFERENCES `tblnhanvien` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnhanvienquanly`
--

LOCK TABLES `tblnhanvienquanly` WRITE;
/*!40000 ALTER TABLE `tblnhanvienquanly` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblnhanvienquanly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltour`
--

DROP TABLE IF EXISTS `tbltour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbltour` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) DEFAULT NULL,
  `noixuatphat` varchar(255) DEFAULT NULL,
  `noiden` varchar(255) DEFAULT NULL,
  `mota` varchar(255) DEFAULT NULL,
  `sokhachtoida` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltour`
--

LOCK TABLES `tbltour` WRITE;
/*!40000 ALTER TABLE `tbltour` DISABLE KEYS */;
INSERT INTO `tbltour` VALUES (1,'tour 1','ha noi','ninh binh','mota',100);
/*!40000 ALTER TABLE `tbltour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblve`
--

DROP TABLE IF EXISTS `tblve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblve` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `tblNhanvienbanveid` bigint NOT NULL,
  `tblKhachhangid` bigint NOT NULL,
  `giave` float NOT NULL,
  `soluongkhach` int DEFAULT NULL,
  `tongsotien` float NOT NULL,
  `thoigianxuatve` date DEFAULT NULL,
  `tblChitiettourId` bigint NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKtblVe27346` (`tblKhachhangid`),
  KEY `FKtblVe6505` (`tblNhanvienbanveid`),
  KEY `FKtblVe117084` (`tblChitiettourId`),
  CONSTRAINT `FKtblVe117084` FOREIGN KEY (`tblChitiettourId`) REFERENCES `tblchitiettour` (`Id`),
  CONSTRAINT `FKtblVe27346` FOREIGN KEY (`tblKhachhangid`) REFERENCES `tblkhachhang` (`Id`),
  CONSTRAINT `FKtblVe6505` FOREIGN KEY (`tblNhanvienbanveid`) REFERENCES `tblnhanvienbanve` (`tblNhanvienId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblve`
--

LOCK TABLES `tblve` WRITE;
/*!40000 ALTER TABLE `tblve` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblve` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-15  9:51:00
