create database HairShop;
create user alkyne@'%' identified by 'alkyne123!@#';
grant all privileges on HairShop.* to alkyne@'%';
flush privileges;

use `HairShop`;
DROP TABLE IF EXISTS `designers`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designers` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `class` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designers`
--

LOCK TABLES `designers` WRITE;
/*!40000 ALTER TABLE `designers` DISABLE KEYS */;
INSERT INTO `designers` VALUES (1,'Ho','010-1234-1234','master','2019-01-01'),(2,'Mo','010-1234-5678','manager','2019-02-01'),(3,'Rii','010-1234-1111','staff','2019-03-01');
/*!40000 ALTER TABLE `designers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay`
--

DROP TABLE IF EXISTS `pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL,
  `purchase_method` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_no` int(11) NOT NULL,
  `pay_date` date NOT NULL,
  PRIMARY KEY (`no`),
  KEY `user_no` (`user_no`),
  CONSTRAINT `pay_ibfk_1` FOREIGN KEY (`user_no`) REFERENCES `users` (`no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay`
--

LOCK TABLES `pay` WRITE;
/*!40000 ALTER TABLE `pay` DISABLE KEYS */;
INSERT INTO `pay` VALUES (1,10000,'card',1,'2019-02-02'),(2,10000,'cash',1,'2019-03-02'),(3,10000,'point',1,'2019-04-02'),(4,30000,'card',2,'2019-02-05'),(5,50000,'card',3,'2019-06-05'),(6,10000,'card',1,'2019-11-15'),(7,10000,'cash',2,'2019-10-10'),(8,10000,'card',3,'2019-09-12'),(9,10000,'card',1,'2019-02-02'),(10,20000,'card',2,'2019-02-05'),(11,20000,'card',3,'2019-06-05'),(12,30000,'card',2,'2019-09-12');
/*!40000 ALTER TABLE `pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_name` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `left_num` int(11) DEFAULT NULL,
  `sold_num` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('conditioner',1,1,20000),('cream',6,1,30000),('shampoo',10,2,10000);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_history`
--

DROP TABLE IF EXISTS `purchase_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_history` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_num` int(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `user_no` int(11) DEFAULT NULL,
  `product_name` char(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`no`),
  KEY `user_no` (`user_no`),
  KEY `product_name` (`product_name`),
  CONSTRAINT `purchase_history_ibfk_1` FOREIGN KEY (`user_no`) REFERENCES `users` (`no`) ON DELETE CASCADE,
  CONSTRAINT `purchase_history_ibfk_2` FOREIGN KEY (`product_name`) REFERENCES `products` (`product_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_history`
--

LOCK TABLES `purchase_history` WRITE;
/*!40000 ALTER TABLE `purchase_history` DISABLE KEYS */;
INSERT INTO `purchase_history` VALUES (1,1,'2019-02-02',1,'cream'),(2,1,'2019-02-05',2,'shampoo'),(3,1,'2019-06-05',3,'shampoo'),(4,1,'2019-09-12',2,'conditioner');
/*!40000 ALTER TABLE `purchase_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary` (
  `designer_no` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`designer_no`),
  CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`designer_no`) REFERENCES `designers` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,3000000),(2,2000000),(3,1000000);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment_history`
--

DROP TABLE IF EXISTS `treatment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treatment_history` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `treatment_type` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `treatment_date` date NOT NULL,
  `price` int(11) NOT NULL,
  `user_no` int(11) DEFAULT NULL,
  `designer_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `user_no` (`user_no`),
  KEY `designer_no` (`designer_no`),
  CONSTRAINT `treatment_history_ibfk_1` FOREIGN KEY (`user_no`) REFERENCES `users` (`no`) ON DELETE CASCADE,
  CONSTRAINT `treatment_history_ibfk_2` FOREIGN KEY (`designer_no`) REFERENCES `designers` (`no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment_history`
--

LOCK TABLES `treatment_history` WRITE;
/*!40000 ALTER TABLE `treatment_history` DISABLE KEYS */;
INSERT INTO `treatment_history` VALUES (1,'cut','2019-02-02',10000,1,1),(2,'cut','2019-03-02',10000,1,1),(3,'cut','2019-04-02',10000,1,1),(4,'magic','2019-02-05',30000,2,2),(5,'perm','2019-06-05',50000,3,3),(6,'cut','2019-11-15',10000,1,1),(7,'cut','2019-10-10',10000,2,2),(8,'cut','2019-09-12',10000,3,3);
/*!40000 ALTER TABLE `treatment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `register_date` date NOT NULL,
  `recent_visit` date NOT NULL,
  `point` int(11) DEFAULT NULL,
  `designer_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `designer_no` (`designer_no`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`designer_no`) REFERENCES `designers` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Kim','010-1111-2222','2019-01-30','2019-11-15',10000,1),(2,'Choi','010-2222-5552','2019-02-09','2019-10-10',20000,2),(3,'Park','010-3333-4441','2019-03-30','2019-09-12',30000,3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
