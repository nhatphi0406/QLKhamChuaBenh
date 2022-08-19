-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: clinic
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cus_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `status` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_BOOK_CUS_idx` (`cus_id`),
  KEY `FK_BOOK_STAFF_idx` (`staff_id`),
  CONSTRAINT `FK_BOOK_CUS` FOREIGN KEY (`cus_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_BOOK_STAFF` FOREIGN KEY (`staff_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Thuốc bổ và Vitamin',NULL),(2,'Ung thư',NULL),(3,'Ho',NULL),(4,'Gút',NULL),(5,'Dị ứng',NULL),(6,'Miếng dán các loại',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `man_pro`
--

DROP TABLE IF EXISTS `man_pro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `man_pro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `manufacturer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_manu_idx` (`manufacturer_id`),
  KEY `FK_PRO_idx` (`product_id`),
  CONSTRAINT `FK_MAN` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PRO` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `man_pro`
--

LOCK TABLES `man_pro` WRITE;
/*!40000 ALTER TABLE `man_pro` DISABLE KEYS */;
/*!40000 ALTER TABLE `man_pro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL,
  `country` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cus_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `result` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `FK_PRES_CUS_idx` (`cus_id`),
  KEY `FK_PRES_STAFF_idx` (`staff_id`),
  KEY `FK_PRES_BOOK_idx` (`book_id`),
  CONSTRAINT `FK_PRES_BOOK` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PRES_CUS` FOREIGN KEY (`cus_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_PRES_STAFF` FOREIGN KEY (`staff_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription_detail`
--

DROP TABLE IF EXISTS `prescription_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prescription_id` int NOT NULL,
  `product_id` int NOT NULL,
  `unit_price` decimal(10,0) DEFAULT '0',
  `num` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_PRESCRIPTIONDETAIL_PRESCRIPTION_idx` (`prescription_id`),
  KEY `FK_PRESCRIPTIONDETAIL_PRODUCT_idx` (`product_id`),
  CONSTRAINT `FK_PRESCRIPTIONDETAIL_PRESCRIPTION` FOREIGN KEY (`prescription_id`) REFERENCES `prescription` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PRESCRIPTIONDETAIL_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription_detail`
--

LOCK TABLES `prescription_detail` WRITE;
/*!40000 ALTER TABLE `prescription_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `price` decimal(10,0) DEFAULT '0',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PRODUCT_CATEGORY_idx` (`category_id`),
  CONSTRAINT `FK_PRODUCT_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Vidipha Vitamin C 250mg phòng và trị thiếu vitamin C',NULL,250000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146014/ClinicManagement/Product/ThuocBoVaVitamin/vitamin-c-250mg_opzjna.jpg',NULL,_binary '',1),(2,'Cốm Bổ Zinc - Kid Inmed bổ sung kẽm, trị tiêu chảy',NULL,85000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146017/ClinicManagement/Product/ThuocBoVaVitamin/zinc-kid-inmed-70mg_t9u27j.jpg',NULL,_binary '',1),(3,'Siro Pharmaton Kiddi bổ sung vitamin và khoáng chất cho bé',NULL,115000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146015/ClinicManagement/Product/ThuocBoVaVitamin/pharmaton-kiddi-100ml_rqz8ks.jpg',NULL,_binary '',1),(4,'Dung dịch uống Vitarals bổ sung vitamin, trị còi xương',NULL,12000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146015/ClinicManagement/Product/ThuocBoVaVitamin/vitarals-20m_mqxfpg.jpg',NULL,_binary '',1),(5,'Dung dịch uống Aquadetrim Vitamin D3 15000IU/ml trị còi xương lọ 10ml',NULL,37000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146014/ClinicManagement/Product/ThuocBoVaVitamin/aquadetrim-vitamin-d3-10ml_taj52t.jpg',NULL,_binary '',1),(8,'Nolvadex 10mg trị ung thư vú',NULL,500000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146006/ClinicManagement/Product/UngThu/nolvadex-tab-10mg_a3xqpv.jpg',NULL,_binary '',2),(9,'Dung dịch tiêm Zoladex 3.6mg trị ung thư vú, tuyến tiền liệt',NULL,600000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146008/ClinicManagement/Product/UngThu/zoladex-inj-36mg_pavabv.jpg',NULL,_binary '',2),(10,'Bentarcin 80mg kích thích miễn dịch, hỗ trợ trị nhiễm khuẩn',NULL,700000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146006/ClinicManagement/Product/UngThu/bentarcin_celmmy.jpg',NULL,_binary '',2),(11,'Myfortics 180mg dự phòng thải ghép',NULL,800000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146006/ClinicManagement/Product/UngThu/myfortic-180mg_tzcein.jpg',NULL,_binary '',2),(12,'Metrex Tab 2.5mg trị khối u, vảy nến, viêm khớp dạng thấp',NULL,900000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146006/ClinicManagement/Product/UngThu/metrex-25mg_hedqzz.jpg',NULL,_binary '',2),(13,'Viên ngậm Tyrotab sát khuẩn, trị viêm họng',NULL,6000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146012/ClinicManagement/Product/Ho/vien-ngam-sat-trung-hong-tyrotab_sjviph.jpg',NULL,_binary '',3),(14,'Siro Prospan Forte trị ho, viêm phế quản',NULL,96600,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146012/ClinicManagement/Product/Ho/prospan-liquid_q8hdw8.jpg',NULL,_binary '',3),(15,'Tragutan sát khuẩn hô hấp, dịu cơn ho',NULL,70000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146012/ClinicManagement/Product/Ho/tragutan_t7xukq.jpg',NULL,_binary '',3),(16,'Codeforte trị ho khan, ho do kích ứng',NULL,40000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146010/ClinicManagement/Product/Ho/codeforte_zxy1pd.jpg',NULL,_binary '',3),(17,'Viên ngậm Strepsils Maxpro mật ong & chanh giảm đau họng',NULL,40000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146011/ClinicManagement/Product/Ho/keo-strepsils-maxpro_jbnvy2.jpg',NULL,_binary '',3),(18,'Sadapron 100mg trị gút, tăng acid uric',NULL,510000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146010/ClinicManagement/Product/Gut/sadapron-100mg_dbrmrn.jpg',NULL,_binary '',4),(19,'Febuxotid VK 40 trị gout, tăng acid uric huyết',NULL,610000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146016/ClinicManagement/Product/Gut/febuxotid-vk-40mg_jsglry.jpg',NULL,_binary '',4),(20,'Dochicin 1mg phòng và điều trị gút cấp',NULL,575000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146010/ClinicManagement/Product/Gut/dochicin-1mg_ysj2sp.jpg',NULL,_binary '',4),(21,'Colchicina Seid 1mg phòng và trị gout',NULL,637000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146009/ClinicManagement/Product/Gut/colchicina-seid-1mg_janlfn.jpg',NULL,_binary '',4),(22,'Cocilone 1mg phòng và trị gout',NULL,549000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146008/ClinicManagement/Product/Gut/cocilone-1mg_cojyjg.jpg',NULL,_binary '',4),(23,'Deslornin 5mg trị viêm mũi dị ứng, mày đay',NULL,30000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146010/ClinicManagement/Product/DiUng/deslornine-5mg_jxjpwb.jpg',NULL,_binary '',5),(24,'Dofexo 60mg trị viêm mũi dị ứng, mày đay',NULL,45000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146009/ClinicManagement/Product/DiUng/dofexo-60mg_c2gjbx.jpg',NULL,_binary '',5),(25,'Pyme Cezitec 5mg trị viêm mũi dị ứng, mày đay',NULL,34000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146008/ClinicManagement/Product/DiUng/thuoc-chong-di-ung-pyme-cezitec-5mg_rkqq9v.jpg',NULL,_binary '',5),(26,'Gimfastnew 120mg trị viêm mũi dị ứng, mày đay',NULL,40000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146008/ClinicManagement/Product/DiUng/gimfastnew-120mg_yrdpfs.jpg',NULL,_binary '',5),(27,'Allerphast 60mg trị viêm mũi dị ứng, mày đay',NULL,17000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146005/ClinicManagement/Product/DiUng/allerphast-60mg_k9vtst.jpg',NULL,_binary '',5),(28,'Cao dán Ecosip Cool giảm đau cơ xương khớp',NULL,90000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146014/ClinicManagement/Product/MiengDanCacLoai/ecosip-cool_s3xq3n.jpg',NULL,_binary '',6),(29,'Cao dán Kenon-L giảm đau, kháng viêm cơ xương',NULL,1560000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146014/ClinicManagement/Product/MiengDanCacLoai/kenon_msznb2.jpg',NULL,_binary '',6),(30,'Cao dán Tiger Balm Plaster giảm đau cơ, bong gân',NULL,576000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146013/ClinicManagement/Product/MiengDanCacLoai/cao-dan-tiger-balm-plaster_ckjym0.jpg',NULL,_binary '',6),(31,'Cao dán Yaguchi giảm đau, kháng viêm cơ xương',NULL,190000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146012/ClinicManagement/Product/MiengDanCacLoai/cao-dan-yaguchi_wc8igl.jpg',NULL,_binary '',6),(32,'Cao dán Salonpas Pain Relief Patch giảm đau, kháng viêm','Dán hơi bị phê luôn đó ba',25000,'https://res.cloudinary.com/dttcckcgd/image/upload/v1660146012/ClinicManagement/Product/MiengDanCacLoai/cao-dan-giam-dau-salonpas_kihssq.jpg',NULL,_binary '',6);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `working_day` datetime NOT NULL,
  `staff_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_SCHEDULE_USER_idx` (`staff_id`),
  CONSTRAINT `FK_SCHEDULE_USER` FOREIGN KEY (`staff_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL,
  `active` bit(1) DEFAULT b'1',
  `user_role` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL,
  `avatar` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Tô Hoàng Nhất','Phi','nhatphi@gmail.com','0788780192','nhatphi','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO',_binary '','ROLE_ADMIN','https://res.cloudinary.com/dttcckcgd/image/upload/v1660726938/ClinicManagement/User/z2416359872200_cebd48da49ebb0c272489b1dbb966d6e_veecyi.jpg'),(2,'Nguyễn Lê Ngân','Quỳnh','nguyenquynh@gmail.com','0956812539','nguyenquynh','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO',_binary '','ROLE_USER','https://res.cloudinary.com/dttcckcgd/image/upload/v1660727478/ClinicManagement/User/2022_04_11_21_03_IMG_4794_rjc775.jpg'),(10,'Bùi Đoàn','Kết','doanket@gmail.com','1234567895','doanket','$2a$10$D.spMVV/oINa5H5GsTy0COB.1O5VT3qgMMVtm89XCBSyhu6VgtXjm',NULL,'ROLE_DOCTOR',NULL),(11,'Nguyễn Thị Hoanh','Hoanh','hoanhhoanh@gmail.com','0265498736','hoanhhoanh','$2a$10$jShDJVkpq2gDXVOMM5ks6eXE1twxtsyYMQCyyKuAyXVRiIuve17Oq',NULL,'ROLE_USER','https://res.cloudinary.com/dttcckcgd/image/upload/v1660727911/ClinicManagement/User/275570216_688547012268157_7421302736446004128_n_1_izmzzl.jpg'),(12,'To Hoang','Phuc','hoangphuc@gmail.com','0165498736','hoangphuc','$2a$10$l6IakDUQu7UwGA7xU5t6led6PSKkCWjLTpRChcPTcNXifSYJxjyWi',NULL,'ROLE_USER',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-19 15:12:40
