
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accessories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `requestable` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `min_amt` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accessories_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `accessories` WRITE;
/*!40000 ALTER TABLE `accessories` DISABLE KEYS */;
/*!40000 ALTER TABLE `accessories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `accessories_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accessories_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `accessories_users` WRITE;
/*!40000 ALTER TABLE `accessories_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `accessories_users` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `action_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `expected_checkin` date DEFAULT NULL,
  `accepted_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `thread_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `accept_signature` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_meta` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `action_logs_thread_id_index` (`thread_id`),
  KEY `action_logs_created_at_index` (`created_at`),
  KEY `action_logs_item_type_item_id_action_type_index` (`item_type`,`item_id`,`action_type`),
  KEY `action_logs_target_type_target_id_action_type_index` (`target_type`,`target_id`,`action_type`),
  KEY `action_logs_target_type_target_id_index` (`target_type`,`target_id`),
  KEY `action_logs_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `action_logs` WRITE;
/*!40000 ALTER TABLE `action_logs` DISABLE KEYS */;
INSERT INTO `action_logs` VALUES (1,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',1,NULL,NULL,'2021-08-19 05:12:27','2021-08-19 05:12:27',NULL,NULL,1,NULL,NULL,NULL),(2,1,'checkout',3,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',1,NULL,NULL,'2021-08-19 05:12:27','2021-08-19 05:12:27',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:12:27'),(3,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',2,NULL,NULL,'2021-08-19 05:13:56','2021-08-19 05:13:56',NULL,NULL,1,NULL,NULL,NULL),(4,1,'checkout',4,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',2,NULL,NULL,'2021-08-19 05:13:56','2021-08-19 05:13:56',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:13:56'),(5,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',3,NULL,NULL,'2021-08-19 05:15:21','2021-08-19 05:15:21',NULL,NULL,1,NULL,NULL,NULL),(6,1,'checkout',5,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',3,NULL,NULL,'2021-08-19 05:15:21','2021-08-19 05:15:21',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:15:21'),(7,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',4,NULL,NULL,'2021-08-19 05:16:33','2021-08-19 05:16:33',NULL,NULL,1,NULL,NULL,NULL),(8,1,'checkout',6,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',4,NULL,NULL,'2021-08-19 05:16:33','2021-08-19 05:16:33',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:16:33'),(9,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',4,NULL,NULL,'2021-08-19 05:16:46','2021-08-19 05:16:46',NULL,NULL,1,NULL,'{\"name\":{\"old\":null,\"new\":\"Desktop\"}}',NULL),(10,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',5,NULL,NULL,'2021-08-19 05:19:01','2021-08-19 05:19:01',NULL,NULL,1,NULL,NULL,NULL),(11,1,'checkout',7,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',5,NULL,NULL,'2021-08-19 05:19:01','2021-08-19 05:19:01',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:19:01'),(12,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',6,NULL,NULL,'2021-08-19 05:20:38','2021-08-19 05:20:38',NULL,NULL,1,NULL,NULL,NULL),(13,1,'checkout',8,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',6,NULL,NULL,'2021-08-19 05:20:38','2021-08-19 05:20:38',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:20:38'),(14,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',7,NULL,NULL,'2021-08-19 05:23:15','2021-08-19 05:23:15',NULL,NULL,1,NULL,NULL,NULL),(15,1,'checkout',9,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',7,NULL,NULL,'2021-08-19 05:23:15','2021-08-19 05:23:15',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:23:15'),(16,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',7,NULL,NULL,'2021-08-19 05:23:38','2021-08-19 05:23:38',NULL,NULL,1,NULL,'{\"name\":{\"old\":null,\"new\":\"Desktop\"}}',NULL),(17,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',8,NULL,NULL,'2021-08-19 05:24:24','2021-08-19 05:24:24',NULL,NULL,NULL,NULL,NULL,NULL),(18,1,'checkout',10,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',8,NULL,NULL,'2021-08-19 05:24:25','2021-08-19 05:24:25',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:24:24'),(19,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',9,NULL,NULL,'2021-08-19 05:25:33','2021-08-19 05:25:33',NULL,NULL,1,NULL,NULL,NULL),(20,1,'checkout',11,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',9,NULL,NULL,'2021-08-19 05:25:33','2021-08-19 05:25:33',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:25:33'),(21,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',9,NULL,NULL,'2021-08-19 05:25:47','2021-08-19 05:25:47',NULL,NULL,1,NULL,'{\"name\":{\"old\":null,\"new\":\"Desktop\"}}',NULL),(22,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',9,NULL,NULL,'2021-08-19 05:25:58','2021-08-19 05:25:58',NULL,NULL,1,NULL,'[]',NULL),(23,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',10,NULL,NULL,'2021-08-19 05:27:00','2021-08-19 05:27:00',NULL,NULL,1,NULL,NULL,NULL),(24,1,'checkout',12,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',10,NULL,NULL,'2021-08-19 05:27:00','2021-08-19 05:27:00',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:27:00'),(25,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',10,NULL,NULL,'2021-08-19 05:27:31','2021-08-19 05:27:31',NULL,NULL,1,NULL,'{\"name\":{\"old\":null,\"new\":\"Desktop\"},\"_snipeit_hdd_4\":{\"old\":\"500GB\",\"new\":null}}',NULL),(26,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',11,NULL,NULL,'2021-08-19 05:28:17','2021-08-19 05:28:17',NULL,NULL,1,NULL,NULL,NULL),(27,1,'checkout',13,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',11,NULL,NULL,'2021-08-19 05:28:17','2021-08-19 05:28:17',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:28:17'),(28,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',11,NULL,NULL,'2021-08-19 05:28:29','2021-08-19 05:28:29',NULL,NULL,1,NULL,'{\"name\":{\"old\":null,\"new\":\"Desktop\"}}',NULL),(29,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',12,NULL,NULL,'2021-08-19 05:30:04','2021-08-19 05:30:04',NULL,NULL,1,NULL,NULL,NULL),(30,1,'checkout',14,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',12,NULL,NULL,'2021-08-19 05:30:04','2021-08-19 05:30:04',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:30:04'),(31,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',12,NULL,NULL,'2021-08-19 05:30:18','2021-08-19 05:30:18',NULL,NULL,1,NULL,'{\"name\":{\"old\":null,\"new\":\"Desktop\"}}',NULL),(32,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',13,NULL,NULL,'2021-08-19 05:31:11','2021-08-19 05:31:11',NULL,NULL,1,NULL,NULL,NULL),(33,1,'checkout',15,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',13,NULL,NULL,'2021-08-19 05:31:11','2021-08-19 05:31:11',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:31:11'),(34,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',13,NULL,NULL,'2021-08-19 05:31:33','2021-08-19 05:31:33',NULL,NULL,1,NULL,'{\"name\":{\"old\":null,\"new\":\"Desktop\"}}',NULL),(35,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',14,NULL,NULL,'2021-08-19 05:32:27','2021-08-19 05:32:27',NULL,NULL,1,NULL,NULL,NULL),(36,1,'checkout',16,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',14,NULL,NULL,'2021-08-19 05:32:27','2021-08-19 05:32:27',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:32:27'),(37,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',15,NULL,NULL,'2021-08-19 05:33:25','2021-08-19 05:33:25',NULL,NULL,1,NULL,NULL,NULL),(38,1,'checkout',17,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',15,NULL,NULL,'2021-08-19 05:33:25','2021-08-19 05:33:25',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:33:25'),(39,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',15,NULL,NULL,'2021-08-19 05:33:37','2021-08-19 05:33:37',NULL,NULL,1,NULL,'{\"name\":{\"old\":null,\"new\":\"Desktop\"}}',NULL),(40,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',16,NULL,NULL,'2021-08-19 05:34:33','2021-08-19 05:34:33',NULL,NULL,1,NULL,NULL,NULL),(41,1,'checkout',18,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',16,NULL,NULL,'2021-08-19 05:34:33','2021-08-19 05:34:33',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:34:33'),(42,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',17,NULL,NULL,'2021-08-19 05:35:16','2021-08-19 05:35:16',NULL,NULL,1,NULL,NULL,NULL),(43,1,'checkout',19,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',17,NULL,NULL,'2021-08-19 05:35:16','2021-08-19 05:35:16',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:35:16'),(44,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',17,NULL,NULL,'2021-08-19 05:35:35','2021-08-19 05:35:35',NULL,NULL,1,NULL,'{\"name\":{\"old\":null,\"new\":\"Desktop\"}}',NULL),(45,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',18,NULL,NULL,'2021-08-19 05:36:11','2021-08-19 05:36:11',NULL,NULL,1,NULL,NULL,NULL),(46,1,'checkout',20,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',18,NULL,NULL,'2021-08-19 05:36:11','2021-08-19 05:36:11',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:36:11'),(47,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',18,NULL,NULL,'2021-08-19 05:36:26','2021-08-19 05:36:26',NULL,NULL,1,NULL,'{\"name\":{\"old\":null,\"new\":\"Desktop\"}}',NULL),(48,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',19,NULL,NULL,'2021-08-19 05:37:03','2021-08-19 05:37:03',NULL,NULL,1,NULL,NULL,NULL),(49,1,'checkout',21,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',19,NULL,NULL,'2021-08-19 05:37:03','2021-08-19 05:37:03',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:37:03'),(50,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',19,NULL,NULL,'2021-08-19 05:37:14','2021-08-19 05:37:14',NULL,NULL,1,NULL,'{\"name\":{\"old\":null,\"new\":\"Desktop\"}}',NULL),(51,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',20,NULL,NULL,'2021-08-19 05:37:47','2021-08-19 05:37:47',NULL,NULL,1,NULL,NULL,NULL),(52,1,'checkout',22,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',20,NULL,NULL,'2021-08-19 05:37:47','2021-08-19 05:37:47',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:37:47'),(53,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',20,NULL,NULL,'2021-08-19 05:38:04','2021-08-19 05:38:04',NULL,NULL,1,NULL,'{\"name\":{\"old\":null,\"new\":\"Desktop\"},\"supplier_id\":{\"old\":null,\"new\":\"1\"},\"rtd_location_id\":{\"old\":null,\"new\":\"1\"}}',NULL),(54,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',21,NULL,NULL,'2021-08-19 05:38:57','2021-08-19 05:38:57',NULL,NULL,1,NULL,NULL,NULL),(55,1,'checkout',23,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',21,NULL,NULL,'2021-08-19 05:38:57','2021-08-19 05:38:57',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:38:57'),(56,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',22,NULL,NULL,'2021-08-19 05:39:47','2021-08-19 05:39:47',NULL,NULL,1,NULL,NULL,NULL),(57,1,'checkout',24,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',22,NULL,NULL,'2021-08-19 05:39:47','2021-08-19 05:39:47',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:39:47'),(58,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',23,NULL,NULL,'2021-08-19 05:40:31','2021-08-19 05:40:31',NULL,NULL,1,NULL,NULL,NULL),(59,1,'checkout',25,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',23,NULL,NULL,'2021-08-19 05:40:31','2021-08-19 05:40:31',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:40:31'),(60,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',23,NULL,NULL,'2021-08-19 05:40:43','2021-08-19 05:40:43',NULL,NULL,1,NULL,'{\"name\":{\"old\":null,\"new\":\"Desktop\"}}',NULL),(61,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',24,NULL,NULL,'2021-08-19 05:42:47','2021-08-19 05:42:47',NULL,NULL,1,NULL,NULL,NULL),(62,1,'checkout',26,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',24,NULL,NULL,'2021-08-19 05:42:47','2021-08-19 05:42:47',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:42:47'),(63,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',24,NULL,NULL,'2021-08-19 05:43:00','2021-08-19 05:43:00',NULL,NULL,1,NULL,'{\"name\":{\"old\":null,\"new\":\"Desktop\"}}',NULL),(64,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',25,NULL,NULL,'2021-08-19 05:43:55','2021-08-19 05:43:55',NULL,NULL,1,NULL,NULL,NULL),(65,1,'checkout',27,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',25,NULL,NULL,'2021-08-19 05:43:56','2021-08-19 05:43:56',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:43:55'),(66,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',25,NULL,NULL,'2021-08-19 05:44:06','2021-08-19 05:44:06',NULL,NULL,1,NULL,'{\"name\":{\"old\":null,\"new\":\"Desktop\"}}',NULL),(67,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',26,NULL,NULL,'2021-08-19 05:44:47','2021-08-19 05:44:47',NULL,NULL,1,NULL,NULL,NULL),(68,1,'checkout',28,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',26,NULL,NULL,'2021-08-19 05:44:47','2021-08-19 05:44:47',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:44:47'),(69,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',26,NULL,NULL,'2021-08-19 05:44:59','2021-08-19 05:44:59',NULL,NULL,1,NULL,'{\"name\":{\"old\":null,\"new\":\"Desktop\"}}',NULL),(70,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',27,NULL,NULL,'2021-08-19 05:46:26','2021-08-19 05:46:26',NULL,NULL,1,NULL,NULL,NULL),(71,1,'checkout',29,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',27,NULL,NULL,'2021-08-19 05:46:26','2021-08-19 05:46:26',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:46:26'),(72,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',28,NULL,NULL,'2021-08-19 05:47:41','2021-08-19 05:47:41',NULL,NULL,1,NULL,NULL,NULL),(73,1,'checkout',30,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',28,NULL,NULL,'2021-08-19 05:47:41','2021-08-19 05:47:41',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:47:41'),(74,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',28,NULL,NULL,'2021-08-19 05:47:54','2021-08-19 05:47:54',NULL,NULL,1,NULL,'{\"name\":{\"old\":null,\"new\":\"Desktop\"}}',NULL),(75,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',29,NULL,NULL,'2021-08-19 05:49:09','2021-08-19 05:49:09',NULL,NULL,1,NULL,NULL,NULL),(76,1,'checkout',31,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',29,NULL,NULL,'2021-08-19 05:49:09','2021-08-19 05:49:09',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:49:09'),(77,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',29,NULL,NULL,'2021-08-19 05:49:25','2021-08-19 05:49:25',NULL,NULL,1,NULL,'{\"name\":{\"old\":null,\"new\":\"Desktop\"}}',NULL),(78,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',30,NULL,NULL,'2021-08-19 05:50:08','2021-08-19 05:50:08',NULL,NULL,NULL,NULL,NULL,NULL),(79,1,'checkout',32,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',30,NULL,NULL,'2021-08-19 05:50:08','2021-08-19 05:50:08',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:50:08'),(80,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',30,NULL,NULL,'2021-08-19 05:50:19','2021-08-19 05:50:19',NULL,NULL,NULL,NULL,'{\"name\":{\"old\":null,\"new\":\"Desktop\"}}',NULL),(81,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',31,NULL,NULL,'2021-08-19 05:51:01','2021-08-19 05:51:01',NULL,NULL,1,NULL,NULL,NULL),(82,1,'checkout',33,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',31,NULL,NULL,'2021-08-19 05:51:01','2021-08-19 05:51:01',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:51:01'),(83,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',32,NULL,NULL,'2021-08-19 05:52:00','2021-08-19 05:52:00',NULL,NULL,1,NULL,NULL,NULL),(84,1,'checkout',34,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',32,NULL,NULL,'2021-08-19 05:52:00','2021-08-19 05:52:00',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:52:00'),(85,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',33,NULL,NULL,'2021-08-19 05:52:52','2021-08-19 05:52:52',NULL,NULL,1,NULL,NULL,NULL),(86,1,'checkout',35,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',33,NULL,NULL,'2021-08-19 05:52:52','2021-08-19 05:52:52',NULL,NULL,NULL,NULL,NULL,'2021-08-19 06:52:52'),(87,NULL,'requested',1,'App\\Models\\User',NULL,NULL,NULL,'App\\Models\\Asset',5,NULL,NULL,'2021-08-19 05:59:49','2021-08-19 05:59:49',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `action_logs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `asset_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_id` int(11) NOT NULL,
  `checkedout_to` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `asset_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT NULL,
  `accepted_at` datetime DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `accepted_id` int(11) DEFAULT NULL,
  `consumable_id` int(11) DEFAULT NULL,
  `expected_checkin` date DEFAULT NULL,
  `component_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `asset_logs` WRITE;
/*!40000 ALTER TABLE `asset_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_logs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `asset_maintenances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_maintenances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL,
  `supplier_id` int(10) unsigned NOT NULL,
  `asset_maintenance_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_warranty` tinyint(1) NOT NULL,
  `start_date` date NOT NULL,
  `completion_date` date DEFAULT NULL,
  `asset_maintenance_time` int(11) DEFAULT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` decimal(20,2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `asset_maintenances` WRITE;
/*!40000 ALTER TABLE `asset_maintenances` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_maintenances` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `asset_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_id` int(11) NOT NULL,
  `filenotes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `asset_uploads` WRITE;
/*!40000 ALTER TABLE `asset_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_uploads` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `serial` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `physical` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT 0,
  `warranty_months` int(11) DEFAULT NULL,
  `depreciate` tinyint(1) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `requestable` tinyint(4) NOT NULL DEFAULT 0,
  `rtd_location_id` int(11) DEFAULT NULL,
  `accepted` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_checkout` datetime DEFAULT NULL,
  `expected_checkin` date DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `assigned_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_audit_date` datetime DEFAULT NULL,
  `next_audit_date` date DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `checkin_counter` int(11) NOT NULL DEFAULT 0,
  `checkout_counter` int(11) NOT NULL DEFAULT 0,
  `requests_counter` int(11) NOT NULL DEFAULT 0,
  `_snipeit_cpu_2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_snipeit_ram_3` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_snipeit_hdd_4` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_snipeit_ssd_5` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_snipeit_gpu_6` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_rtd_location_id_index` (`rtd_location_id`),
  KEY `assets_assigned_type_assigned_to_index` (`assigned_type`,`assigned_to`),
  KEY `assets_created_at_index` (`created_at`),
  KEY `assets_deleted_at_status_id_index` (`deleted_at`,`status_id`),
  KEY `assets_deleted_at_model_id_index` (`deleted_at`,`model_id`),
  KEY `assets_deleted_at_assigned_type_assigned_to_index` (`deleted_at`,`assigned_type`,`assigned_to`),
  KEY `assets_deleted_at_supplier_id_index` (`deleted_at`,`supplier_id`),
  KEY `assets_deleted_at_location_id_index` (`deleted_at`,`location_id`),
  KEY `assets_deleted_at_rtd_location_id_index` (`deleted_at`,`rtd_location_id`),
  KEY `assets_deleted_at_asset_tag_index` (`deleted_at`,`asset_tag`),
  KEY `assets_deleted_at_name_index` (`deleted_at`,`name`),
  KEY `assets_serial_index` (`serial`),
  KEY `assets_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,'Desktop','00000001',1,NULL,NULL,NULL,NULL,3,NULL,NULL,1,'2021-08-19 05:12:27','2021-08-19 05:12:27',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:12:27',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I5-3330','4GB','500GB',NULL,NULL),(2,'Desktop','00000002',1,NULL,NULL,NULL,NULL,4,NULL,NULL,1,'2021-08-19 05:13:56','2021-08-19 05:13:56',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:13:56',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I3-4160','4GB','500GB',NULL,NULL),(3,'Desktop','00000003',1,NULL,NULL,NULL,NULL,5,NULL,NULL,1,'2021-08-19 05:15:21','2021-08-19 05:15:21',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:15:21',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I5-3470','8GB','500GB','120GB',NULL),(4,'Desktop','00000004',1,NULL,NULL,NULL,NULL,6,NULL,NULL,1,'2021-08-19 05:16:33','2021-08-19 05:16:46',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:16:33',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I5-3470','4GB','500GB',NULL,NULL),(5,'Desktop','00000005',1,NULL,NULL,NULL,NULL,7,NULL,NULL,1,'2021-08-19 05:19:01','2021-08-19 05:59:49',1,NULL,2,0,NULL,0,1,1,1,NULL,'2021-08-19 06:19:01',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,1,'I3-4160','4GB','500GB',NULL,NULL),(6,'Desktop','00000006',1,NULL,NULL,NULL,NULL,8,NULL,NULL,1,'2021-08-19 05:20:38','2021-08-19 05:20:38',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:20:38',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I3-7100','8GB','500GB',NULL,NULL),(7,'Desktop','00000007',1,NULL,NULL,NULL,NULL,9,NULL,NULL,1,'2021-08-19 05:23:15','2021-08-19 05:23:38',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:23:15',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I5-3470s','4GB','500GB',NULL,NULL),(8,'Desktop','00000008',1,NULL,NULL,NULL,NULL,10,NULL,NULL,1,'2021-08-19 05:24:24','2021-08-19 05:24:25',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:24:24',NULL,NULL,'App\\Models\\User',NULL,NULL,1,0,1,0,'I3-4160','4GB','500GB',NULL,NULL),(9,'Desktop','00000009',1,NULL,NULL,NULL,NULL,11,NULL,NULL,1,'2021-08-19 05:25:33','2021-08-19 05:25:58',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:25:33',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I5-3470','4GB','500GB',NULL,NULL),(10,'Desktop','00000010',1,NULL,NULL,NULL,NULL,12,NULL,NULL,1,'2021-08-19 05:27:00','2021-08-19 05:27:31',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:27:00',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I3-8100','4GB',NULL,'240GB',NULL),(11,'Desktop','00000011',1,NULL,NULL,NULL,NULL,13,NULL,NULL,1,'2021-08-19 05:28:17','2021-08-19 05:28:29',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:28:17',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I5-3550','4GB','500GB',NULL,NULL),(12,'Desktop','00000012',1,NULL,NULL,NULL,NULL,14,NULL,NULL,1,'2021-08-19 05:30:04','2021-08-19 05:30:18',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:30:04',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'E5-2640','16GB','500GB','240GB',NULL),(13,'Desktop','00000013',1,NULL,NULL,NULL,NULL,15,NULL,NULL,1,'2021-08-19 05:31:11','2021-08-19 05:31:33',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:31:11',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I5-3470','8GB','500GB','120GB',NULL),(14,'Desktop','00000014',1,NULL,NULL,NULL,NULL,16,NULL,NULL,1,'2021-08-19 05:32:27','2021-08-19 05:32:27',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:32:27',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I3-4150','8GB','500GB','240GB',NULL),(15,'Desktop','00000015',1,NULL,NULL,NULL,NULL,17,NULL,NULL,1,'2021-08-19 05:33:25','2021-08-19 05:33:37',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:33:25',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I5-3470','4GB','500GB','120GB',NULL),(16,'Desktop','00000016',1,NULL,NULL,NULL,NULL,18,NULL,NULL,1,'2021-08-19 05:34:33','2021-08-19 05:34:33',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:34:33',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I5-7400','4GB','500GB','120GB',NULL),(17,'Desktop','00000017',1,NULL,NULL,NULL,NULL,19,NULL,NULL,1,'2021-08-19 05:35:16','2021-08-19 05:35:35',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:35:16',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I3-4160','8GB','500GB','120GB',NULL),(18,'Desktop','00000018',1,NULL,NULL,NULL,NULL,20,NULL,NULL,1,'2021-08-19 05:36:11','2021-08-19 05:36:26',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:36:11',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I3-4160','4GB','500GB',NULL,NULL),(19,'Desktop','00000019',1,NULL,NULL,NULL,NULL,21,NULL,NULL,1,'2021-08-19 05:37:03','2021-08-19 05:37:14',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:37:03',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I3-4160','4GB','1TB',NULL,NULL),(20,'Desktop','00000020',1,NULL,NULL,NULL,NULL,22,NULL,NULL,1,'2021-08-19 05:37:47','2021-08-19 05:38:04',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:37:47',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0,'I5-3470','4GB','500GB',NULL,NULL),(21,'Desktop','00000021',1,NULL,NULL,NULL,NULL,23,NULL,NULL,1,'2021-08-19 05:38:57','2021-08-19 05:38:57',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:38:57',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I5-3470','4GB','500GB',NULL,NULL),(22,'Desktop','00000022',1,NULL,NULL,NULL,NULL,24,NULL,NULL,1,'2021-08-19 05:39:47','2021-08-19 05:39:47',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:39:47',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I5-7400','4GB','1TB',NULL,NULL),(23,'Desktop','00000023',1,NULL,NULL,NULL,NULL,25,NULL,NULL,1,'2021-08-19 05:40:31','2021-08-19 05:40:43',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:40:31',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I5-3470','4GB','500GB',NULL,NULL),(24,'Desktop','00000024',1,NULL,NULL,NULL,NULL,26,NULL,NULL,1,'2021-08-19 05:42:47','2021-08-19 05:43:00',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:42:47',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I5-6400','8GB','500GB','240GB',NULL),(25,'Desktop','00000025',1,NULL,NULL,NULL,NULL,27,NULL,NULL,1,'2021-08-19 05:43:55','2021-08-19 05:44:06',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:43:55',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I3-540','4GB','1TB',NULL,NULL),(26,'Desktop','00000026',1,NULL,NULL,NULL,NULL,28,NULL,NULL,1,'2021-08-19 05:44:47','2021-08-19 05:44:59',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:44:47',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I5-3470s','4GB','500GB',NULL,NULL),(27,'Desktop','00000027',1,NULL,NULL,NULL,NULL,29,NULL,NULL,1,'2021-08-19 05:46:26','2021-08-19 05:46:26',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:46:26',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I5-3470s','4GB','500GB','120GB',NULL),(28,'Desktop','00000028',1,NULL,NULL,NULL,NULL,30,NULL,NULL,1,'2021-08-19 05:47:41','2021-08-19 05:47:54',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:47:41',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I5-3470s','4GB','500GB','120GB',NULL),(29,'Desktop','00000029',1,NULL,NULL,NULL,NULL,31,NULL,NULL,1,'2021-08-19 05:49:09','2021-08-19 05:49:25',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:49:09',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I5-3470s','4GB','500GB',NULL,NULL),(30,'Desktop','00000030',1,NULL,NULL,NULL,NULL,32,NULL,NULL,1,'2021-08-19 05:50:08','2021-08-19 05:50:19',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:50:08',NULL,NULL,'App\\Models\\User',NULL,NULL,1,0,1,0,'I5-3470','4GB','500GB','120GB',NULL),(31,'Desktop','00000031',1,NULL,NULL,NULL,NULL,33,NULL,NULL,1,'2021-08-19 05:51:01','2021-08-19 05:51:01',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:51:01',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I3-4160','4GB','500GB',NULL,NULL),(32,'Desktop','00000032',1,NULL,NULL,NULL,NULL,34,NULL,NULL,1,'2021-08-19 05:52:00','2021-08-19 05:52:00',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:52:00',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I3-7100','4GB','500GB',NULL,NULL),(33,'Desktop','00000033',1,NULL,NULL,NULL,NULL,35,NULL,NULL,1,'2021-08-19 05:52:52','2021-08-19 05:52:52',1,NULL,2,0,NULL,0,1,0,1,NULL,'2021-08-19 06:52:52',NULL,1,'App\\Models\\User',NULL,NULL,1,0,1,0,'I3-7100','4GB','1TB',NULL,NULL);
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `eula_text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_default_eula` tinyint(1) NOT NULL DEFAULT 0,
  `require_acceptance` tinyint(1) NOT NULL DEFAULT 0,
  `category_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'asset',
  `checkin_email` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Misc Software','2021-07-12 05:07:49','2021-08-19 03:11:55',NULL,'2021-08-19 03:11:55',NULL,0,0,'license',0,NULL),(2,'Desktop','2021-08-19 03:00:53','2021-08-19 03:00:53',NULL,NULL,NULL,0,0,'asset',0,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_acceptances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_acceptances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `checkoutable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkoutable_id` bigint(20) unsigned NOT NULL,
  `assigned_to_id` int(11) DEFAULT NULL,
  `signature_filename` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accepted_at` timestamp NULL DEFAULT NULL,
  `declined_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkout_acceptances_checkoutable_type_checkoutable_id_index` (`checkoutable_type`,`checkoutable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `checkout_acceptances` WRITE;
/*!40000 ALTER TABLE `checkout_acceptances` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_acceptances` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `requestable_id` int(11) NOT NULL,
  `requestable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `canceled_at` datetime DEFAULT NULL,
  `fulfilled_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkout_requests_user_id_requestable_id_requestable_type` (`user_id`,`requestable_id`,`requestable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `checkout_requests` WRITE;
/*!40000 ALTER TABLE `checkout_requests` DISABLE KEYS */;
INSERT INTO `checkout_requests` VALUES (1,1,5,'App\\Models\\Asset',1,'2021-08-19 05:59:49','2021-08-19 05:59:49',NULL,NULL,NULL);
/*!40000 ALTER TABLE `checkout_requests` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'ThanhTai','2021-08-19 05:09:30','2021-08-19 05:09:30','company-image-HNwyySPprJ.png');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `min_amt` int(11) DEFAULT NULL,
  `serial` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `components_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `components` WRITE;
/*!40000 ALTER TABLE `components` DISABLE KEYS */;
/*!40000 ALTER TABLE `components` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `components_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `components_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `assigned_qty` int(11) DEFAULT 1,
  `component_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `components_assets` WRITE;
/*!40000 ALTER TABLE `components_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_assets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `consumables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `requestable` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `min_amt` int(11) DEFAULT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `item_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consumables_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `consumables` WRITE;
/*!40000 ALTER TABLE `consumables` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumables` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `consumables_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumables_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `consumable_id` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `consumables_users` WRITE;
/*!40000 ALTER TABLE `consumables_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumables_users` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `custom_field_custom_fieldset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_field_custom_fieldset` (
  `custom_field_id` int(11) NOT NULL,
  `custom_fieldset_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `custom_field_custom_fieldset` WRITE;
/*!40000 ALTER TABLE `custom_field_custom_fieldset` DISABLE KEYS */;
INSERT INTO `custom_field_custom_fieldset` VALUES (1,1,1,0),(2,2,1,1),(3,2,2,1),(5,2,3,0),(4,2,4,0),(6,2,5,0);
/*!40000 ALTER TABLE `custom_field_custom_fieldset` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `field_values` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_encrypted` tinyint(1) NOT NULL DEFAULT 0,
  `db_column` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `help_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_in_email` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
INSERT INTO `custom_fields` VALUES (2,'CPU','','listbox','2021-08-19 02:52:22','2021-08-19 02:52:22',NULL,'I3-3120\r\nI3-4150\r\nI3-4160\r\nI3-540\r\nI3-6100\r\nI3-7100\r\nI3-8100\r\nI5-3330\r\nI5-3470\r\nI5-3470s\r\nI5-3470T\r\nI5-3550\r\nI5-3700T\r\nI5-6400\r\nI5-6500\r\nI5-7400\r\nE5-2640\r\nE5-2670',0,'_snipeit_cpu_2',NULL,0),(3,'RAM','','listbox','2021-08-19 02:53:25','2021-08-19 02:53:34',1,'4GB\r\n6GB\r\n8GB\r\n12GB\r\n16GB\r\n32GB\r\n64GB',0,'_snipeit_ram_3',NULL,0),(4,'HDD','','listbox','2021-08-19 02:54:38','2021-08-19 02:54:38',NULL,'500GB\r\n1TB\r\n2TB\r\n3TB\r\n4TB\r\n6TB\r\n8TB\r\n12TB',0,'_snipeit_hdd_4',NULL,0),(5,'SSD','','listbox','2021-08-19 02:56:02','2021-08-19 02:56:02',NULL,'120GB\r\n240GB\r\n500GB',0,'_snipeit_ssd_5',NULL,0),(6,'GPU','','text','2021-08-19 02:59:19','2021-08-19 02:59:19',NULL,NULL,0,'_snipeit_gpu_6',NULL,0);
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `custom_fieldsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fieldsets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `custom_fieldsets` WRITE;
/*!40000 ALTER TABLE `custom_fieldsets` DISABLE KEYS */;
INSERT INTO `custom_fieldsets` VALUES (2,'Computer Fieldsets','2021-08-19 02:58:32','2021-08-19 02:58:32',1);
/*!40000 ALTER TABLE `custom_fieldsets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departments_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `depreciations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depreciations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `months` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `depreciations` WRITE;
/*!40000 ALTER TABLE `depreciations` DISABLE KEYS */;
/*!40000 ALTER TABLE `depreciations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filesize` int(11) NOT NULL,
  `import_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `header_row` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_row` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_map` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `kits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `kits` WRITE;
/*!40000 ALTER TABLE `kits` DISABLE KEYS */;
/*!40000 ALTER TABLE `kits` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `kits_accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kits_accessories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kit_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `kits_accessories` WRITE;
/*!40000 ALTER TABLE `kits_accessories` DISABLE KEYS */;
/*!40000 ALTER TABLE `kits_accessories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `kits_consumables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kits_consumables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kit_id` int(11) DEFAULT NULL,
  `consumable_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `kits_consumables` WRITE;
/*!40000 ALTER TABLE `kits_consumables` DISABLE KEYS */;
/*!40000 ALTER TABLE `kits_consumables` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `kits_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kits_licenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kit_id` int(11) DEFAULT NULL,
  `license_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `kits_licenses` WRITE;
/*!40000 ALTER TABLE `kits_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `kits_licenses` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `kits_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kits_models` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kit_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `kits_models` WRITE;
/*!40000 ALTER TABLE `kits_models` DISABLE KEYS */;
/*!40000 ALTER TABLE `kits_models` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `license_seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_seats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `license_id` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `license_seats` WRITE;
/*!40000 ALTER TABLE `license_seats` DISABLE KEYS */;
/*!40000 ALTER TABLE `license_seats` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seats` int(11) NOT NULL DEFAULT 1,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `depreciation_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `license_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depreciate` tinyint(1) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `purchase_order` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `maintained` tinyint(1) DEFAULT NULL,
  `reassignable` tinyint(1) NOT NULL DEFAULT 1,
  `company_id` int(10) unsigned DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `licenses_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_ou` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Bình Dương',NULL,NULL,NULL,'2021-08-19 05:08:53','2021-08-19 05:08:53',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Quận 12',NULL,NULL,NULL,'2021-08-19 05:09:02','2021-08-19 05:09:02',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_attempts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remote_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `successful` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
INSERT INTO `login_attempts` VALUES (1,'doanvo','10.10.120.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',1,'2021-07-12 05:09:55',NULL),(2,'doanvo','10.10.120.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36',1,'2021-07-22 09:00:45',NULL),(3,'doanvo','10.10.120.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36',0,'2021-07-23 03:16:54',NULL),(4,'doanvo','10.10.120.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36',0,'2021-07-23 03:17:04',NULL),(5,'doanvo','10.10.120.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36',0,'2021-07-23 03:17:12',NULL),(6,'doanvo','10.10.120.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36',0,'2021-07-23 03:19:13',NULL),(7,'doanvo','10.10.120.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36',0,'2021-07-23 03:24:18',NULL),(8,'doanvo','10.10.120.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36',0,'2021-08-06 04:37:21',NULL),(9,'doanvo','10.10.120.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36',1,'2021-08-06 04:37:26',NULL),(10,'doanvo','10.10.120.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36',1,'2021-08-19 01:40:59',NULL),(11,'doanvo','10.10.120.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36',1,'2021-09-09 02:23:48',NULL),(12,'doanvo','10.10.120.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36',1,'2021-09-12 08:41:50',NULL);
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (1,'PC','2021-08-19 03:00:24','2021-08-19 03:09:42',NULL,'2021-08-19 03:09:42',NULL,NULL,NULL,NULL,NULL),(2,'NA','2021-08-19 03:00:40','2021-08-19 03:00:40',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Dell','2021-08-19 03:09:51','2021-08-19 03:11:33',1,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Sysnology','2021-08-19 03:10:09','2021-08-19 03:10:09',1,NULL,NULL,NULL,NULL,NULL,NULL),(5,'Samsung','2021-08-19 03:10:29','2021-08-19 03:10:29',1,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Canon','2021-08-19 03:10:40','2021-08-19 03:10:40',1,NULL,NULL,NULL,NULL,NULL,NULL),(7,'Brother','2021-08-19 03:11:02','2021-08-19 03:11:02',1,NULL,NULL,NULL,NULL,NULL,NULL),(8,'Ricoh','2021-08-19 03:11:22','2021-08-19 03:11:22',1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2012_12_06_225921_migration_cartalyst_sentry_install_users',1),(2,'2012_12_06_225929_migration_cartalyst_sentry_install_groups',1),(3,'2012_12_06_225945_migration_cartalyst_sentry_install_users_groups_pivot',1),(4,'2012_12_06_225988_migration_cartalyst_sentry_install_throttle',1),(5,'2013_03_23_193214_update_users_table',1),(6,'2013_11_13_075318_create_models_table',1),(7,'2013_11_13_075335_create_categories_table',1),(8,'2013_11_13_075347_create_manufacturers_table',1),(9,'2013_11_15_015858_add_user_id_to_categories',1),(10,'2013_11_15_112701_add_user_id_to_manufacturers',1),(11,'2013_11_15_190327_create_assets_table',1),(12,'2013_11_15_190357_create_licenses_table',1),(13,'2013_11_15_201848_add_license_name_to_licenses',1),(14,'2013_11_16_040323_create_depreciations_table',1),(15,'2013_11_16_042851_add_depreciation_id_to_models',1),(16,'2013_11_16_084923_add_user_id_to_models',1),(17,'2013_11_16_103258_create_locations_table',1),(18,'2013_11_16_103336_add_location_id_to_assets',1),(19,'2013_11_16_103407_add_checkedout_to_to_assets',1),(20,'2013_11_16_103425_create_history_table',1),(21,'2013_11_17_054359_drop_licenses_table',1),(22,'2013_11_17_054526_add_physical_to_assets',1),(23,'2013_11_17_055126_create_settings_table',1),(24,'2013_11_17_062634_add_license_to_assets',1),(25,'2013_11_18_134332_add_contacts_to_users',1),(26,'2013_11_18_142847_add_info_to_locations',1),(27,'2013_11_18_152942_remove_location_id_from_asset',1),(28,'2013_11_18_164423_set_nullvalues_for_user',1),(29,'2013_11_19_013337_create_asset_logs_table',1),(30,'2013_11_19_061409_edit_added_on_asset_logs_table',1),(31,'2013_11_19_062250_edit_location_id_asset_logs_table',1),(32,'2013_11_20_055822_add_soft_delete_on_assets',1),(33,'2013_11_20_121404_add_soft_delete_on_locations',1),(34,'2013_11_20_123137_add_soft_delete_on_manufacturers',1),(35,'2013_11_20_123725_add_soft_delete_on_categories',1),(36,'2013_11_20_130248_create_status_labels',1),(37,'2013_11_20_130830_add_status_id_on_assets_table',1),(38,'2013_11_20_131544_add_status_type_on_status_labels',1),(39,'2013_11_20_134103_add_archived_to_assets',1),(40,'2013_11_21_002321_add_uploads_table',1),(41,'2013_11_21_024531_remove_deployable_boolean_from_status_labels',1),(42,'2013_11_22_075308_add_option_label_to_settings_table',1),(43,'2013_11_22_213400_edits_to_settings_table',1),(44,'2013_11_25_013244_create_licenses_table',1),(45,'2013_11_25_031458_create_license_seats_table',1),(46,'2013_11_25_032022_add_type_to_actionlog_table',1),(47,'2013_11_25_033008_delete_bad_licenses_table',1),(48,'2013_11_25_033131_create_new_licenses_table',1),(49,'2013_11_25_033534_add_licensed_to_licenses_table',1),(50,'2013_11_25_101308_add_warrantee_to_assets_table',1),(51,'2013_11_25_104343_alter_warranty_column_on_assets',1),(52,'2013_11_25_150450_drop_parent_from_categories',1),(53,'2013_11_25_151920_add_depreciate_to_assets',1),(54,'2013_11_25_152903_add_depreciate_to_licenses_table',1),(55,'2013_11_26_211820_drop_license_from_assets_table',1),(56,'2013_11_27_062510_add_note_to_asset_logs_table',1),(57,'2013_12_01_113426_add_filename_to_asset_log',1),(58,'2013_12_06_094618_add_nullable_to_licenses_table',1),(59,'2013_12_10_084038_add_eol_on_models_table',1),(60,'2013_12_12_055218_add_manager_to_users_table',1),(61,'2014_01_28_031200_add_qr_code_to_settings_table',1),(62,'2014_02_13_183016_add_qr_text_to_settings_table',1),(63,'2014_05_24_093839_alter_default_license_depreciation_id',1),(64,'2014_05_27_231658_alter_default_values_licenses',1),(65,'2014_06_19_191508_add_asset_name_to_settings',1),(66,'2014_06_20_004847_make_asset_log_checkedout_to_nullable',1),(67,'2014_06_20_005050_make_asset_log_purchasedate_to_nullable',1),(68,'2014_06_24_003011_add_suppliers',1),(69,'2014_06_24_010742_add_supplier_id_to_asset',1),(70,'2014_06_24_012839_add_zip_to_supplier',1),(71,'2014_06_24_033908_add_url_to_supplier',1),(72,'2014_07_08_054116_add_employee_id_to_users',1),(73,'2014_07_09_134316_add_requestable_to_assets',1),(74,'2014_07_17_085822_add_asset_to_software',1),(75,'2014_07_17_161625_make_asset_id_in_logs_nullable',1),(76,'2014_08_12_053504_alpha_0_4_2_release',1),(77,'2014_08_17_083523_make_location_id_nullable',1),(78,'2014_10_16_200626_add_rtd_location_to_assets',1),(79,'2014_10_24_000417_alter_supplier_state_to_32',1),(80,'2014_10_24_015641_add_display_checkout_date',1),(81,'2014_10_28_222654_add_avatar_field_to_users_table',1),(82,'2014_10_29_045924_add_image_field_to_models_table',1),(83,'2014_11_01_214955_add_eol_display_to_settings',1),(84,'2014_11_04_231416_update_group_field_for_reporting',1),(85,'2014_11_05_212408_add_fields_to_licenses',1),(86,'2014_11_07_021042_add_image_to_supplier',1),(87,'2014_11_20_203007_add_username_to_user',1),(88,'2014_11_20_223947_add_auto_to_settings',1),(89,'2014_11_20_224421_add_prefix_to_settings',1),(90,'2014_11_21_104401_change_licence_type',1),(91,'2014_12_09_082500_add_fields_maintained_term_to_licenses',1),(92,'2015_02_04_155757_increase_user_field_lengths',1),(93,'2015_02_07_013537_add_soft_deleted_to_log',1),(94,'2015_02_10_040958_fix_bad_assigned_to_ids',1),(95,'2015_02_10_053310_migrate_data_to_new_statuses',1),(96,'2015_02_11_044104_migrate_make_license_assigned_null',1),(97,'2015_02_11_104406_migrate_create_requests_table',1),(98,'2015_02_12_001312_add_mac_address_to_asset',1),(99,'2015_02_12_024100_change_license_notes_type',1),(100,'2015_02_17_231020_add_localonly_to_settings',1),(101,'2015_02_19_222322_add_logo_and_colors_to_settings',1),(102,'2015_02_24_072043_add_alerts_to_settings',1),(103,'2015_02_25_022931_add_eula_fields',1),(104,'2015_02_25_204513_add_accessories_table',1),(105,'2015_02_26_091228_add_accessories_user_table',1),(106,'2015_02_26_115128_add_deleted_at_models',1),(107,'2015_02_26_233005_add_category_type',1),(108,'2015_03_01_231912_update_accepted_at_to_acceptance_id',1),(109,'2015_03_05_011929_add_qr_type_to_settings',1),(110,'2015_03_18_055327_add_note_to_user',1),(111,'2015_04_29_234704_add_slack_to_settings',1),(112,'2015_05_04_085151_add_parent_id_to_locations_table',1),(113,'2015_05_22_124421_add_reassignable_to_licenses',1),(114,'2015_06_10_003314_fix_default_for_user_notes',1),(115,'2015_06_10_003554_create_consumables',1),(116,'2015_06_15_183253_move_email_to_username',1),(117,'2015_06_23_070346_make_email_nullable',1),(118,'2015_06_26_213716_create_asset_maintenances_table',1),(119,'2015_07_04_212443_create_custom_fields_table',1),(120,'2015_07_09_014359_add_currency_to_settings_and_locations',1),(121,'2015_07_21_122022_add_expected_checkin_date_to_asset_logs',1),(122,'2015_07_24_093845_add_checkin_email_to_category_table',1),(123,'2015_07_25_055415_remove_email_unique_constraint',1),(124,'2015_07_29_230054_add_thread_id_to_asset_logs_table',1),(125,'2015_07_31_015430_add_accepted_to_assets',1),(126,'2015_09_09_195301_add_custom_css_to_settings',1),(127,'2015_09_21_235926_create_custom_field_custom_fieldset',1),(128,'2015_09_22_000104_create_custom_fieldsets',1),(129,'2015_09_22_003321_add_fieldset_id_to_assets',1),(130,'2015_09_22_003413_migrate_mac_address',1),(131,'2015_09_28_003314_fix_default_purchase_order',1),(132,'2015_10_01_024551_add_accessory_consumable_price_info',1),(133,'2015_10_12_192706_add_brand_to_settings',1),(134,'2015_10_22_003314_fix_defaults_accessories',1),(135,'2015_10_23_182625_add_checkout_time_and_expected_checkout_date_to_assets',1),(136,'2015_11_05_061015_create_companies_table',1),(137,'2015_11_05_061115_add_company_id_to_consumables_table',1),(138,'2015_11_05_183749_image',1),(139,'2015_11_06_092038_add_company_id_to_accessories_table',1),(140,'2015_11_06_100045_add_company_id_to_users_table',1),(141,'2015_11_06_134742_add_company_id_to_licenses_table',1),(142,'2015_11_08_035832_add_company_id_to_assets_table',1),(143,'2015_11_08_222305_add_ldap_fields_to_settings',1),(144,'2015_11_15_151803_add_full_multiple_companies_support_to_settings_table',1),(145,'2015_11_26_195528_import_ldap_settings',1),(146,'2015_11_30_191504_remove_fk_company_id',1),(147,'2015_12_21_193006_add_ldap_server_cert_ignore_to_settings_table',1),(148,'2015_12_30_233509_add_timestamp_and_userId_to_custom_fields',1),(149,'2015_12_30_233658_add_timestamp_and_userId_to_custom_fieldsets',1),(150,'2016_01_28_041048_add_notes_to_models',1),(151,'2016_02_19_070119_add_remember_token_to_users_table',1),(152,'2016_02_19_073625_create_password_resets_table',1),(153,'2016_03_02_193043_add_ldap_flag_to_users',1),(154,'2016_03_02_220517_update_ldap_filter_to_longer_field',1),(155,'2016_03_08_225351_create_components_table',1),(156,'2016_03_09_024038_add_min_stock_to_tables',1),(157,'2016_03_10_133849_add_locale_to_users',1),(158,'2016_03_10_135519_add_locale_to_settings',1),(159,'2016_03_11_185621_add_label_settings_to_settings',1),(160,'2016_03_22_125911_fix_custom_fields_regexes',1),(161,'2016_04_28_141554_add_show_to_users',1),(162,'2016_05_16_164733_add_model_mfg_to_consumable',1),(163,'2016_05_19_180351_add_alt_barcode_settings',1),(164,'2016_05_19_191146_add_alter_interval',1),(165,'2016_05_19_192226_add_inventory_threshold',1),(166,'2016_05_20_024859_remove_option_keys_from_settings_table',1),(167,'2016_05_20_143758_remove_option_value_from_settings_table',1),(168,'2016_06_01_000001_create_oauth_auth_codes_table',1),(169,'2016_06_01_000002_create_oauth_access_tokens_table',1),(170,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(171,'2016_06_01_000004_create_oauth_clients_table',1),(172,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(173,'2016_06_01_140218_add_email_domain_and_format_to_settings',1),(174,'2016_06_22_160725_add_user_id_to_maintenances',1),(175,'2016_07_13_150015_add_is_ad_to_settings',1),(176,'2016_07_14_153609_add_ad_domain_to_settings',1),(177,'2016_07_22_003348_fix_custom_fields_regex_stuff',1),(178,'2016_07_22_054850_one_more_mac_addr_fix',1),(179,'2016_07_22_143045_add_port_to_ldap_settings',1),(180,'2016_07_22_153432_add_tls_to_ldap_settings',1),(181,'2016_07_27_211034_add_zerofill_to_settings',1),(182,'2016_08_02_124944_add_color_to_statuslabel',1),(183,'2016_08_04_134500_add_disallow_ldap_pw_sync_to_settings',1),(184,'2016_08_09_002225_add_manufacturer_to_licenses',1),(185,'2016_08_12_121613_add_manufacturer_to_accessories_table',1),(186,'2016_08_23_143353_add_new_fields_to_custom_fields',1),(187,'2016_08_23_145619_add_show_in_nav_to_status_labels',1),(188,'2016_08_30_084634_make_purchase_cost_nullable',1),(189,'2016_09_01_141051_add_requestable_to_asset_model',1),(190,'2016_09_02_001448_create_checkout_requests_table',1),(191,'2016_09_04_180400_create_actionlog_table',1),(192,'2016_09_04_182149_migrate_asset_log_to_action_log',1),(193,'2016_09_19_235935_fix_fieldtype_for_target_type',1),(194,'2016_09_23_140722_fix_modelno_in_consumables_to_string',1),(195,'2016_09_28_231359_add_company_to_logs',1),(196,'2016_10_14_130709_fix_order_number_to_varchar',1),(197,'2016_10_16_015024_rename_modelno_to_model_number',1),(198,'2016_10_16_015211_rename_consumable_modelno_to_model_number',1),(199,'2016_10_16_143235_rename_model_note_to_notes',1),(200,'2016_10_16_165052_rename_component_total_qty_to_qty',1),(201,'2016_10_19_145520_fix_order_number_in_components_to_string',1),(202,'2016_10_27_151715_add_serial_to_components',1),(203,'2016_10_27_213251_increase_serial_field_capacity',1),(204,'2016_10_29_002724_enable_2fa_fields',1),(205,'2016_10_29_082408_add_signature_to_acceptance',1),(206,'2016_11_01_030818_fix_forgotten_filename_in_action_logs',1),(207,'2016_11_13_020954_rename_component_serial_number_to_serial',1),(208,'2016_11_16_172119_increase_purchase_cost_size',1),(209,'2016_11_17_161317_longer_state_field_in_location',1),(210,'2016_11_17_193706_add_model_number_to_accessories',1),(211,'2016_11_24_160405_add_missing_target_type_to_logs_table',1),(212,'2016_12_07_173720_increase_size_of_state_in_suppliers',1),(213,'2016_12_19_004212_adjust_locale_length_to_10',1),(214,'2016_12_19_133936_extend_phone_lengths_in_supplier_and_elsewhere',1),(215,'2016_12_27_212631_make_asset_assigned_to_polymorphic',1),(216,'2017_01_09_040429_create_locations_ldap_query_field',1),(217,'2017_01_14_002418_create_imports_table',1),(218,'2017_01_25_063357_fix_utf8_custom_field_column_names',1),(219,'2017_03_03_154632_add_time_date_display_to_settings',1),(220,'2017_03_10_210807_add_fields_to_manufacturer',1),(221,'2017_05_08_195520_increase_size_of_field_values_in_custom_fields',1),(222,'2017_05_22_204422_create_departments',1),(223,'2017_05_22_233509_add_manager_to_locations_table',1),(224,'2017_06_14_122059_add_next_autoincrement_to_settings',1),(225,'2017_06_18_151753_add_header_and_first_row_to_importer_table',1),(226,'2017_07_07_191533_add_login_text',1),(227,'2017_07_25_130710_add_thumbsize_to_settings',1),(228,'2017_08_03_160105_set_asset_archived_to_zero_default',1),(229,'2017_08_22_180636_add_secure_password_options',1),(230,'2017_08_25_074822_add_auditing_tables',1),(231,'2017_08_25_101435_add_auditing_to_settings',1),(232,'2017_09_18_225619_fix_assigned_type_not_being_nulled',1),(233,'2017_10_03_015503_drop_foreign_keys',1),(234,'2017_10_10_123504_allow_nullable_depreciation_id_in_models',1),(235,'2017_10_17_133709_add_display_url_to_settings',1),(236,'2017_10_19_120002_add_custom_forgot_password_url',1),(237,'2017_10_19_130406_add_image_and_supplier_to_accessories',1),(238,'2017_10_20_234129_add_location_indices_to_assets',1),(239,'2017_10_25_202930_add_images_uploads_to_locations_manufacturers_etc',1),(240,'2017_10_27_180947_denorm_asset_locations',1),(241,'2017_10_27_192423_migrate_denormed_asset_locations',1),(242,'2017_10_30_182938_add_address_to_user',1),(243,'2017_11_08_025918_add_alert_menu_setting',1),(244,'2017_11_08_123942_labels_display_company_name',1),(245,'2017_12_12_010457_normalize_asset_last_audit_date',1),(246,'2017_12_12_033618_add_actionlog_meta',1),(247,'2017_12_26_170856_re_normalize_last_audit',1),(248,'2018_01_17_184354_add_archived_in_list_setting',1),(249,'2018_01_19_203121_add_dashboard_message_to_settings',1),(250,'2018_01_24_062633_add_footer_settings_to_settings',1),(251,'2018_01_24_093426_add_modellist_preferenc',1),(252,'2018_02_22_160436_add_remote_user_settings',1),(253,'2018_03_03_011032_add_theme_to_settings',1),(254,'2018_03_06_054937_add_default_flag_on_statuslabels',1),(255,'2018_03_23_212048_add_display_in_email_to_custom_fields',1),(256,'2018_03_24_030738_add_show_images_in_email_setting',1),(257,'2018_03_24_050108_add_cc_alerts',1),(258,'2018_03_29_053618_add_canceled_at_and_fulfilled_at_in_requests',1),(259,'2018_03_29_070121_add_drop_unique_requests',1),(260,'2018_03_29_070511_add_new_index_requestable',1),(261,'2018_04_02_150700_labels_display_model_name',1),(262,'2018_04_16_133902_create_custom_field_default_values_table',1),(263,'2018_05_04_073223_add_category_to_licenses',1),(264,'2018_05_04_075235_add_update_license_category',1),(265,'2018_05_08_031515_add_gdpr_privacy_footer',1),(266,'2018_05_14_215229_add_indexes',1),(267,'2018_05_14_223646_add_indexes_to_assets',1),(268,'2018_05_14_233638_denorm_counters_on_assets',1),(269,'2018_05_16_153409_add_first_counter_totals_to_assets',1),(270,'2018_06_21_134622_add_version_footer',1),(271,'2018_07_05_215440_add_unique_serial_option_to_settings',1),(272,'2018_07_17_005911_create_login_attempts_table',1),(273,'2018_07_24_154348_add_logo_to_print_assets',1),(274,'2018_07_28_023826_create_checkout_acceptances_table',1),(275,'2018_08_20_204842_add_depreciation_option_to_settings',1),(276,'2018_09_10_082212_create_checkout_acceptances_for_unaccepted_assets',1),(277,'2018_10_18_191228_add_kits_licenses_table',1),(278,'2018_10_19_153910_add_kits_table',1),(279,'2018_10_19_154013_add_kits_models_table',1),(280,'2018_12_05_211936_add_favicon_to_settings',1),(281,'2018_12_05_212119_add_email_logo_to_settings',1),(282,'2019_02_07_185953_add_kits_consumables_table',1),(283,'2019_02_07_190030_add_kits_accessories_table',1),(284,'2019_02_12_182750_add_actiondate_to_actionlog',1),(285,'2019_02_14_154310_change_auto_increment_prefix_to_nullable',1),(286,'2019_02_16_143518_auto_increment_back_to_string',1),(287,'2019_02_17_205048_add_label_logo_to_settings',1),(288,'2019_02_20_234421_make_serial_nullable',1),(289,'2019_02_21_224703_make_fields_nullable_for_integrity',1),(290,'2019_04_06_060145_add_user_skin_setting',1),(291,'2019_04_06_205355_add_setting_allow_user_skin',1),(292,'2019_06_12_184327_rename_groups_table',1),(293,'2019_07_23_140906_add_show_assigned_assets_to_settings',1),(294,'2019_08_20_084049_add_custom_remote_user_header',1),(295,'2019_12_04_223111_passport_upgrade',1),(296,'2020_02_04_172100_add_ad_append_domain_settings',1),(297,'2020_04_29_222305_add_saml_fields_to_settings',1),(298,'2020_08_11_200712_add_saml_key_rollover',1),(299,'2020_10_22_233743_move_accessory_checkout_note_to_join_table',1),(300,'2020_10_23_161736_fix_zero_values_for_locations',1),(301,'2020_11_18_214827_widen_license_serial_field',1),(302,'2020_12_14_233815_add_digit_separator_to_settings',1),(303,'2020_12_18_090026_swap_target_type_index_order',1),(304,'2020_12_21_153235_update_min_password',1),(305,'2020_12_21_210105_fix_bad_ldap_server_url_for_v5',1),(306,'2021_02_05_172502_add_provider_to_oauth_table',1),(307,'2021_03_18_184102_adds_several_ldap_fields',1),(308,'2021_04_07_001811_add_ldap_dept',1),(309,'2021_04_14_180125_add_ids_to_tables',1),(310,'2021_06_07_155421_add_serial_number_indexes',1),(311,'2021_06_07_155436_add_company_id_indexes',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `models` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `depreciation_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `eol` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deprecated_mac_address` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `fieldset_id` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requestable` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` VALUES (1,'Desktop_OLD',NULL,2,2,'2021-08-19 03:08:22','2021-08-19 03:08:22',NULL,1,0,'assetmodel-image-yO3lccp16E.jpg',0,NULL,2,NULL,0);
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `models_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `models_custom_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_model_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `default_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `models_custom_fields` WRITE;
/*!40000 ALTER TABLE `models_custom_fields` DISABLE KEYS */;
INSERT INTO `models_custom_fields` VALUES (1,1,2,'I5-3470'),(2,1,3,'4GB'),(3,1,4,'500GB');
/*!40000 ALTER TABLE `models_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Snipe-IT Personal Access Client','TwGNiiUKgndUp6TbrxbW0zg2iFx2DbgiKZtIOEBH',NULL,'http://localhost',1,0,0,'2021-07-12 05:07:53','2021-07-12 05:07:53'),(2,NULL,'Snipe-IT Password Grant Client','cSzM5hAKlOeMRML91XjGrVNXNXu2PcCVSSE7b5rc','users','http://localhost',0,1,0,'2021-07-12 05:07:53','2021-07-12 05:07:53');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2021-07-12 05:07:53','2021-07-12 05:07:53');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `permission_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `permission_groups` WRITE;
/*!40000 ALTER TABLE `permission_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_groups` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `requested_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requested_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `accepted_at` datetime DEFAULT NULL,
  `denied_at` datetime DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `requested_assets` WRITE;
/*!40000 ALTER TABLE `requested_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `requested_assets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `request_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `per_page` int(11) NOT NULL DEFAULT 20,
  `site_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Snipe IT Asset Management',
  `qr_code` int(11) DEFAULT NULL,
  `qr_text` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_asset_name` int(11) DEFAULT NULL,
  `display_checkout_date` int(11) DEFAULT NULL,
  `display_eol` int(11) DEFAULT NULL,
  `auto_increment_assets` int(11) NOT NULL DEFAULT 0,
  `auto_increment_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `load_remote` tinyint(1) NOT NULL DEFAULT 1,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alert_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alerts_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `default_eula_text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'QRCODE',
  `slack_endpoint` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slack_channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slack_botname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_css` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` tinyint(4) NOT NULL DEFAULT 1,
  `ldap_enabled` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_server` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_uname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_pword` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_basedn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_filter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_username_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'samaccountname',
  `ldap_lname_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'sn',
  `ldap_fname_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'givenname',
  `ldap_auth_filter_query` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'uid=samaccountname',
  `ldap_version` int(11) DEFAULT 3,
  `ldap_active_flag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_dept` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_emp_num` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_phone_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_jobtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_multiple_companies_support` tinyint(1) NOT NULL DEFAULT 0,
  `ldap_server_cert_ignore` tinyint(1) NOT NULL DEFAULT 0,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `labels_per_page` tinyint(4) NOT NULL DEFAULT 30,
  `labels_width` decimal(6,5) NOT NULL DEFAULT 2.62500,
  `labels_height` decimal(6,5) NOT NULL DEFAULT 1.00000,
  `labels_pmargin_left` decimal(6,5) NOT NULL DEFAULT 0.21975,
  `labels_pmargin_right` decimal(6,5) NOT NULL DEFAULT 0.21975,
  `labels_pmargin_top` decimal(6,5) NOT NULL DEFAULT 0.50000,
  `labels_pmargin_bottom` decimal(6,5) NOT NULL DEFAULT 0.50000,
  `labels_display_bgutter` decimal(6,5) NOT NULL DEFAULT 0.07000,
  `labels_display_sgutter` decimal(6,5) NOT NULL DEFAULT 0.05000,
  `labels_fontsize` tinyint(4) NOT NULL DEFAULT 9,
  `labels_pagewidth` decimal(7,5) NOT NULL DEFAULT 8.50000,
  `labels_pageheight` decimal(7,5) NOT NULL DEFAULT 11.00000,
  `labels_display_name` tinyint(4) NOT NULL DEFAULT 0,
  `labels_display_serial` tinyint(4) NOT NULL DEFAULT 1,
  `labels_display_tag` tinyint(4) NOT NULL DEFAULT 1,
  `alt_barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `alt_barcode_enabled` tinyint(1) DEFAULT 1,
  `alert_interval` int(11) DEFAULT 30,
  `alert_threshold` int(11) DEFAULT 5,
  `email_domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'filastname',
  `username_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'filastname',
  `is_ad` tinyint(1) NOT NULL DEFAULT 0,
  `ad_domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_port` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '389',
  `ldap_tls` tinyint(1) NOT NULL DEFAULT 0,
  `zerofill_count` int(11) NOT NULL DEFAULT 5,
  `ldap_pw_sync` tinyint(1) NOT NULL DEFAULT 1,
  `two_factor_enabled` tinyint(4) DEFAULT NULL,
  `require_accept_signature` tinyint(1) NOT NULL DEFAULT 0,
  `date_display_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y-m-d',
  `time_display_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'h:i A',
  `next_auto_tag_base` bigint(20) NOT NULL DEFAULT 1,
  `login_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail_max_h` int(11) DEFAULT 50,
  `pwd_secure_uncommon` tinyint(1) NOT NULL DEFAULT 0,
  `pwd_secure_complexity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pwd_secure_min` int(11) NOT NULL DEFAULT 8,
  `audit_interval` int(11) DEFAULT NULL,
  `audit_warning_days` int(11) DEFAULT NULL,
  `show_url_in_emails` tinyint(1) NOT NULL DEFAULT 0,
  `custom_forgot_pass_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_alerts_in_menu` tinyint(1) NOT NULL DEFAULT 1,
  `labels_display_company_name` tinyint(1) NOT NULL DEFAULT 0,
  `show_archived_in_list` tinyint(1) NOT NULL DEFAULT 0,
  `dashboard_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_footer` char(5) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `footer_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modellist_displays` char(191) COLLATE utf8mb4_unicode_ci DEFAULT 'image,category,manufacturer,model_number',
  `login_remote_user_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `login_common_disabled` tinyint(1) NOT NULL DEFAULT 0,
  `login_remote_user_custom_logout_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `skin` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_images_in_email` tinyint(1) NOT NULL DEFAULT 1,
  `admin_cc_email` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `labels_display_model` tinyint(1) NOT NULL DEFAULT 0,
  `privacy_policy_link` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_footer` char(5) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `unique_serial` tinyint(1) NOT NULL DEFAULT 0,
  `logo_print_assets` tinyint(1) NOT NULL DEFAULT 0,
  `depreciation_method` char(10) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `favicon` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_logo` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label_logo` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_user_skin` tinyint(1) NOT NULL DEFAULT 0,
  `show_assigned_assets` tinyint(1) NOT NULL DEFAULT 0,
  `login_remote_user_header_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ad_append_domain` tinyint(1) NOT NULL DEFAULT 0,
  `saml_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `saml_idp_metadata` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saml_attr_mapping_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saml_forcelogin` tinyint(1) NOT NULL DEFAULT 0,
  `saml_slo` tinyint(1) NOT NULL DEFAULT 0,
  `saml_sp_x509cert` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saml_sp_privatekey` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saml_custom_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saml_sp_x509certNew` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `digit_separator` char(191) COLLATE utf8mb4_unicode_ci DEFAULT '1234.56',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'2021-07-12 05:09:55','2021-08-19 05:52:52',1,20,'ThanhTai',NULL,NULL,NULL,NULL,NULL,1,NULL,1,'setting-logo-Sm2zaQ6GMf.png',NULL,'thiendoanvo@gmail.com',1,NULL,'QRCODE',NULL,NULL,NULL,'vnd',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,'samaccountname','sn','givenname','uid=samaccountname',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'en',30,2.62500,1.00000,0.21975,0.21975,0.50000,0.50000,0.07000,0.05000,9,8.50000,11.00000,0,1,1,'C128',1,30,5,'doanvo@.vn','filastname','filastname',0,NULL,'389',0,8,1,NULL,0,'Y-m-d','h:i A',34,NULL,50,0,NULL,10,NULL,NULL,0,NULL,1,0,0,NULL,'on',NULL,'image,category,manufacturer,model_number',0,0,'','blue',1,NULL,0,NULL,'on',0,0,'default',NULL,NULL,'setting-label_logo-WoiXSevgoW.png',0,0,'',0,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL,'1234.56');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `status_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_labels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deployable` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_in_nav` tinyint(1) NOT NULL DEFAULT 0,
  `default_label` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `status_labels` WRITE;
/*!40000 ALTER TABLE `status_labels` DISABLE KEYS */;
INSERT INTO `status_labels` VALUES (1,'Pending',1,NULL,NULL,NULL,0,1,0,'These assets are not yet ready to be deployed, usually because of configuration or waiting on parts.',NULL,0,0),(2,'Ready to Deploy',1,NULL,NULL,NULL,1,0,0,'These assets are ready to deploy.',NULL,0,0),(3,'Archived',1,NULL,NULL,NULL,0,0,1,'These assets are no longer in circulation or viable.',NULL,0,0);
/*!40000 ALTER TABLE `status_labels` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'NA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-08-19 03:09:28','2021-08-19 03:09:28',1,NULL,NULL,'http://',NULL);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `banned` tinyint(1) NOT NULL DEFAULT 0,
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `throttle_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `throttle` WRITE;
/*!40000 ALTER TABLE `throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `throttle` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT 0,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gravatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jobtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `employee_num` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `remember_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_import` tinyint(1) NOT NULL DEFAULT 0,
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `show_in_list` tinyint(1) NOT NULL DEFAULT 1,
  `two_factor_secret` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_enrolled` tinyint(1) NOT NULL DEFAULT 0,
  `two_factor_optin` tinyint(1) NOT NULL DEFAULT 0,
  `department_id` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_activation_code_index` (`activation_code`),
  KEY `users_reset_password_code_index` (`reset_password_code`),
  KEY `users_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'thiendoanvo@gmail.com','$2y$10$NIgo10uiohvD41srQVEwluanPfVW4b6Pq2Hz4v4Mlzs55gPEFu2.q','{\"superuser\":1}',1,NULL,NULL,'2021-09-12 08:41:50',NULL,NULL,'doan','vo','2021-07-12 05:09:55','2021-09-12 08:41:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'doanvo',NULL,NULL,'Cai7F8LhO83ilLuSwMefFVoCJacMptHTOEohvqJJCBvCIVnvOgWbrjCKXXpT',0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(2,'','$2y$10$goQ/QvPcbc.2XVJy8HGU9uZ7lkcGdPEh0PBxIwAw1h5BRLpeh.zze','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"kits.checkout\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,NULL,NULL,NULL,NULL,NULL,'test','test','2021-07-23 03:09:15','2021-07-23 03:09:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,'$2y$10$noQUO7GGr8eaUU/tAxHIaO.eN0F8j7e.1L5fScJK3cx5VSG47soWq',NULL,0,NULL,NULL,NULL,NULL,NULL,'Đặng Thị Thùy Mỵ',NULL,'2021-08-19 05:11:59','2021-08-19 05:11:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Đặng Thị Thùy Mỵ',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(4,NULL,'$2y$10$UiGT2rmHnCEMkiMiTZyTwO54d/LdPGWXYROYW8tihsdKuSRLseqna',NULL,0,NULL,NULL,NULL,NULL,NULL,'Võ Thị Thơm',NULL,'2021-08-19 05:13:43','2021-08-19 05:13:43',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Võ Thị Thơm',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(5,NULL,'$2y$10$pf2prs3s7YkZeXyBVgSdk.CtXRweCwaCJeDH43bWCdd34sei2NMGe',NULL,0,NULL,NULL,NULL,NULL,NULL,'Võ Thị Bích Hòa',NULL,'2021-08-19 05:15:08','2021-08-19 05:15:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Võ Thị Bích Hòa',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,'$2y$10$a56GMngG1fJg3Npw6EOsIeUGZIKZwcUI45RIZsPgT5nl3vuY1wFFC',NULL,0,NULL,NULL,NULL,NULL,NULL,'Trần Thị Anh Thư',NULL,'2021-08-19 05:16:23','2021-08-19 05:16:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Trần Thị Anh Thư',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,'$2y$10$xgRPdQrOv2K9qDUn8ALkcuOpZRiVN7mvghru3RZShmgzSR0hVg0gG',NULL,0,NULL,NULL,NULL,NULL,NULL,'Nguyễn Trần Hoài Thương',NULL,'2021-08-19 05:18:46','2021-08-19 05:18:46',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Nguyễn Trần Hoài Thương',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(8,NULL,'$2y$10$YEbKfEDnPrQ.5qC0Wsb8u.8iO7U.kc.AtjKrh/F96u9ZnE0JQcPYW',NULL,0,NULL,NULL,NULL,NULL,NULL,'Nguyễn Vũ Hoài Thương',NULL,'2021-08-19 05:20:26','2021-08-19 05:20:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Nguyễn Vũ Hoài Thương',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(9,NULL,'$2y$10$0GLFllcK/A2CFlqdoiO4oORcQnfDpOfoK5TQIQvohvL5wFQAZWBYC',NULL,0,NULL,NULL,NULL,NULL,NULL,'Đỗ Thị Thu Hiền',NULL,'2021-08-19 05:23:03','2021-08-19 05:23:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Đỗ Thị Thu Hiền',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(10,NULL,'$2y$10$CBIvO6BtAOrQ39Wr0qrW3OQWpYJPfVKhg4MQx5T4tEOMF3Eefbnky',NULL,0,NULL,NULL,NULL,NULL,NULL,'Trần Thị Ngọc Trí',NULL,'2021-08-19 05:24:14','2021-08-19 05:24:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Trần Thị Ngọc Trí',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(11,NULL,'$2y$10$jjAc7NmdcBDVOf8j2wuFkuJFRYIRoA0iLEGf4/J8CgqZbmoLTc7GS',NULL,0,NULL,NULL,NULL,NULL,NULL,'Nguyễn Thị Ánh Chi',NULL,'2021-08-19 05:25:26','2021-08-19 05:25:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Nguyễn Thị Ánh Chi',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(12,NULL,'$2y$10$DEJCYClML4w9RUaIrVys2usb.Ny/WG4j5XTfeU/.05/VslR71R5Pm',NULL,0,NULL,NULL,NULL,NULL,NULL,'MS MAI',NULL,'2021-08-19 05:26:52','2021-08-19 05:26:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MS MAI',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(13,NULL,'$2y$10$QffExngYNvWuwmK5CEU1hO82Chytqss1p5hZRikTfLXt4624scOmu',NULL,0,NULL,NULL,NULL,NULL,NULL,'Hoàng Thị Phương',NULL,'2021-08-19 05:28:09','2021-08-19 05:28:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hoàng Thị Phương',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(14,NULL,'$2y$10$yVKH.iUnYXqhuvQxbQ7h0OxNrBkq2AtjQ.piZU.EIdwYrVFWQ.b/u',NULL,0,NULL,NULL,NULL,NULL,NULL,'Hoàng Thị Mỹ Phương',NULL,'2021-08-19 05:29:56','2021-08-19 05:29:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hoàng Thị Mỹ Phương',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(15,NULL,'$2y$10$vLzG6B4ytGfCnInmJRxRw.76lgqofgarHpCWV2Fi97GVkmIQsB3nW',NULL,0,NULL,NULL,NULL,NULL,NULL,'A NA NI',NULL,'2021-08-19 05:31:02','2021-08-19 05:31:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A NA NI',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(16,NULL,'$2y$10$gSs7FSZtJZu3Mphzmu0Uru25G1zMUyRC0md516tyYyppMjn8Ptumm',NULL,0,NULL,NULL,NULL,NULL,NULL,'Nguyễn Đăng Khoa',NULL,'2021-08-19 05:32:14','2021-08-19 05:32:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Nguyễn Đăng Khoa',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(17,NULL,'$2y$10$bKKsOXg/drYX43Sd6GUWduwSy2iIH4/rJRJ5GP7J4PmkNmJ0FMZP.',NULL,0,NULL,NULL,NULL,NULL,NULL,'Trương Thị Thúy',NULL,'2021-08-19 05:33:18','2021-08-19 05:33:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Trương Thị Thúy',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(18,NULL,'$2y$10$S.sifMltFatYTmEGMYUAwOgYABb0TKDqzOIWOdYzLNikg3TeWdJwq',NULL,0,NULL,NULL,NULL,NULL,NULL,'Huỳnh Thị Hoài Phố',NULL,'2021-08-19 05:34:20','2021-08-19 05:34:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Huỳnh Thị Hoài Phố',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(19,NULL,'$2y$10$Qw853LJU5GTaGrNh5kFgfun5s0O.mSgHD1278hXuGx00owJNdPx/q',NULL,0,NULL,NULL,NULL,NULL,NULL,'Trương Thành Dư',NULL,'2021-08-19 05:35:09','2021-08-19 05:35:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Trương Thành Dư',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(20,NULL,'$2y$10$K5E3l1xerl1olcX5SEOPEubXlS.QiuteeGh0n02FYZMnDNsBHgmgC',NULL,0,NULL,NULL,NULL,NULL,NULL,'Nguyễn Thị Trang',NULL,'2021-08-19 05:36:03','2021-08-19 05:36:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Nguyễn Thị Trang',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(21,NULL,'$2y$10$axlDlBnIVj8BrT16AsOTL.VzM6jvg.eyzjACZOaTPKKBQSpZ6kFAi',NULL,0,NULL,NULL,NULL,NULL,NULL,'Nguyễn Thị Thu Hằng',NULL,'2021-08-19 05:36:56','2021-08-19 05:36:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Nguyễn Thị Thu Hằng',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(22,NULL,'$2y$10$79yDRC2pRijNeCPnhmFaju9CEiAxCkrj20GvPOJsbmYzVeMR5KwcS',NULL,0,NULL,NULL,NULL,NULL,NULL,'Trương Thị Thu Hương',NULL,'2021-08-19 05:37:44','2021-08-19 05:37:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Trương Thị Thu Hương',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(23,NULL,'$2y$10$BG0eDGkIw/sNJvJF1tot2eO5Nq89FMPUklzL8caiJoMU9q/XmMTLW',NULL,0,NULL,NULL,NULL,NULL,NULL,'Đặng Thị Mông Thi',NULL,'2021-08-19 05:38:47','2021-08-19 05:38:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Đặng Thị Mông Thi',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(24,NULL,'$2y$10$aby8q9t0AgO8XaBqu3N9Ju7utACEcHk3EJrudNp8LolnrCR/.2JHq',NULL,0,NULL,NULL,NULL,NULL,NULL,'Nguyễn Thị Ny',NULL,'2021-08-19 05:39:36','2021-08-19 05:39:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Nguyễn Thị Ny',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(25,NULL,'$2y$10$FCTMAZ2V6KfRqKcvsK4hD.cXK3YmbC0k3vJsMrJ1utnCMA4LnDFCy',NULL,0,NULL,NULL,NULL,NULL,NULL,'Nguyễn Thị Thúy Loan',NULL,'2021-08-19 05:40:23','2021-08-19 05:40:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Nguyễn Thị Thúy Loan',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(26,NULL,'$2y$10$KVpNqCSJYaLQ4xT2Ez2lceytrvYpB5e45hFnKOGSC3HFpxZYAswGu',NULL,0,NULL,NULL,NULL,NULL,NULL,'Nguyễn Thị Ngọc Bích',NULL,'2021-08-19 05:42:39','2021-08-19 05:42:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Nguyễn Thị Ngọc Bích',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(27,NULL,'$2y$10$9KnArzwR..4aJwD3bvrH0OeMDM4l5oV6B0pPHmnHmZPQ0rVl.xxFC',NULL,0,NULL,NULL,NULL,NULL,NULL,'MR Thảo',NULL,'2021-08-19 05:43:48','2021-08-19 05:43:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MR Thảo',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(28,NULL,'$2y$10$HEN1gQ1yVhRzjzvNt6CE5OPgPAwQBuoYA1AUf5.i/qgmHamCZ8V.u',NULL,0,NULL,NULL,NULL,NULL,NULL,'Lê Thị Thu',NULL,'2021-08-19 05:44:40','2021-08-19 05:44:40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Lê Thị Thu',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(29,NULL,'$2y$10$cNHwQJkM/2vovkLZXIFUWOzQmlW4ONYu0H2WTF4KbwO2ijIgjTRaG',NULL,0,NULL,NULL,NULL,NULL,NULL,'Bùi Thị Thuấn',NULL,'2021-08-19 05:46:16','2021-08-19 05:46:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Bùi Thị Thuấn',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(30,NULL,'$2y$10$8gFhvN.HTtC36Pr3OkPGVuGzQm4qYTSIuwezBoO59nv4CTt0zjcLW',NULL,0,NULL,NULL,NULL,NULL,NULL,'MS Hương',NULL,'2021-08-19 05:47:34','2021-08-19 05:47:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MS Hương',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(31,NULL,'$2y$10$QMBfkm4Os8e4NPe3mezT..i0y5WJ/ZyEVft7DkQ/HI4.UTQ.8On.G',NULL,0,NULL,NULL,NULL,NULL,NULL,'Phan Hoàn Thị thùy',NULL,'2021-08-19 05:48:59','2021-08-19 05:48:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Phan Hoàn Thị thùy',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(32,NULL,'$2y$10$hzzIZ3q1DSkhm/2yeCuO5usCNJ5kBb2XKfnrpovG2Dz0hDBxhpqlC',NULL,0,NULL,NULL,NULL,NULL,NULL,'Trần Thị Lý',NULL,'2021-08-19 05:49:59','2021-08-19 05:49:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Trần Thị Lý',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(33,NULL,'$2y$10$S9O9P9NWEuUIavFCztQjC.pQRFRhGPzAQl4Vs2waZ1C3VSl7Sw2/a',NULL,0,NULL,NULL,NULL,NULL,NULL,'Nguyễn Thị Mai Thảo',NULL,'2021-08-19 05:50:49','2021-08-19 05:50:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Nguyễn Thị Mai Thảo',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(34,NULL,'$2y$10$sw6pgZQv3tNys8TaS4tnQOVgwyq6JoPlKpRdhxz635A7avsX1EMZa',NULL,0,NULL,NULL,NULL,NULL,NULL,'Hồ Thị Nữ',NULL,'2021-08-19 05:51:52','2021-08-19 05:51:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hồ Thị Nữ',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL),(35,NULL,'$2y$10$LP9ih1NGplsTPmzps8ZVpOOkXm9Gk/w5AN1Nobeo1bG7OUtd4xcK6',NULL,0,NULL,NULL,NULL,NULL,NULL,'Nguyễn Thành Danh',NULL,'2021-08-19 05:52:38','2021-08-19 05:52:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Nguyễn Thành Danh',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

