-- MySQL dump 10.13  Distrib 5.5.20, for osx10.6 (i386)
--
-- Host: localhost    Database: bticltd
-- ------------------------------------------------------
-- Server version	5.5.20

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
-- Table structure for table `about_us_employee`
--

DROP TABLE IF EXISTS `about_us_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `about_us_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_type` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '2012-02-14 14:23:43',
  `updated_at` datetime NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT '1',
  `email` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `about_us_employee_ed86249f` (`employee_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_us_employee`
--

LOCK TABLES `about_us_employee` WRITE;
/*!40000 ALTER TABLE `about_us_employee` DISABLE KEYS */;
INSERT INTO `about_us_employee` VALUES (1,'advisor','2012-02-15 11:28:26','2012-02-16 21:44:30','uploads/about_us/images/Princess_Heart.gif',1,''),(2,'director','2012-02-15 11:28:26','2012-02-16 21:45:09','uploads/about_us/images/Orange.gif',1,''),(3,'director','2012-02-15 11:28:26','2012-02-15 13:21:45','uploads/about_us/images/Princess_Heart_1.gif',1,''),(4,'director','2012-02-22 11:56:47','2012-02-22 11:58:36','',1,'');
/*!40000 ALTER TABLE `about_us_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `about_us_employee_translation`
--

DROP TABLE IF EXISTS `about_us_employee_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `about_us_employee_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag_line` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `designation` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `language_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `master_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `about_us_employee_translati_language_code_464e5308791b5f26_uniq` (`language_code`,`master_id`),
  KEY `about_us_employee_translation_11e09408` (`language_code`),
  KEY `about_us_employee_translation_64d805fc` (`master_id`),
  CONSTRAINT `master_id_refs_id_b5b1d60a4a5ca35` FOREIGN KEY (`master_id`) REFERENCES `about_us_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_us_employee_translation`
--

LOCK TABLES `about_us_employee_translation` WRITE;
/*!40000 ALTER TABLE `about_us_employee_translation` DISABLE KEYS */;
INSERT INTO `about_us_employee_translation` VALUES (1,'Mufti Mosaddeq','','','Chief of Advisors','','en',1),(2,'Mawlana Sah Jalal','','','Chairman','','en',2),(3,'েমা: এরশাদুল হক','','','','েমা: এরশাদুল হক েমা: এরশাদুল হক েমা: এরশাদুল হক েমা: এরশাদুল হক','bn',1),(4,'Mr. Ershadul Hoque Sarker','','','Chairman','','en',3),(5,'Md Ershadul Hoque Sarker','','','Director','','en',4);
/*!40000 ALTER TABLE `about_us_employee_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_9af0b65a` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add cache key',8,'add_cachekey'),(23,'Can change cache key',8,'change_cachekey'),(24,'Can delete cache key',8,'delete_cachekey'),(25,'Can add migration history',9,'add_migrationhistory'),(26,'Can change migration history',9,'change_migrationhistory'),(27,'Can delete migration history',9,'delete_migrationhistory'),(28,'Can add kv store',10,'add_kvstore'),(29,'Can change kv store',10,'change_kvstore'),(30,'Can delete kv store',10,'delete_kvstore'),(31,'Can add placeholder',11,'add_placeholder'),(32,'Can change placeholder',11,'change_placeholder'),(33,'Can delete placeholder',11,'delete_placeholder'),(34,'Can add cms plugin',12,'add_cmsplugin'),(35,'Can change cms plugin',12,'change_cmsplugin'),(36,'Can delete cms plugin',12,'delete_cmsplugin'),(37,'Can add page',13,'add_page'),(38,'Can change page',13,'change_page'),(39,'Can delete page',13,'delete_page'),(40,'Can add PageModerator',14,'add_pagemoderator'),(41,'Can change PageModerator',14,'change_pagemoderator'),(42,'Can delete PageModerator',14,'delete_pagemoderator'),(43,'Can add Page moderator state',15,'add_pagemoderatorstate'),(44,'Can change Page moderator state',15,'change_pagemoderatorstate'),(45,'Can delete Page moderator state',15,'delete_pagemoderatorstate'),(46,'Can add Page global permission',16,'add_globalpagepermission'),(47,'Can change Page global permission',16,'change_globalpagepermission'),(48,'Can delete Page global permission',16,'delete_globalpagepermission'),(49,'Can add Page permission',17,'add_pagepermission'),(50,'Can change Page permission',17,'change_pagepermission'),(51,'Can delete Page permission',17,'delete_pagepermission'),(52,'Can add User (page)',18,'add_pageuser'),(53,'Can change User (page)',18,'change_pageuser'),(54,'Can delete User (page)',18,'delete_pageuser'),(55,'Can add User group (page)',19,'add_pageusergroup'),(56,'Can change User group (page)',19,'change_pageusergroup'),(57,'Can delete User group (page)',19,'delete_pageusergroup'),(58,'Can add title',20,'add_title'),(59,'Can change title',20,'change_title'),(60,'Can delete title',20,'delete_title'),(61,'Can add file',21,'add_file'),(62,'Can change file',21,'change_file'),(63,'Can delete file',21,'delete_file'),(64,'Can add google map',22,'add_googlemap'),(65,'Can change google map',22,'change_googlemap'),(66,'Can delete google map',22,'delete_googlemap'),(67,'Can add link',23,'add_link'),(68,'Can change link',23,'change_link'),(69,'Can delete link',23,'delete_link'),(70,'Can add picture',24,'add_picture'),(71,'Can change picture',24,'change_picture'),(72,'Can delete picture',24,'delete_picture'),(73,'Can add text',25,'add_text'),(74,'Can change text',25,'change_text'),(75,'Can delete text',25,'delete_text'),(76,'Can add video',26,'add_video'),(77,'Can change video',26,'change_video'),(78,'Can delete video',26,'delete_video'),(79,'Can add site',27,'add_site'),(80,'Can change site',27,'change_site'),(81,'Can delete site',27,'delete_site'),(82,'Can add news translation',28,'add_newstranslation'),(83,'Can change news translation',28,'change_newstranslation'),(84,'Can delete news translation',28,'delete_newstranslation'),(85,'Can add News',29,'add_news'),(86,'Can change News',29,'change_news'),(87,'Can delete News',29,'delete_news'),(88,'Can add message translation',30,'add_messagetranslation'),(89,'Can change message translation',30,'change_messagetranslation'),(90,'Can delete message translation',30,'delete_messagetranslation'),(91,'Can add Managing Director\'s Message',31,'add_message'),(92,'Can change Managing Director\'s Message',31,'change_message'),(93,'Can delete Managing Director\'s Message',31,'delete_message'),(94,'Can add contact message',32,'add_contactmessage'),(95,'Can change contact message',32,'change_contactmessage'),(96,'Can delete contact message',32,'delete_contactmessage'),(97,'Can add employee translation',33,'add_employeetranslation'),(98,'Can change employee translation',33,'change_employeetranslation'),(99,'Can delete employee translation',33,'delete_employeetranslation'),(100,'Can add Employee',34,'add_employee'),(101,'Can change Employee',34,'change_employee'),(102,'Can delete Employee',34,'delete_employee'),(103,'Can add location translation',35,'add_locationtranslation'),(104,'Can change location translation',35,'change_locationtranslation'),(105,'Can delete location translation',35,'delete_locationtranslation'),(106,'Can add Location',36,'add_location'),(107,'Can change Location',36,'change_location'),(108,'Can delete Location',36,'delete_location'),(109,'Can add branch translation',37,'add_branchtranslation'),(110,'Can change branch translation',37,'change_branchtranslation'),(111,'Can delete branch translation',37,'delete_branchtranslation'),(112,'Can add Branch',38,'add_branch'),(113,'Can change Branch',38,'change_branch'),(114,'Can delete Branch',38,'delete_branch');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'admin','','','ershadul@newscred.com','sha1$f3e2c$85b2c290aa419fec4572e87117c034a82fe00b47',1,1,1,'2012-02-16 11:48:12','2012-02-02 10:19:59');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`),
  CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches_branch`
--

DROP TABLE IF EXISTS `branches_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches_branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL DEFAULT '2012-02-15 19:56:47',
  `updated_at` datetime NOT NULL,
  `location_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `branches_branch_319d859` (`location_id`),
  CONSTRAINT `location_id_refs_id_5e17beacb239adae` FOREIGN KEY (`location_id`) REFERENCES `branches_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches_branch`
--

LOCK TABLES `branches_branch` WRITE;
/*!40000 ALTER TABLE `branches_branch` DISABLE KEYS */;
INSERT INTO `branches_branch` VALUES (1,'2012-02-15 19:58:04','2012-02-15 20:03:35',2,1),(2,'2012-02-15 19:58:04','2012-02-15 20:05:12',2,1),(3,'2012-02-16 12:37:42','2012-02-16 12:43:54',3,1),(4,'2012-02-16 20:35:41','2012-02-16 21:33:11',4,1),(5,'2012-02-16 20:44:57','2012-02-16 20:58:14',4,1),(6,'2012-02-16 21:27:35','2012-02-16 21:36:55',7,1);
/*!40000 ALTER TABLE `branches_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches_branch_translation`
--

DROP TABLE IF EXISTS `branches_branch_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches_branch_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `address` longtext COLLATE utf8_unicode_ci,
  `contact` longtext COLLATE utf8_unicode_ci,
  `language_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `master_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `branches_branch_translation_language_code_28223ad3ddca0ee6_uniq` (`language_code`,`master_id`),
  KEY `branches_branch_translation_11e09408` (`language_code`),
  KEY `branches_branch_translation_64d805fc` (`master_id`),
  CONSTRAINT `master_id_refs_id_2a7f443a77973bc3` FOREIGN KEY (`master_id`) REFERENCES `branches_branch` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches_branch_translation`
--

LOCK TABLES `branches_branch_translation` WRITE;
/*!40000 ALTER TABLE `branches_branch_translation` DISABLE KEYS */;
INSERT INTO `branches_branch_translation` VALUES (1,'Principal Branch','Kaplan, a former ballroom dance instructor and philanthropist who traveled frequently to Africa, is the subject of an HBO documentary entitled \"Her Name Is Zelda.\"','Road: xx\r\nHouse: yy\r\netc.','Kaplan, a former ballroom dance instructor and philanthropist who traveled frequently to Africa, is the subject of an HBO documentary entitled \"Her Name Is Zelda.\"','en',1),(2,'প্রধাণ শাখা','Kaplan, a former ballroom dance instructor and philanthropist who traveled frequently to Africa, is the subject of an HBO documentary entitled \"Her Name Is Zelda.\"','Same Thing\r\nSample THing','Kaplan, a former ballroom dance instructor and philanthropist who traveled frequently to Africa, is the subject of an HBO documentary entitled \"Her Name Is Zelda.\"','bn',1),(3,'Rangpur Branch','Kaplan, a former ballroom dance instructor and philanthropist who traveled frequently to Africa, is the subject of an HBO documentary entitled \"Her Name Is Zelda.\"','','Kaplan, a former ballroom dance instructor and philanthropist who traveled frequently to Africa, is the subject of an HBO documentary entitled \"Her Name Is Zelda.\"','en',2),(4,'রংপুর','Kaplan, a former ballroom dance instructor and philanthropist who traveled frequently to Africa, is the subject of an HBO documentary entitled \"Her Name Is Zelda.\"','Kaplan, a former ballroom','Kaplan, a former ballroom dance instructor and philanthropist who traveled frequently to Africa, is the subject of an HBO documentary entitled \"Her Name Is Zelda.\"','bn',2),(5,'বরুড়া','','Abdul Aziz new market, Barura, Bazar, Comilla','','en',3),(6,'Riad','Probashi kolyan prokolpo','Riad, Soudi Arab','00966000000','en',4),(7,'Riad','riad, suodi arab','','+966 05 00000000000','en',5),(8,'রিয়াদ','','','+৯৬৬ ০৫ ০০০০০০০০০০০','bn',4),(9,'goolbag','','ksa soudi arab','','en',6);
/*!40000 ALTER TABLE `branches_branch_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches_location`
--

DROP TABLE IF EXISTS `branches_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL DEFAULT '2012-02-15 19:56:47',
  `updated_at` datetime NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `branches_location_63f17a16` (`parent_id`),
  CONSTRAINT `parent_id_refs_id_3fd8d8768c3b2dbd` FOREIGN KEY (`parent_id`) REFERENCES `branches_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches_location`
--

LOCK TABLES `branches_location` WRITE;
/*!40000 ALTER TABLE `branches_location` DISABLE KEYS */;
INSERT INTO `branches_location` VALUES (1,'2012-02-15 19:58:04','2012-02-15 19:58:57',NULL,1),(2,'2012-02-15 19:58:04','2012-02-15 19:59:53',1,1),(3,'2012-02-16 12:39:15','2012-02-16 12:42:12',1,1),(4,'2012-02-16 20:37:39','2012-02-16 21:30:46',NULL,2),(5,'2012-02-16 20:37:39','2012-02-16 21:28:53',NULL,1),(6,'2012-02-16 21:27:35','2012-02-16 21:29:43',4,1),(7,'2012-02-16 21:27:35','2012-02-16 21:35:33',6,1);
/*!40000 ALTER TABLE `branches_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches_location_translation`
--

DROP TABLE IF EXISTS `branches_location_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches_location_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `master_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `branches_location_translati_language_code_2047dc50a2b8c467_uniq` (`language_code`,`master_id`),
  KEY `branches_location_translation_11e09408` (`language_code`),
  KEY `branches_location_translation_64d805fc` (`master_id`),
  CONSTRAINT `master_id_refs_id_3eeb1a0a98bc79d` FOREIGN KEY (`master_id`) REFERENCES `branches_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches_location_translation`
--

LOCK TABLES `branches_location_translation` WRITE;
/*!40000 ALTER TABLE `branches_location_translation` DISABLE KEYS */;
INSERT INTO `branches_location_translation` VALUES (1,'Bangladesh','en',1),(2,'বাংলাদেশ','bn',1),(3,'ঢাকা','bn',2),(4,'Dhaka','en',2),(5,'Comilla','en',3),(6,'কুমিল্লা','bn',3),(7,'KSA','en',4),(8,'India','en',5),(9,'ইন্ডিয়া','bn',5),(10,'Zone-1','en',6),(11,'সৌদি আরব','bn',4),(12,'Dammam','en',7);
/*!40000 ALTER TABLE `branches_location_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_cmsplugin`
--

DROP TABLE IF EXISTS `cms_cmsplugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_cmsplugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placeholder_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position` smallint(5) unsigned DEFAULT NULL,
  `language` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `plugin_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_cmsplugin_c1ca2850` (`placeholder_id`),
  KEY `cms_cmsplugin_63f17a16` (`parent_id`),
  KEY `cms_cmsplugin_8a7ac9ab` (`language`),
  KEY `cms_cmsplugin_ad070cd0` (`plugin_type`),
  KEY `cms_cmsplugin_2a8f42e8` (`level`),
  KEY `cms_cmsplugin_42b06ff6` (`lft`),
  KEY `cms_cmsplugin_91543e5a` (`rght`),
  KEY `cms_cmsplugin_efd07f28` (`tree_id`),
  CONSTRAINT `parent_id_refs_id_e0b32a03` FOREIGN KEY (`parent_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `placeholder_id_refs_id_df6bb944` FOREIGN KEY (`placeholder_id`) REFERENCES `cms_placeholder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_cmsplugin`
--

LOCK TABLES `cms_cmsplugin` WRITE;
/*!40000 ALTER TABLE `cms_cmsplugin` DISABLE KEYS */;
INSERT INTO `cms_cmsplugin` VALUES (1,1,NULL,0,'en','TextPlugin','2012-02-14 12:08:28',0,1,2,1),(2,4,NULL,0,'en','TextPlugin','2012-02-14 13:44:28',0,1,2,2),(3,14,NULL,0,'en','TextPlugin','2012-02-16 12:59:35',0,1,2,3),(5,4,NULL,0,'bn','TextPlugin','2012-02-16 20:36:28',0,1,2,5),(6,16,NULL,0,'en','TextPlugin','2012-02-16 21:06:47',0,1,2,6),(7,6,NULL,0,'bn','TextPlugin','2012-02-16 21:24:50',0,1,2,7),(8,18,NULL,0,'en','VideoPlugin','2012-02-16 21:55:48',0,1,2,8),(9,18,NULL,1,'en','PicturePlugin','2012-02-16 21:56:24',0,1,2,9),(10,21,NULL,0,'en','TextPlugin','2012-02-21 02:10:02',0,1,2,10);
/*!40000 ALTER TABLE `cms_cmsplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_globalpagepermission`
--

DROP TABLE IF EXISTS `cms_globalpagepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_globalpagepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `can_change` tinyint(1) NOT NULL,
  `can_add` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `can_change_advanced_settings` tinyint(1) NOT NULL,
  `can_publish` tinyint(1) NOT NULL,
  `can_change_permissions` tinyint(1) NOT NULL,
  `can_move_page` tinyint(1) NOT NULL,
  `can_moderate` tinyint(1) NOT NULL,
  `can_recover_page` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_globalpagepermission_fbfc09f1` (`user_id`),
  KEY `cms_globalpagepermission_bda51c3c` (`group_id`),
  CONSTRAINT `group_id_refs_id_b12278f8` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_f5365069` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_globalpagepermission`
--

LOCK TABLES `cms_globalpagepermission` WRITE;
/*!40000 ALTER TABLE `cms_globalpagepermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_globalpagepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_globalpagepermission_sites`
--

DROP TABLE IF EXISTS `cms_globalpagepermission_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_globalpagepermission_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `globalpagepermission_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `globalpagepermission_id` (`globalpagepermission_id`,`site_id`),
  KEY `cms_globalpagepermission_sites_f5debdc1` (`globalpagepermission_id`),
  KEY `cms_globalpagepermission_sites_6223029` (`site_id`),
  CONSTRAINT `globalpagepermission_id_refs_id_2c730e06` FOREIGN KEY (`globalpagepermission_id`) REFERENCES `cms_globalpagepermission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_globalpagepermission_sites`
--

LOCK TABLES `cms_globalpagepermission_sites` WRITE;
/*!40000 ALTER TABLE `cms_globalpagepermission_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_globalpagepermission_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `changed_by` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `publication_date` datetime DEFAULT NULL,
  `publication_end_date` datetime DEFAULT NULL,
  `in_navigation` tinyint(1) NOT NULL,
  `soft_root` tinyint(1) NOT NULL,
  `reverse_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `navigation_extenders` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` tinyint(1) NOT NULL,
  `template` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `moderator_state` smallint(6) NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `login_required` tinyint(1) NOT NULL,
  `limit_visibility_in_menu` smallint(6) DEFAULT NULL,
  `publisher_is_draft` tinyint(1) NOT NULL,
  `publisher_public_id` int(11) DEFAULT NULL,
  `publisher_state` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `publisher_public_id` (`publisher_public_id`),
  KEY `cms_page_63f17a16` (`parent_id`),
  KEY `cms_page_ee664462` (`publication_date`),
  KEY `cms_page_a221fe64` (`publication_end_date`),
  KEY `cms_page_3c0ea264` (`in_navigation`),
  KEY `cms_page_baa27763` (`soft_root`),
  KEY `cms_page_b56116b` (`reverse_id`),
  KEY `cms_page_d98c6d14` (`navigation_extenders`),
  KEY `cms_page_6223029` (`site_id`),
  KEY `cms_page_2a8f42e8` (`level`),
  KEY `cms_page_42b06ff6` (`lft`),
  KEY `cms_page_91543e5a` (`rght`),
  KEY `cms_page_efd07f28` (`tree_id`),
  KEY `cms_page_c909672f` (`limit_visibility_in_menu`),
  KEY `cms_page_16d2d3fa` (`publisher_is_draft`),
  KEY `cms_page_a0014f5a` (`publisher_state`),
  CONSTRAINT `parent_id_refs_id_653a773` FOREIGN KEY (`parent_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `publisher_public_id_refs_id_653a773` FOREIGN KEY (`publisher_public_id`) REFERENCES `cms_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page`
--

LOCK TABLES `cms_page` WRITE;
/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;
INSERT INTO `cms_page` VALUES (1,'admin','admin',NULL,'2012-02-03 02:32:35','2012-02-03 02:33:00',NULL,1,0,NULL,'',1,'index.html',1,0,0,1,2,1,0,NULL,1,NULL,1),(2,'admin','admin',NULL,'2012-02-09 21:27:04','2012-02-09 21:28:11',NULL,1,0,'about-us','',1,'index.html',1,0,0,1,12,2,0,NULL,1,NULL,1),(3,'admin','admin',NULL,'2012-02-09 21:27:28','2012-02-09 21:28:10',NULL,1,0,'md-messages','',1,'index.html',1,0,0,1,2,5,0,NULL,1,NULL,1),(4,'admin','admin',NULL,'2012-02-09 21:27:50','2012-02-09 21:27:54',NULL,1,0,NULL,'',1,'index.html',1,0,0,1,4,3,0,NULL,1,NULL,1),(5,'admin','admin',NULL,'2012-02-09 21:28:06','2012-02-09 21:28:14',NULL,1,0,NULL,'',1,'index.html',1,0,0,1,12,4,0,NULL,1,NULL,1),(6,'admin','admin',NULL,'2012-02-10 20:45:14','2012-02-10 20:46:18',NULL,1,0,'media-room','',1,'index.html',1,0,0,1,6,6,0,NULL,1,NULL,1),(7,'admin','admin',2,'2012-02-11 12:12:03','2012-02-11 12:12:10',NULL,1,0,NULL,'',1,'about_us/about_us.html',1,0,1,2,3,2,0,NULL,1,NULL,1),(8,'admin','admin',NULL,'2012-02-13 20:11:01','2012-02-13 20:11:10',NULL,0,0,'contact-us','',1,'index.html',1,1,0,1,2,7,0,NULL,1,NULL,1),(9,'admin','admin',2,'2012-02-14 12:14:56','2012-02-14 12:15:00',NULL,1,0,NULL,'',1,'about_us/about_us.html',1,0,1,4,5,2,0,NULL,1,NULL,1),(10,'admin','admin',2,'2012-02-14 12:15:16','2012-02-14 13:44:10',NULL,1,0,NULL,'',1,'about_us/about_us.html',1,0,1,6,7,2,0,NULL,1,NULL,1),(11,'admin','admin',2,'2012-02-14 14:17:19','2012-02-14 14:17:33',NULL,1,0,NULL,'',1,'about_us/about_us.html',1,0,1,8,9,2,0,NULL,1,NULL,1),(12,'admin','admin',2,'2012-02-14 14:29:45','2012-02-14 14:29:56',NULL,1,0,NULL,'',1,'about_us/about_us.html',1,0,1,10,11,2,0,NULL,1,NULL,1),(15,'admin','admin',4,'2012-02-16 12:58:15','2012-02-16 12:58:28',NULL,1,0,NULL,'',1,'flatpage.html',1,0,1,2,3,3,0,NULL,1,NULL,1),(16,'admin','admin',6,'2012-02-16 19:56:51','2012-02-16 19:57:53',NULL,1,0,'news','',1,'news/news_page_layout.html',1,0,1,2,3,6,0,NULL,1,NULL,1),(17,'admin','admin',5,'2012-02-16 21:02:45','2012-02-16 21:02:55',NULL,1,0,NULL,'',1,'INHERIT',1,0,1,2,11,4,0,NULL,1,NULL,1),(18,'admin','admin',17,'2012-02-16 21:04:01','2012-02-16 21:04:30',NULL,1,0,NULL,'',1,'INHERIT',1,0,2,3,4,4,0,NULL,1,NULL,1),(19,'admin','admin',17,'2012-02-16 21:05:10','2012-02-16 21:05:51',NULL,1,0,NULL,'',1,'flatpage.html',1,0,2,5,10,4,0,NULL,1,NULL,1),(20,'admin','admin',6,'2012-02-16 21:39:51','2012-02-16 21:40:12',NULL,1,0,NULL,'',1,'news/news_page_layout.html',1,0,1,4,5,6,0,NULL,1,NULL,1),(21,'admin','admin',19,'2012-02-21 01:55:05','2012-02-21 01:55:12',NULL,1,0,NULL,'',1,'INHERIT',1,0,3,6,7,4,0,NULL,1,NULL,1),(22,'admin','admin',19,'2012-02-21 01:55:25','2012-02-21 01:55:34',NULL,1,0,NULL,'',1,'two_column_flatpage.html',1,0,3,8,9,4,0,NULL,1,NULL,1);
/*!40000 ALTER TABLE `cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_placeholders`
--

DROP TABLE IF EXISTS `cms_page_placeholders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_placeholders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `placeholder_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_id` (`page_id`,`placeholder_id`),
  KEY `cms_page_placeholders_32d04bc7` (`page_id`),
  KEY `cms_page_placeholders_c1ca2850` (`placeholder_id`),
  CONSTRAINT `page_id_refs_id_b22baae5` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `placeholder_id_refs_id_b0df4960` FOREIGN KEY (`placeholder_id`) REFERENCES `cms_placeholder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_placeholders`
--

LOCK TABLES `cms_page_placeholders` WRITE;
/*!40000 ALTER TABLE `cms_page_placeholders` DISABLE KEYS */;
INSERT INTO `cms_page_placeholders` VALUES (1,7,1),(4,7,4),(5,7,5),(2,9,2),(6,9,6),(7,9,7),(3,10,3),(8,10,8),(9,10,9),(10,11,10),(11,11,11),(12,12,12),(13,12,13),(14,15,14),(15,16,15),(22,16,22),(23,16,23),(16,19,16),(17,20,17),(18,20,18),(19,20,19),(20,21,20),(21,22,21);
/*!40000 ALTER TABLE `cms_page_placeholders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pagemoderator`
--

DROP TABLE IF EXISTS `cms_pagemoderator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pagemoderator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `moderate_page` tinyint(1) NOT NULL,
  `moderate_children` tinyint(1) NOT NULL,
  `moderate_descendants` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_pagemoderator_32d04bc7` (`page_id`),
  KEY `cms_pagemoderator_fbfc09f1` (`user_id`),
  CONSTRAINT `page_id_refs_id_92bc8605` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `user_id_refs_id_c574e281` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pagemoderator`
--

LOCK TABLES `cms_pagemoderator` WRITE;
/*!40000 ALTER TABLE `cms_pagemoderator` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pagemoderator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pagemoderatorstate`
--

DROP TABLE IF EXISTS `cms_pagemoderatorstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pagemoderatorstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `action` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_pagemoderatorstate_32d04bc7` (`page_id`),
  KEY `cms_pagemoderatorstate_fbfc09f1` (`user_id`),
  CONSTRAINT `page_id_refs_id_f4dc9e9d` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `user_id_refs_id_2808fb19` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pagemoderatorstate`
--

LOCK TABLES `cms_pagemoderatorstate` WRITE;
/*!40000 ALTER TABLE `cms_pagemoderatorstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pagemoderatorstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pagepermission`
--

DROP TABLE IF EXISTS `cms_pagepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pagepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `can_change` tinyint(1) NOT NULL,
  `can_add` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `can_change_advanced_settings` tinyint(1) NOT NULL,
  `can_publish` tinyint(1) NOT NULL,
  `can_change_permissions` tinyint(1) NOT NULL,
  `can_move_page` tinyint(1) NOT NULL,
  `can_moderate` tinyint(1) NOT NULL,
  `grant_on` int(11) NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_pagepermission_fbfc09f1` (`user_id`),
  KEY `cms_pagepermission_bda51c3c` (`group_id`),
  KEY `cms_pagepermission_32d04bc7` (`page_id`),
  CONSTRAINT `group_id_refs_id_d3639033` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `page_id_refs_id_d31a36ca` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `user_id_refs_id_4f0ab76c` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pagepermission`
--

LOCK TABLES `cms_pagepermission` WRITE;
/*!40000 ALTER TABLE `cms_pagepermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pagepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pageuser`
--

DROP TABLE IF EXISTS `cms_pageuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pageuser` (
  `user_ptr_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`user_ptr_id`),
  KEY `cms_pageuser_b5de30be` (`created_by_id`),
  CONSTRAINT `created_by_id_refs_id_16b8b1ea` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_ptr_id_refs_id_16b8b1ea` FOREIGN KEY (`user_ptr_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pageuser`
--

LOCK TABLES `cms_pageuser` WRITE;
/*!40000 ALTER TABLE `cms_pageuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pageuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pageusergroup`
--

DROP TABLE IF EXISTS `cms_pageusergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pageusergroup` (
  `group_ptr_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`group_ptr_id`),
  KEY `cms_pageusergroup_b5de30be` (`created_by_id`),
  CONSTRAINT `created_by_id_refs_id_3dc63396` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_ptr_id_refs_id_99e5e357` FOREIGN KEY (`group_ptr_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pageusergroup`
--

LOCK TABLES `cms_pageusergroup` WRITE;
/*!40000 ALTER TABLE `cms_pageusergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pageusergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_placeholder`
--

DROP TABLE IF EXISTS `cms_placeholder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_placeholder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slot` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `default_width` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_placeholder_400badfd` (`slot`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_placeholder`
--

LOCK TABLES `cms_placeholder` WRITE;
/*!40000 ALTER TABLE `cms_placeholder` DISABLE KEYS */;
INSERT INTO `cms_placeholder` VALUES (1,'page_content',NULL),(2,'page_content',NULL),(3,'page_content',NULL),(4,'main_column_content',NULL),(5,'sidebar_content',NULL),(6,'main_column_content',NULL),(7,'sidebar_content',NULL),(8,'main_column_content',NULL),(9,'sidebar_content',NULL),(10,'main_column_content',NULL),(11,'sidebar_content',NULL),(12,'main_column_content',NULL),(13,'sidebar_content',NULL),(14,'page_content',NULL),(15,'page_content',NULL),(16,'page_content',NULL),(17,'page_content',NULL),(18,'main_column_content',NULL),(19,'sidebar_content',NULL),(20,'page_content',NULL),(21,'page_content',NULL),(22,'main_column_content',NULL),(23,'sidebar_content',NULL);
/*!40000 ALTER TABLE `cms_placeholder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_title`
--

DROP TABLE IF EXISTS `cms_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menu_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `has_url_overwrite` tinyint(1) NOT NULL,
  `application_urls` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8_unicode_ci,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language` (`language`,`page_id`),
  KEY `cms_title_8a7ac9ab` (`language`),
  KEY `cms_title_a951d5d6` (`slug`),
  KEY `cms_title_6a8a34e2` (`path`),
  KEY `cms_title_c269b1d2` (`has_url_overwrite`),
  KEY `cms_title_23b1fc68` (`application_urls`),
  KEY `cms_title_32d04bc7` (`page_id`),
  CONSTRAINT `page_id_refs_id_fc98665f` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_title`
--

LOCK TABLES `cms_title` WRITE;
/*!40000 ALTER TABLE `cms_title` DISABLE KEYS */;
INSERT INTO `cms_title` VALUES (1,'en','Home','','home','home',0,'','','','','',1,'2012-02-03 02:32:35'),(2,'en','About Us','','about-us','about-us',0,'','','','','',2,'2012-02-09 21:27:04'),(3,'en','Messages From MD','','messages-md','messages-md',0,'MDMessageApp','','','','',3,'2012-02-09 21:27:28'),(4,'en','Syster Concerns','','syster-concerns','syster-concerns',0,'','','','','',4,'2012-02-09 21:27:50'),(5,'en','Branches','','branches','branches',0,'BranchApp','','','','',5,'2012-02-09 21:28:06'),(6,'bd','হোম','','home','home',0,'','','','','',1,'2012-02-09 21:37:09'),(7,'bd','সহযোগী প্রতিষ্ঠানসমূহ','','syster-concerns','syster-concerns',0,'','','','','',4,'2012-02-10 09:38:13'),(8,'bd','অামাদের সম্পকের্','','about-us','about-us',0,'','','','','',2,'2012-02-10 20:41:11'),(9,'bd','এমডি বাতর্া','','messages-md','messages-md',0,'','','','','',3,'2012-02-10 20:44:09'),(10,'bd','শাখা অফিস','','branches','branches',0,'','','','','',5,'2012-02-10 20:44:37'),(11,'en','Media Room','','media-room','media-room',0,'','','','','',6,'2012-02-10 20:45:14'),(12,'bd','খবর','','news','news',0,'','','','','',6,'2012-02-10 20:49:37'),(13,'bn','হোম','','home','home',0,'','','','','',1,'2012-02-10 21:10:50'),(14,'bn','আমাদের সম্পর্কে','','about-us','about-us',0,'','','','','',2,'2012-02-10 21:11:10'),(15,'bn','এমডি বার্তা','','messages-md','messages-md',0,'MDMessageApp','','','','',3,'2012-02-10 21:11:30'),(16,'bn','সহযোগী প্রতিষ্ঠান','','sister-concerns','sister-concerns',0,'','','','','',4,'2012-02-10 21:11:52'),(17,'bn','শাখা অফিস','','branches','branches',0,'','','','','',5,'2012-02-10 21:12:09'),(18,'bn','মিডিয়া রুম','','media-room','media-room',0,'','','','','',6,'2012-02-10 21:12:32'),(19,'en','Legal Information','','legal-information','about-us/legal-information',0,'','','','','',7,'2012-02-11 12:12:03'),(20,'en','Contact Us','','contact-us','contact-us',0,'ContactsApp','','','','',8,'2012-02-13 20:11:01'),(21,'en','Mission & Vision','','mission-vision','about-us/mission-vision',0,'','','','','',9,'2012-02-14 12:14:56'),(22,'en','Our Purposes','','our-purposes','about-us/our-purposes',0,'','','','','',10,'2012-02-14 12:15:16'),(23,'en','Advisors','','advisors','about-us/advisors',0,'AdvisorApp','','','','',11,'2012-02-14 14:17:19'),(24,'en','Directors','','directors','about-us/directors',0,'DirectorApp','','','','',12,'2012-02-14 14:29:45'),(27,'en','www','','www','syster-concerns/www',0,'','','','','',15,'2012-02-16 12:58:15'),(28,'en','News & Events','','news','media-room/news',0,'NewsApp','','','','',16,'2012-02-16 19:56:51'),(29,'bn','খবর','','news-events','media-room/news-events',0,'NewsApp','','','','',16,'2012-02-16 19:57:53'),(30,'bn','আইনগত তথ্য','','legal-information','about-us/legal-information',0,'','','','','',7,'2012-02-16 20:01:17'),(31,'bn','লক্ষ্য ও উদ্দেশ্য','','mission-vision','about-us/mission-vision',0,'','','','','',9,'2012-02-16 20:04:34'),(32,'bn','Bangladesh',NULL,'bangladesh','branches/bangladesh',0,NULL,NULL,NULL,NULL,NULL,17,'2012-02-16 21:02:45'),(33,'en','Bangadesh','','bangadesh','branches/bangadesh',0,'','','','','',17,'2012-02-16 21:02:55'),(34,'en','Corporate Office','','corporate-office','branches/bangadesh/corporate-office',0,'','','','','',18,'2012-02-16 21:04:01'),(35,'bn','Corporate Office','','corporate-office','branches/bangladesh/corporate-office',0,'','','','','',18,'2012-02-16 21:04:39'),(36,'en','Zone 1','','zone-1','branches/bangadesh/zone-1',0,'','','','','',19,'2012-02-16 21:05:10'),(37,'bn','Zone 1','','zone-1','branches/bangladesh/zone-1',0,'','','','','',19,'2012-02-16 21:06:01'),(38,'en','Downloads','','downloads','media-room/downloads',0,'','','','','',20,'2012-02-16 21:39:51'),(39,'en','District 1',NULL,'district-1','branches/bangadesh/zone-1/district-1',0,NULL,NULL,NULL,NULL,NULL,21,'2012-02-21 01:55:06'),(40,'en','Regional','','regional','branches/bangadesh/zone-1/regional',0,'','','','','',22,'2012-02-21 01:55:25'),(41,'bn','ডাউনলোড','','downloads','media-room/downloads',0,'','','','','',20,'2012-02-21 02:16:49');
/*!40000 ALTER TABLE `cms_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmsplugin_file`
--

DROP TABLE IF EXISTS `cmsplugin_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_file` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `file` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_c294683f` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_file`
--

LOCK TABLES `cmsplugin_file` WRITE;
/*!40000 ALTER TABLE `cmsplugin_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmsplugin_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmsplugin_googlemap`
--

DROP TABLE IF EXISTS `cmsplugin_googlemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_googlemap` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zoom` int(11) DEFAULT NULL,
  `lat` decimal(10,6) DEFAULT NULL,
  `lng` decimal(10,6) DEFAULT NULL,
  `route_planer_title` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route_planer` tinyint(1) NOT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_7f24597b` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_googlemap`
--

LOCK TABLES `cmsplugin_googlemap` WRITE;
/*!40000 ALTER TABLE `cmsplugin_googlemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmsplugin_googlemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmsplugin_link`
--

DROP TABLE IF EXISTS `cmsplugin_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_link` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_link_id` int(11) DEFAULT NULL,
  `mailto` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cmsplugin_link_37c07cc5` (`page_link_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_617f46c9` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `page_link_id_refs_id_63526ef3` FOREIGN KEY (`page_link_id`) REFERENCES `cms_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_link`
--

LOCK TABLES `cmsplugin_link` WRITE;
/*!40000 ALTER TABLE `cmsplugin_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmsplugin_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmsplugin_picture`
--

DROP TABLE IF EXISTS `cmsplugin_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_picture` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_link_id` int(11) DEFAULT NULL,
  `alt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longdesc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `float` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cmsplugin_picture_37c07cc5` (`page_link_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_c0f14a14` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `page_link_id_refs_id_74758dc2` FOREIGN KEY (`page_link_id`) REFERENCES `cms_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_picture`
--

LOCK TABLES `cmsplugin_picture` WRITE;
/*!40000 ALTER TABLE `cmsplugin_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmsplugin_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmsplugin_text`
--

DROP TABLE IF EXISTS `cmsplugin_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_text` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `cmsplugin_ptr_id` (`cmsplugin_ptr_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_175e936e` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_text`
--

LOCK TABLES `cmsplugin_text` WRITE;
/*!40000 ALTER TABLE `cmsplugin_text` DISABLE KEYS */;
INSERT INTO `cmsplugin_text` VALUES (1,'I am testing BTIC LTd.'),(2,'<p><span>WASHINGTON &mdash;&nbsp;</span><a class=\"meta-per\" title=\"More articles about Barack Obama.\" href=\"http://topics.nytimes.com/top/reference/timestopics/people/o/barack_obama/index.html?inline=nyt-per\">President Obama</a><span>&nbsp;on Tuesday welcomed signs of progress in extending a&nbsp;</span><a class=\"meta-classifier\" title=\"More articles about the federal budget.\" href=\"http://topics.nytimes.com/top/reference/timestopics/subjects/f/federal_budget_us/index.html?inline=nyt-classifier\">payroll tax</a><span>&nbsp;cut but urged Americans to continue to press their Congressional representatives to quickly approve the tax break before it expires at the end of the month.</span></p>\r\n<p>&nbsp;</p>\r\n<p>The Republican move leaves up in the air the fate of added jobless benefits that were being negotiated along with the payroll tax holiday. Mr. Obama called on Congress to approve the added jobless pay along with the tax cut.</p>\r\n<p>&ldquo;Congress needs to extend that tax cut along with vital insurance lifelines for folks who have lost their jobs during this&nbsp;<a class=\"meta-classifier\" title=\"More articles about the recession.\" href=\"http://topics.nytimes.com/top/reference/timestopics/subjects/r/recession_and_depression/index.html?inline=nyt-classifier\">recession</a>, and they need to do it now, without drama and without delay, no ideological sideshows to gum up the works, no self-inflicted wounds,&rdquo; he said. &ldquo;Just pass this middle-class tax cut. Pass the extension of unemployment insurance. Do it before it&rsquo;s too late, and I will sign it right away.&rdquo;</p>\r\n<p>The Republican change in strategy came after months of partisan confrontation. In essence, Congressional Republicans backed down from their demand that the rollback be paid for with reductions in other programs, which clears the way for an extension of the tax cut for 160 million Americans through 2012.</p>\r\n<p>Republicans suddenly offered to extend the two-percentage-point cut while continuing to haggle over added unemployment benefits and a measure to prevent a drop in fees paid to doctors by&nbsp;<a class=\"meta-classifier\" title=\"Recent and archival health news about Medicare.\" href=\"http://topics.nytimes.com/top/news/health/diseasesconditionsandhealthtopics/medicare/index.html?inline=nyt-classifier\">Medicare</a>. The payroll tax holiday and jobless benefits expire at month&rsquo;s end, and doctors would face a 27 percent reduction in Medicare reimbursements</p>\r\n<p><span><br /></span></p>'),(3,'Bangladesh'),(5,'গভঃ রেজিঃ নং-সি-৮৫২২২/১০'),(7,'<div class=\"box\" style=\"text-align: justify;\">\r\n<h3>আমাদের লক্ষ্য</h3>\r\n<ul class=\"list padding-10\">\r\n<li>সকলের মাঝে ঐক্য ও সম্প্রীতি সৃষ্টি করা।</li>\r\n<li>পূজিঁ, মেধা ও শ্রম এ তিনটির সমন্বয় ঘটানোর মাধ্যমে অর্থনৈতিক উন্নতি সাধন</li>\r\n<li>বেকার যুব সমাজের কর্মসংস্থানের ব্যবস্থা গ্রহণ</li>\r\n<li>সমাজের প্রতিটি মুসলমানের হালাল রুজি কামাই করতে সহযোগিতা প্রদান</li>\r\n<li>দূর্ণীতি, সুদ, ঘুষ ও যৌতুকের বিরুদ্ধে সামাজিক ঐক্য গড়ে তোলা</li>\r\n<li style=\"text-align: justify;\">শিল্প, কল-কারখানা প্রতিষ্ঠার মাধ্যমে মানসম্পন্ন পণ্যের বিকাশ ঘটানো</li>\r\n<li>আকর্ষণীয় ও আধুনিক পদ্ধতিতে পণ্য বাজারজাত করার মাধ্যমে অধিকতর উন্নত সেবা প্রদান</li>\r\n<li>লাভজনক খাতে বিনিয়োগ করে সকলকে সাবলম্বি করে গড়ে তোলা</li>\r\n<li>স্বতঃস্ফুর্ত সহযোগিতার মাধ্যমে দরিদ্র, শিশু, মহিলা ও আর্ত-মানবতার সেবা প্রদানের মাধ্যমে সামাজিক দায়িত্ব পালন</li>\r\n<li>সকল কাজ ও ব্যবস্থাপনায় দেশ ও জাতির উন্নতি ও সমৃদ্ধির প্রচেষ্টা</li>\r\n</ul>\r\n</div>'),(10,'Dhaka Branch');
/*!40000 ALTER TABLE `cmsplugin_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmsplugin_video`
--

DROP TABLE IF EXISTS `cmsplugin_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_video` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `movie` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `movie_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` smallint(5) unsigned NOT NULL,
  `height` smallint(5) unsigned NOT NULL,
  `auto_play` tinyint(1) NOT NULL,
  `auto_hide` tinyint(1) NOT NULL,
  `fullscreen` tinyint(1) NOT NULL,
  `loop` tinyint(1) NOT NULL,
  `bgcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `textcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `seekbarcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `seekbarbgcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `loadingbarcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `buttonoutcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `buttonovercolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `buttonhighlightcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_2ac6d963` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_video`
--

LOCK TABLES `cmsplugin_video` WRITE;
/*!40000 ALTER TABLE `cmsplugin_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmsplugin_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_contactmessage`
--

DROP TABLE IF EXISTS `contacts_contactmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_contactmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_contactmessage`
--

LOCK TABLES `contacts_contactmessage` WRITE;
/*!40000 ALTER TABLE `contacts_contactmessage` DISABLE KEYS */;
INSERT INTO `contacts_contactmessage` VALUES (1,'NewsCred Inc.','ershadulhoque@gmail.com','','dfdf',0,'2012-02-13 20:30:37','2012-02-13 20:30:37'),(2,'Md Ershadul Sarker','ershadulhoque@gmail.com','Kuwaitnet','This is a test',0,'2012-02-13 20:32:09','2012-02-13 20:32:09'),(3,'gazi monir','gazimonr@bticltd.com','btic','welcom',0,'2012-02-16 19:42:34','2012-02-16 19:42:34'),(4,'gazi monir','gazimonr@bticltd.com','btic','welcom',0,'2012-02-16 19:45:06','2012-02-16 19:45:06');
/*!40000 ALTER TABLE `contacts_contactmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2012-02-03 02:32:35',1,13,'1','Home',1,''),(2,'2012-02-03 02:33:01',1,13,'1','Home',2,'Changed published, in_navigation and moderator_state.'),(3,'2012-02-09 21:27:04',1,13,'2','About Us',1,''),(4,'2012-02-09 21:27:28',1,13,'3','Messages From MD',1,''),(5,'2012-02-09 21:27:50',1,13,'4','Syster Concerns',1,''),(6,'2012-02-09 21:27:54',1,13,'4','Syster Concerns',2,'Changed published, in_navigation and moderator_state.'),(7,'2012-02-09 21:28:06',1,13,'5','Branches',1,''),(8,'2012-02-09 21:37:09',1,13,'1','Home',2,'Changed title, slug, language and moderator_state.'),(9,'2012-02-10 09:38:13',1,13,'4','Syster Concerns',2,'Changed title, slug, language and moderator_state.'),(10,'2012-02-10 20:41:11',1,13,'2','About Us',2,'Changed title, slug, language and moderator_state.'),(11,'2012-02-10 20:44:09',1,13,'3','Messages From MD',2,'Changed title, slug, language and moderator_state.'),(12,'2012-02-10 20:44:37',1,13,'5','Branches',2,'Changed title, slug, language and moderator_state.'),(13,'2012-02-10 20:45:14',1,13,'6','News & Events',1,''),(14,'2012-02-10 20:49:37',1,13,'6','News & Events',2,'Changed title, slug, language and moderator_state.'),(15,'2012-02-10 21:10:50',1,13,'1','Home',2,'Changed title, slug, language and moderator_state.'),(16,'2012-02-10 21:11:10',1,13,'2','About Us',2,'Changed title, slug, language and moderator_state.'),(17,'2012-02-10 21:11:30',1,13,'3','Messages From MD',2,'Changed title, slug, language and moderator_state.'),(18,'2012-02-10 21:11:52',1,13,'4','Syster Concerns',2,'Changed title, slug, language and moderator_state.'),(19,'2012-02-10 21:12:09',1,13,'5','Branches',2,'Changed title, slug, language and moderator_state.'),(20,'2012-02-10 21:12:32',1,13,'6','News & Events',2,'Changed title, slug, language and moderator_state.'),(21,'2012-02-10 23:26:12',1,29,'1','This is a new, very interesting new ',1,''),(22,'2012-02-10 23:26:17',1,29,'1','This is a new, very interesting new ',2,'is_published এবং show_on_homepage পরিবর্তিত হয়েছে।'),(23,'2012-02-10 23:27:18',1,13,'6','খবর',2,'application_urls এবং moderator_state পরিবর্তিত হয়েছে।'),(24,'2012-02-10 23:38:47',1,13,'6','News & Events',2,'Changed application_urls and moderator_state.'),(25,'2012-02-11 00:44:09',1,29,'1','This is a new, very interesting new ',2,'Changed image_url.'),(26,'2012-02-11 00:45:09',1,29,'1','This is a new, very interesting new ',2,'No fields changed.'),(27,'2012-02-11 03:45:33',1,29,'2','Welcome to our world',1,''),(28,'2012-02-11 04:17:13',1,29,'2','Welcome to our world',2,'Changed image.'),(29,'2012-02-11 04:21:56',1,29,'2','Welcome to our world',2,'Changed image.'),(30,'2012-02-11 11:06:02',1,13,'6','News & Events',2,'Changed reverse_id and moderator_state.'),(31,'2012-02-11 11:18:48',1,29,'2','Welcome to our world',2,'Changed video_url.'),(32,'2012-02-11 12:12:03',1,13,'7','Legal Information',1,''),(33,'2012-02-13 07:10:58',1,13,'3','Messages From MD',2,'Changed reverse_id, application_urls and moderator_state.'),(34,'2012-02-13 07:12:45',1,31,'1','I am testing it . ',1,''),(35,'2012-02-13 07:23:33',1,13,'3','Messages From MD',2,'Changed moderator_state.'),(36,'2012-02-13 07:23:46',1,13,'3','এমডি বাতর্া',2,'Changed application_urls, language and moderator_state.'),(37,'2012-02-13 07:32:11',1,31,'2','THis is very interesting. ',1,''),(38,'2012-02-13 20:10:12',1,13,'2','About Us',2,'Changed application_urls and moderator_state.'),(39,'2012-02-13 20:10:48',1,13,'2','About Us',2,'Changed application_urls and moderator_state.'),(40,'2012-02-13 20:11:01',1,13,'8','Contact Us',1,''),(41,'2012-02-13 20:11:10',1,13,'8','Contact Us',2,'Changed published, in_navigation, application_urls and moderator_state.'),(42,'2012-02-14 12:08:01',1,13,'7','Legal Information',2,'Changed template and moderator_state.'),(43,'2012-02-14 12:09:55',1,13,'7','Legal Information',2,'Changed moderator_state.'),(44,'2012-02-14 12:14:56',1,13,'9','Mission & Vision',1,''),(45,'2012-02-14 12:15:16',1,13,'10','Our Purposes',1,''),(46,'2012-02-14 12:29:52',1,13,'7','Legal Information',2,'Changed template and moderator_state.'),(47,'2012-02-14 13:42:12',1,13,'7','Legal Information',2,'Changed template and moderator_state.'),(48,'2012-02-14 13:42:19',1,13,'9','Mission & Vision',2,'Changed template and moderator_state.'),(49,'2012-02-14 13:42:26',1,13,'10','Our Purposes',2,'Changed template and moderator_state.'),(50,'2012-02-14 13:42:38',1,13,'2','About Us',2,'Changed reverse_id and moderator_state.'),(51,'2012-02-14 13:47:33',1,13,'7','Legal Information',2,'Changed moderator_state.'),(52,'2012-02-14 14:17:19',1,13,'11','Advisors',1,''),(53,'2012-02-14 14:17:33',1,13,'11','Advisors',2,'Changed published, in_navigation and moderator_state.'),(54,'2012-02-14 14:19:34',1,13,'7','Legal Information',2,'Changed template and moderator_state.'),(55,'2012-02-14 14:19:41',1,13,'9','Mission & Vision',2,'Changed template and moderator_state.'),(56,'2012-02-14 14:19:48',1,13,'10','Our Purposes',2,'Changed template and moderator_state.'),(57,'2012-02-14 14:20:00',1,13,'11','Advisors',2,'Changed template and moderator_state.'),(58,'2012-02-14 14:22:42',1,13,'7','Legal Information',2,'Changed template and moderator_state.'),(59,'2012-02-14 14:22:48',1,13,'9','Mission & Vision',2,'Changed template and moderator_state.'),(60,'2012-02-14 14:22:54',1,13,'10','Our Purposes',2,'Changed template and moderator_state.'),(61,'2012-02-14 14:23:06',1,13,'11','Advisors',2,'Changed template and moderator_state.'),(62,'2012-02-14 14:24:29',1,13,'11','Advisors',2,'Changed application_urls and moderator_state.'),(63,'2012-02-14 14:29:45',1,13,'12','Directors',1,''),(64,'2012-02-14 14:29:51',1,13,'12','Directors',2,'Changed application_urls and moderator_state.'),(65,'2012-02-15 11:56:31',1,34,'1','Mr. Ershadul Hoque Sarker',1,''),(66,'2012-02-15 11:57:28',1,34,'2','Md Ershadul Hoque Sarker',1,''),(67,'2012-02-15 13:07:17',1,34,'1','েমা: এরশাদুল হক',2,'Changed image, description and name.'),(68,'2012-02-15 13:21:45',1,34,'3','Mr. Ershadul Hoque Sarker',1,''),(69,'2012-02-15 19:58:37',1,36,'1','Bangladesh',1,''),(70,'2012-02-15 19:58:57',1,36,'1','বাংলাদেশ',2,'Changed name.'),(71,'2012-02-15 19:59:13',1,36,'2','ঢাকা',1,''),(72,'2012-02-15 19:59:26',1,36,'2','Dhaka',2,'Changed name.'),(73,'2012-02-15 19:59:53',1,36,'2','Bangladesh :: Dhaka',2,'Changed parent.'),(74,'2012-02-15 20:02:43',1,38,'1','Principal Branch',1,''),(75,'2012-02-15 20:03:35',1,38,'1','প্রধাণ শাখা',2,'Changed address, name, contact and description.'),(76,'2012-02-15 20:04:36',1,38,'2','Rangpur Branch',1,''),(77,'2012-02-15 20:05:12',1,38,'2','রংপুর',2,'Changed address, name, contact and description.'),(78,'2012-02-15 20:09:48',1,13,'5','Branches',2,'Changed application_urls and moderator_state.'),(79,'2012-02-16 11:31:34',1,29,'2','সুখবর',2,'Changed description and title.'),(80,'2012-02-16 11:34:24',1,29,'2','সুখবর',2,'description পরিবর্তিত হয়েছে।'),(81,'2012-02-16 11:38:10',1,2,'1','gazimonir',1,''),(82,'2012-02-16 11:38:31',1,2,'1','gazimonir',3,''),(83,'2012-02-16 11:40:25',1,29,'2','সুখবর',2,'description পরিবর্তিত হয়েছে।'),(84,'2012-02-16 11:55:44',1,29,'1','স্বগতম',2,'description এবং title পরিবর্তিত হয়েছে।'),(85,'2012-02-16 11:59:50',1,29,'1','স্বগতম',2,'image এবং image_url পরিবর্তিত হয়েছে।'),(86,'2012-02-16 12:03:23',1,29,'3','ইউরোপকে অর্থনৈতিক সাহায্য দেবে চীন',1,''),(87,'2012-02-16 12:03:23',1,29,'4','ইউরোপকে অর্থনৈতিক সাহায্য দেবে চীন',1,''),(88,'2012-02-16 12:04:10',1,29,'3','ইউরোপকে অর্থনৈতিক সাহায্য দেবে চীন',3,''),(89,'2012-02-16 12:04:50',1,29,'4','ইউরোপকে অর্থনৈতিক সাহায্য দেবে চীন',2,'description পরিবর্তিত হয়েছে।'),(90,'2012-02-16 12:05:23',1,29,'4','ইউরোপকে অর্থনৈতিক সাহায্য দেবে চীন',2,'description এবং title পরিবর্তিত হয়েছে।'),(91,'2012-02-16 12:09:05',1,29,'4','ইউরোপকে অর্থনৈতিক সাহায্য দেবে চীন',2,'description পরিবর্তিত হয়েছে।'),(92,'2012-02-16 12:16:57',1,29,'2','সুখবর',2,'image, video_url এবং description পরিবর্তিত হয়েছে।'),(93,'2012-02-16 12:19:01',1,29,'5','ভিডিও',1,''),(94,'2012-02-16 12:20:09',1,29,'5','',2,'is_published এবং show_on_homepage পরিবর্তিত হয়েছে।'),(95,'2012-02-16 12:21:15',1,29,'5','',2,'কোন ফিল্ড পরিবর্তন হয়নি।'),(96,'2012-02-16 12:21:28',1,29,'5','ভিডিও',2,'কোন ফিল্ড পরিবর্তন হয়নি।'),(97,'2012-02-16 12:22:55',1,29,'5','ভিডিও',2,'image পরিবর্তিত হয়েছে।'),(98,'2012-02-16 12:25:02',1,29,'5','ভিডিও',2,'কোন ফিল্ড পরিবর্তন হয়নি।'),(99,'2012-02-16 12:33:36',1,29,'5','',2,'কোন ফিল্ড পরিবর্তন হয়নি।'),(100,'2012-02-16 12:37:01',1,31,'3','অভিনন্দন',1,''),(101,'2012-02-16 12:41:49',1,36,'3','Bangladesh :: কুমিল্লা',1,''),(102,'2012-02-16 12:42:00',1,36,'3','বাংলাদেশ :: কুমিল্লা',2,'name পরিবর্তিত হয়েছে।'),(103,'2012-02-16 12:42:12',1,36,'3','Bangladesh :: Comilla',2,'name পরিবর্তিত হয়েছে।'),(104,'2012-02-16 12:43:54',1,38,'3','বরুড়া',1,''),(105,'2012-02-16 12:45:27',1,13,'3','এমডি বাতর্া',2,'title এবং moderator_state পরিবর্তিত হয়েছে।'),(106,'2012-02-16 12:46:03',1,13,'2','অামাদের সম্পকর্ে',2,'title এবং moderator_state পরিবর্তিত হয়েছে।'),(107,'2012-02-16 12:47:47',1,13,'13','বাংলা',1,''),(108,'2012-02-16 12:49:30',1,13,'13','বাংলা',3,''),(109,'2012-02-16 12:52:32',1,13,'14','fff',1,''),(110,'2012-02-16 12:53:19',1,13,'14','fff',3,''),(111,'2012-02-16 12:58:15',1,13,'15','www',1,''),(112,'2012-02-16 13:00:08',1,13,'15','www',2,'Changed template and moderator_state.'),(113,'2012-02-16 19:40:20',1,13,'8','Contact Us',2,'Changed reverse_id and moderator_state.'),(114,'2012-02-16 19:51:25',1,13,'6','News & Events',2,'Changed title, slug and moderator_state.'),(115,'2012-02-16 19:53:53',1,13,'6','খবর',2,'Changed title, slug, language and moderator_state.'),(116,'2012-02-16 19:56:51',1,13,'16','Downloads',1,''),(117,'2012-02-16 19:57:53',1,13,'16','ডাউনলোড',2,'title, slug, published, in_navigation এবং moderator_state পরিবর্তিত হয়েছে।'),(118,'2012-02-16 19:58:40',1,13,'16','ডাউনলোড',2,'template এবং moderator_state পরিবর্তিত হয়েছে।'),(119,'2012-02-16 20:01:17',1,13,'7','Legal Information',2,'Changed title, slug, language and moderator_state.'),(120,'2012-02-16 20:02:40',1,13,'7','আইনী তথ্য',2,'moderator_state পরিবর্তিত হয়েছে।'),(121,'2012-02-16 20:03:21',1,13,'7','Legal Information',2,'language এবং moderator_state পরিবর্তিত হয়েছে।'),(122,'2012-02-16 20:04:34',1,13,'9','Mission & Vision',2,'Changed title, slug, language and moderator_state.'),(123,'2012-02-16 20:34:13',1,13,'9','লক্ষ্য ও উদ্দেশ্য',2,'Changed language and moderator_state.'),(124,'2012-02-16 20:36:03',1,13,'7','আইনী তথ্য',2,'title এবং moderator_state পরিবর্তিত হয়েছে।'),(125,'2012-02-16 20:36:53',1,13,'7','আইনগত তথ্য',2,'moderator_state পরিবর্তিত হয়েছে।'),(126,'2012-02-16 20:41:52',1,36,'4','KSA',1,''),(127,'2012-02-16 20:42:01',1,36,'5','',1,''),(128,'2012-02-16 20:42:14',1,36,'4','KSA',2,'কোন ফিল্ড পরিবর্তন হয়নি।'),(129,'2012-02-16 20:43:42',1,38,'4','Riad',1,''),(130,'2012-02-16 20:44:10',1,38,'4','Riad',2,'No fields changed.'),(131,'2012-02-16 20:46:00',1,38,'4','Riad',2,'Changed contact and description.'),(132,'2012-02-16 20:58:14',1,38,'5','Riad',1,''),(133,'2012-02-16 21:02:45',1,13,'17','Bangladesh',1,''),(134,'2012-02-16 21:02:55',1,13,'17','Bangladesh',2,'title, slug, published, in_navigation, language এবং moderator_state পরিবর্তিত হয়েছে।'),(135,'2012-02-16 21:04:01',1,13,'18','Corporate Office',1,''),(136,'2012-02-16 21:04:30',1,13,'18','Corporate Office',2,'Changed published, in_navigation and moderator_state.'),(137,'2012-02-16 21:04:39',1,13,'18','Corporate Office',2,'Changed title, slug, language and moderator_state.'),(138,'2012-02-16 21:05:10',1,13,'19','Zone 1',1,''),(139,'2012-02-16 21:05:51',1,13,'19','Zone 1',2,'Changed published, in_navigation and moderator_state.'),(140,'2012-02-16 21:06:01',1,13,'19','Zone 1',2,'Changed title, slug, language and moderator_state.'),(141,'2012-02-16 21:06:17',1,13,'19','Zone 1',2,'Changed template and moderator_state.'),(142,'2012-02-16 21:25:01',1,13,'9','লক্ষ্য ও উদ্দেশ্য',2,'Changed language and moderator_state.'),(143,'2012-02-16 21:26:10',1,13,'9','লক্ষ্য ও উদ্দেশ্য',2,'moderator_state পরিবর্তিত হয়েছে।'),(144,'2012-02-16 21:27:41',1,13,'9','লক্ষ্য ও উদ্দেশ্য',2,'moderator_state পরিবর্তিত হয়েছে।'),(145,'2012-02-16 21:28:39',1,36,'5','India',2,'name পরিবর্তিত হয়েছে।'),(146,'2012-02-16 21:28:53',1,36,'5','ইন্ডিয়া',2,'name পরিবর্তিত হয়েছে।'),(147,'2012-02-16 21:29:43',1,36,'6','KSA :: Zone-1',1,''),(148,'2012-02-16 21:30:46',1,36,'4','সৌদি আরব',2,'name পরিবর্তিত হয়েছে।'),(149,'2012-02-16 21:31:08',1,38,'4','Riad',2,'কোন ফিল্ড পরিবর্তন হয়নি।'),(150,'2012-02-16 21:33:11',1,38,'4','রিয়াদ',2,'name এবং contact পরিবর্তিত হয়েছে।'),(151,'2012-02-16 21:35:33',1,36,'7','KSA :: Zone-1 :: Dammam',1,''),(152,'2012-02-16 21:36:55',1,38,'6','goolbag',1,''),(153,'2012-02-16 21:39:16',1,13,'16','Downloads',2,'Changed title and moderator_state.'),(154,'2012-02-16 21:39:51',1,13,'20','Downloads',1,''),(155,'2012-02-16 21:41:14',1,13,'16','News & Events',2,'Changed slug, application_urls and moderator_state.'),(156,'2012-02-16 21:44:30',1,34,'1','Mufti Mosaddeq',2,'Changed tag_line and name.'),(157,'2012-02-16 21:45:09',1,34,'2','Mawlana Sah Jalal',2,'Changed employee_type, designation and name.'),(158,'2012-02-16 21:49:20',1,13,'6','Media Room',2,'Changed reverse_id and moderator_state.'),(159,'2012-02-16 21:51:22',1,13,'20','Downloads',2,'Changed template and moderator_state.'),(160,'2012-02-21 00:18:21',1,13,'16','News & Events',2,'Changed reverse_id and moderator_state.'),(161,'2012-02-21 01:55:06',1,13,'21','District 1',1,''),(162,'2012-02-21 01:55:25',1,13,'22','Regional',1,''),(163,'2012-02-21 02:09:13',1,13,'22','Regional',2,'Changed template and moderator_state.'),(164,'2012-02-21 02:09:41',1,13,'22','Regional',2,'Changed moderator_state.'),(165,'2012-02-21 02:10:12',1,13,'22','Regional',2,'Changed moderator_state.'),(166,'2012-02-21 02:13:41',1,13,'16','ডাউনলোড',2,'Changed title, slug, language and moderator_state.'),(167,'2012-02-21 02:15:40',1,13,'16','খবর',2,'application_urls এবং moderator_state পরিবর্তিত হয়েছে।'),(168,'2012-02-21 02:15:54',1,13,'16','News & Events',2,'template, language এবং moderator_state পরিবর্তিত হয়েছে।'),(169,'2012-02-21 02:16:07',1,13,'16','News & Events',2,'language এবং moderator_state পরিবর্তিত হয়েছে।'),(170,'2012-02-21 02:16:49',1,13,'20','ডাউনলোড',2,'title, slug এবং moderator_state পরিবর্তিত হয়েছে।'),(171,'2012-02-21 02:16:54',1,13,'20','Downloads',2,'language এবং moderator_state পরিবর্তিত হয়েছে।'),(172,'2012-02-21 02:20:03',1,13,'6','Media Room',2,'application_urls, language এবং moderator_state পরিবর্তিত হয়েছে।'),(173,'2012-02-21 02:20:14',1,13,'6','মিডিয়া রুম',2,'title, application_urls এবং moderator_state পরিবর্তিত হয়েছে।'),(174,'2012-02-21 02:41:01',1,29,'4','ইউরোপকে অর্থনৈতিক সাহায্য দেবে চীন',2,'image এবং description পরিবর্তিত হয়েছে।'),(175,'2012-02-22 11:58:36',1,34,'4','Md Ershadul Hoque Sarker',1,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'log entry','admin','logentry'),(8,'cache key','menus','cachekey'),(9,'migration history','south','migrationhistory'),(10,'kv store','thumbnail','kvstore'),(11,'placeholder','cms','placeholder'),(12,'cms plugin','cms','cmsplugin'),(13,'page','cms','page'),(14,'PageModerator','cms','pagemoderator'),(15,'Page moderator state','cms','pagemoderatorstate'),(16,'Page global permission','cms','globalpagepermission'),(17,'Page permission','cms','pagepermission'),(18,'User (page)','cms','pageuser'),(19,'User group (page)','cms','pageusergroup'),(20,'title','cms','title'),(21,'file','file','file'),(22,'google map','googlemap','googlemap'),(23,'link','link','link'),(24,'picture','picture','picture'),(25,'text','text','text'),(26,'video','video','video'),(27,'site','sites','site'),(28,'news translation','news','newstranslation'),(29,'News','news','news'),(30,'message translation','md_messages','messagetranslation'),(31,'Managing Director\'s Message','md_messages','message'),(32,'contact message','contacts','contactmessage'),(33,'employee translation','about_us','employeetranslation'),(34,'Employee','about_us','employee'),(35,'location translation','branches','locationtranslation'),(36,'Location','branches','location'),(37,'branch translation','branches','branchtranslation'),(38,'Branch','branches','branch');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1725dab8d3e707117ac8441d4942bcca','gAJ9cQEoVQ5jbXNfYWRtaW5fc2l0ZYoBAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29u\ndHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZFUPZGphbmdvX2xhbmd1YWdlWAIAAABlbnEC\nVQ1fYXV0aF91c2VyX2lkigEBdS42ZmZjMGVlZjhmMTRjMzIzY2M5MmQ3OTgyMTE2NDZlMQ==\n','2012-03-07 12:01:44'),('38fb70d02851462f3d11e9e6d57a25c3','gAJ9cQEoVQ5jbXNfYWRtaW5fc2l0ZYoBAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29u\ndHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZFUPZGphbmdvX2xhbmd1YWdlWAIAAABlbnEC\nVQ1fYXV0aF91c2VyX2lkigEBdS42ZmZjMGVlZjhmMTRjMzIzY2M5MmQ3OTgyMTE2NDZlMQ==\n','2012-02-17 02:47:54'),('3b26bf4fbd8ec69f253fa5c767e192bb','gAJ9cQEoVQ5jbXNfYWRtaW5fc2l0ZYoBAVUNX2F1dGhfdXNlcl9pZIoBAVUPZGphbmdvX2xhbmd1\nYWdlWAIAAABlbnECVRJfYXV0aF91c2VyX2JhY2tlbmRVKWRqYW5nby5jb250cmliLmF1dGguYmFj\na2VuZHMuTW9kZWxCYWNrZW5kdS4yNjdmZDIzYjE3MjJjMzljNGJjNmMyY2I5ZTlmOTMwNg==\n','2012-03-01 09:35:52'),('62ec479bc98e350613719e51c6753e63','gAJ9cQFVD2RqYW5nb19sYW5ndWFnZVgCAAAAZW5xAnMuYzI5YjcxMzBkZmNhZDZjNjg1YjIwODEz\nMjc2OTA0ODA=\n','2012-02-28 13:49:17'),('8628f9be137d863ecede5984ce053c39','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRVKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMu\nTW9kZWxCYWNrZW5kVQ9kamFuZ29fbGFuZ3VhZ2VYAgAAAGVucQJVDV9hdXRoX3VzZXJfaWSKAQF1\nLjhjMDY2ZmM0OTFmM2ZlMWVmOTBlODA2ZGExMzdlOWEx\n','2012-03-01 10:57:50'),('8ea5eb50b6e41ff8966282c75850aab8','gAJ9cQEoVQ5jbXNfYWRtaW5fc2l0ZYoBAVUNX2F1dGhfdXNlcl9pZIoBAVUPZGphbmdvX2xhbmd1\nYWdlWAIAAABlbnECVRJfYXV0aF91c2VyX2JhY2tlbmRVKWRqYW5nby5jb250cmliLmF1dGguYmFj\na2VuZHMuTW9kZWxCYWNrZW5kdS4yNjdmZDIzYjE3MjJjMzljNGJjNmMyY2I5ZTlmOTMwNg==\n','2012-02-28 23:52:48'),('a331ca33f658e2b8d38e73d04ec1ae37','gAJ9cQEoVQ5jbXNfYWRtaW5fc2l0ZYoBAVUNX2F1dGhfdXNlcl9pZIoBAVUPZGphbmdvX2xhbmd1\nYWdlWAIAAABlbnECVRJfYXV0aF91c2VyX2JhY2tlbmRVKWRqYW5nby5jb250cmliLmF1dGguYmFj\na2VuZHMuTW9kZWxCYWNrZW5kdS4yNjdmZDIzYjE3MjJjMzljNGJjNmMyY2I5ZTlmOTMwNg==\n','2012-03-01 21:57:50'),('cca33de446463f190de3cc97d9414da3','gAJ9cQFVD2RqYW5nb19sYW5ndWFnZVgCAAAAYm5xAnMuNzI3ZDQyZDU5NzEzZGI3M2Q5OWIwZjYy\nMTlhZTUxY2Y=\n','2012-03-01 12:29:48'),('d207128a6668f9e97477d2623c37d436','gAJ9cQFVD2RqYW5nb19sYW5ndWFnZXECWAIAAABlbnEDcy5jODFlNGY1ZjlhYmViMmY4NDhmNmU3\nOTc0OTg2NmJmZQ==\n','2012-03-07 12:01:31'),('db921ec11adfe5f3b7911730c2230e9f','gAJ9cQFVD2RqYW5nb19sYW5ndWFnZXECWAIAAABlbnEDcy5jODFlNGY1ZjlhYmViMmY4NDhmNmU3\nOTc0OTg2NmJmZQ==\n','2012-02-28 13:49:44'),('f0fa60a19d655e3737dc046435a8bb14','gAJ9cQFVD2RqYW5nb19sYW5ndWFnZVgCAAAAYm5xAnMuNzI3ZDQyZDU5NzEzZGI3M2Q5OWIwZjYy\nMTlhZTUxY2Y=\n','2012-03-06 02:35:05');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `md_messages_message`
--

DROP TABLE IF EXISTS `md_messages_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_messages_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL DEFAULT '2012-02-13 07:09:23',
  `updated_at` datetime NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT '1',
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `show_on_homepage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `md_messages_message`
--

LOCK TABLES `md_messages_message` WRITE;
/*!40000 ALTER TABLE `md_messages_message` DISABLE KEYS */;
INSERT INTO `md_messages_message` VALUES (1,'2012-02-13 07:09:47','2012-02-13 07:12:45','','','','',1,1,0),(2,'2012-02-13 07:29:20','2012-02-13 07:32:11','uploads/news/images/1111_1.jpg','','','',1,1,0),(3,'2012-02-16 12:29:06','2012-02-16 12:37:01','uploads/news/images/M_Mofazzal_2.jpg','','','',1,1,1);
/*!40000 ALTER TABLE `md_messages_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `md_messages_message_translation`
--

DROP TABLE IF EXISTS `md_messages_message_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_messages_message_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `language_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `master_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `md_messages_message_transla_language_code_2405afed3cdee5f9_uniq` (`language_code`,`master_id`),
  KEY `md_messages_message_translation_11e09408` (`language_code`),
  KEY `md_messages_message_translation_64d805fc` (`master_id`),
  CONSTRAINT `master_id_refs_id_5871b7cc3a4428a5` FOREIGN KEY (`master_id`) REFERENCES `md_messages_message` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `md_messages_message_translation`
--

LOCK TABLES `md_messages_message_translation` WRITE;
/*!40000 ALTER TABLE `md_messages_message_translation` DISABLE KEYS */;
INSERT INTO `md_messages_message_translation` VALUES (1,'I am testing it . ','I am testing it .  I am testing it .  I am testing it . I am testing it .  I am testing it . I am testing it . I am testing it . I am testing it . I am testing it . I am testing it . I am testing it . I am testing it . I am testing it . I am testing it . I am testing it . I am testing it . I am testing it . I am testing it . I am testing it . I am testing it . I am testing it . ','en',1),(2,'THis is very interesting. ','THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. \r\n\r\nTHis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. \r\nTHis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. \r\n\r\n\r\nTHis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. \r\n\r\n\r\nTHis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. THis is very interesting. ','en',2),(3,'অভিনন্দন','বুশরা ট্রেড ইন্টারন্যাশনাল কর্পোরেশন লি. এর নতুন ওযেব সাইট আপলোড করার মুহুর্তে সকলকে জানাই আন্তরিক শুভেচ্ছা ও অভিনন্দন।','bn',3);
/*!40000 ALTER TABLE `md_messages_message_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus_cachekey`
--

DROP TABLE IF EXISTS `menus_cachekey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus_cachekey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site` int(10) unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus_cachekey`
--

LOCK TABLES `menus_cachekey` WRITE;
/*!40000 ALTER TABLE `menus_cachekey` DISABLE KEYS */;
INSERT INTO `menus_cachekey` VALUES (56,'bn',1,'cms-menu_nodes_bn_1'),(57,'bn',1,'cms-menu_nodes_bn_1'),(58,'en',1,'cms-menu_nodes_en_1'),(59,'bn',1,'cms-menu_nodes_bn_1'),(60,'en',1,'cms-menu_nodes_en_1'),(61,'en',1,'cms-menu_nodes_en_1'),(62,'en',1,'cms-menu_nodes_en_1'),(63,'en',1,'cms-menu_nodes_en_1'),(64,'bn',1,'cms-menu_nodes_bn_1'),(65,'bn',1,'cms-menu_nodes_bn_1'),(66,'bn',1,'cms-menu_nodes_bn_1'),(67,'bn',1,'cms-menu_nodes_bn_1'),(68,'bn',1,'cms-menu_nodes_bn_1'),(69,'bn',1,'cms-menu_nodes_bn_1'),(70,'bn',1,'cms-menu_nodes_bn_1'),(71,'bn',1,'cms-menu_nodes_bn_1'),(72,'bn',1,'cms-menu_nodes_bn_1'),(73,'bn',1,'cms-menu_nodes_bn_1'),(74,'bn',1,'cms-menu_nodes_bn_1'),(75,'bn',1,'cms-menu_nodes_bn_1'),(76,'bn',1,'cms-menu_nodes_bn_1'),(77,'bn',1,'cms-menu_nodes_bn_1'),(78,'bn',1,'cms-menu_nodes_bn_1'),(79,'bn',1,'cms-menu_nodes_bn_1'),(80,'bn',1,'cms-menu_nodes_bn_1'),(81,'bn',1,'cms-menu_nodes_bn_1'),(82,'bn',1,'cms-menu_nodes_bn_1'),(83,'bn',1,'cms-menu_nodes_bn_1'),(84,'bn',1,'cms-menu_nodes_bn_1'),(85,'bn',1,'cms-menu_nodes_bn_1'),(86,'bn',1,'cms-menu_nodes_bn_1'),(87,'bn',1,'cms-menu_nodes_bn_1'),(88,'bn',1,'cms-menu_nodes_bn_1'),(89,'bn',1,'cms-menu_nodes_bn_1'),(90,'bn',1,'cms-menu_nodes_bn_1'),(91,'en',1,'cms-menu_nodes_en_1'),(92,'en',1,'cms-menu_nodes_en_1'),(93,'en',1,'cms-menu_nodes_en_1'),(94,'en',1,'cms-menu_nodes_en_1'),(95,'en',1,'cms-menu_nodes_en_1'),(96,'en',1,'cms-menu_nodes_en_1'),(97,'en',1,'cms-menu_nodes_en_1'),(98,'en',1,'cms-menu_nodes_en_1'),(99,'en',1,'cms-menu_nodes_en_1'),(100,'en',1,'cms-menu_nodes_en_1'),(101,'en',1,'cms-menu_nodes_en_1'),(102,'en',1,'cms-menu_nodes_en_1'),(103,'en',1,'cms-menu_nodes_en_1'),(104,'en',1,'cms-menu_nodes_en_1'),(105,'en',1,'cms-menu_nodes_en_1'),(106,'en',1,'cms-menu_nodes_en_1');
/*!40000 ALTER TABLE `menus_cachekey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_news`
--

DROP TABLE IF EXISTS `news_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL DEFAULT '2012-02-10 23:21:08',
  `updated_at` datetime NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT '1',
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `show_on_homepage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_news`
--

LOCK TABLES `news_news` WRITE;
/*!40000 ALTER TABLE `news_news` DISABLE KEYS */;
INSERT INTO `news_news` VALUES (1,'2012-02-10 23:21:36','2012-02-16 11:59:50','uploads/news/images/M_Mofazzal.jpg','','','',1,1,1),(2,'2012-02-11 03:42:52','2012-02-16 12:16:57','uploads/news/images/421603_146698662116010_100003276322884_176703_482713606_n.jpg','','','',1,1,1),(4,'2012-02-16 12:00:56','2012-02-21 02:41:00','uploads/news/images/DSCF1587.JPG','','','',2,1,1),(5,'2012-02-16 12:16:57','2012-02-16 12:33:36','uploads/news/images/M_Mofazzal_1.jpg','','','http://www.youtube.com/watch?v=fgjsmWYYuxM',1,1,1);
/*!40000 ALTER TABLE `news_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_news_translation`
--

DROP TABLE IF EXISTS `news_news_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_news_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `language_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `master_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_news_translation_language_code_7dca161f4fc9651a_uniq` (`language_code`,`master_id`),
  KEY `news_news_translation_11e09408` (`language_code`),
  KEY `news_news_translation_64d805fc` (`master_id`),
  CONSTRAINT `master_id_refs_id_26f0b0d34738465d` FOREIGN KEY (`master_id`) REFERENCES `news_news` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_news_translation`
--

LOCK TABLES `news_news_translation` WRITE;
/*!40000 ALTER TABLE `news_news_translation` DISABLE KEYS */;
INSERT INTO `news_news_translation` VALUES (1,'This is a new, very interesting new ','This is very interesting , This is very interesting . This is very interesting , This is very interesting . This is very interesting , This is very interesting . This is very interesting , This is very interesting . This is very interesting , This is very interesting . This is very interesting , This is very interesting . This is very interesting , This is very interesting .  This is very interesting , This is very interesting . This is very interesting , This is very interesting . This is very interesting , This is very interesting .  This is very interesting , This is very interesting . This is very interesting , This is very interesting . This is very interesting , This is very interesting . This is very interesting , This is very interesting .','en',1),(2,'Welcome to our world','[Interactive graphic on retirement pension systems and planned reforms to the retirement age across the...] Interactive graphic on retirement pension systems and planned reforms to the retirement age across the European Union. PARIS (AFP) - – More than a million French workers marched Tuesday in the biggest protest yet against President Nicolas Sarkozy\'s pensions reform, threatening to extend strikes disrupting trains, planes and refineries. Students and school pupils joined the movement for the first time and staff in several sectors threatened to make the strikes open-ended, escalating the toughest battle of Sarkozy\'s presidency, as the government dug in its heels. \"Sarko, you\'re screwed, the young are on the streets,\" chanted students as they marched beside trade unionists and their supporters on the fourth major nationwide demonstration against pension reform in just over a month. \"This is not a last stand. The movement is taking things up a notch,\" said the president of the CFTC union, Jacques Voisin. Turnout estimates logged it as the biggest street protest in strike-prone France since 1995, when a month of stoppages crippled the country and forced the right-wing government at the time to drop its own pensions reform. The SNCF national rail company, which ran just one in three trains on Tuesday, said services would likely be as badly disrupted on Wednesday, indicating that workers were expected to renew their strike.\r\n','en',2),(8,'সুখবর','<span style=\"font-size: small;\">প্রবাসী ভাইদের জন&zwj;্য সুখবর! যাদের ঘামের বদেৌলতে সমৃদ্ধ এই বাংলাদেশ তাদের জন্য <strong>বুশরা</strong> নিয়ে এসেছে দারুণ সুখবর!!!</span><br />','bn',2),(9,'স্বগতম','<span style=\"font-size: medium;\">স্বগতম! বুশরা পরিবারে আপনাকে স্বাগতম</span>।','bn',1),(11,'ইউরোপকে অর্থনৈতিক সাহায্য দেবে চীন','','en',4),(12,'ইউরোপকে অর্থনৈতিক সাহায্য দেবে চীন','<div style=\"text-align: justify;\"><span style=\"text-decoration: underline;\"><em><strong><span style=\"font-size: x-large;\">ইউরোপকে অর্থনৈতিক সাহায্য দেবে চীন</span></strong></em></span></div>\r\n<div style=\"text-align: justify;\"><span style=\"font-size: small;\">ইউরোপকে   অর্থনৈতিক সহায়তা দিতে প্রতিশ্রুতি দিয়েছে চীন। বিশ্বের বৃহত্তম দুটি   বাণিজ্যিক অংশীদার ইউরোপ ও চীনের মধ্যে অর্থনৈতিক সহযোগিতার বিষয়ে সম্মেলন   হওয়ার কথা ছিল গত বছর। কিন্তু ইউরোজোনের সঙ্কটের কারণে তা স্থগিত করা হয়।</span><span style=\"font-size: small;\">ইউরোপীয় কর্মকর্তারা আশা করেছিলেন, ইউরোপের ঋণ সঙ্কট সমাধানে আরও   অর্থসাহায্য নিয়ে এগিয়ে আসবে চীন। চীনের ক্ষমতাসীন কমিউনিস্ট পার্টির   সংবাদপত্রেও বলা হয়, এ বিষয়ে চীনের আগ্রহ আছে।</span><span style=\"font-size: small;\">উভয়পক্ষের কর্মকর্তাদের মধ্যে আলোচনার পর চীনা প্রধানমন্ত্রী ওয়েন জিয়াবাও   বলেছেন, ইউরোপীয় দেশগুলোর ঋণ সঙ্কট সমাধানে তার দেশ ভূমিকা রাখতে  প্রস্তুত।  তবে সুস্পষ্ট কোনো ভূমিকার কথা তিনি বলেননি। </span><br /><span style=\"font-size: small;\"> তবে সঙ্কটে জর্জরিত ইউরোপের দেশগুলোকে সাহায্য করার লক্ষ্যে সুনির্দিষ্ট কোনো অর্থ সহায়তা দেয়ার বিষয়ে অঙ্গীকার করেনি বেইজিং।</span><span style=\"font-size: small;\">তিনি আরও বলেন, আমরা যা বলি তা আমরা করি। ঋণ সমস্যা সমাধানের জন্যে ইউরোপীয় ইউনিয়নকে সহায়তা করতে চীনের অবস্থান দৃঢ়।</span></div>\r\n<div style=\"text-align: justify;\" dir=\"ltr\"><br /><span style=\"font-size: small;\"> অর্থনৈতিক খাতে শৃঙ্খলা জোরদার করা জন্য ইউরোপ যে ধরনের উদ্যোগ নিচ্ছে   সেগুলোকে সমর্থন করে চীনা প্রধানমন্ত্রী বলেন, ঋণ সমস্যা সমাধানে চীন তার   ভূমিকা বাড়াতে প্রস্তুত। উভয়পক্ষের মধ্যে ঘনিষ্ঠ যোগাযোগ এবং সহযোগিতা   বাড়াতেও তারা আগ্রহী।</span><span style=\"font-size: small;\">আলোচনার পর ইউরোপীয় ইউনিয়নের প্রেসিডেন্ট হারমান ভান র্যাম্পয় বলেছেন,   উভয়পক্ষের মধ্যে বর্তমানে যে অর্থনৈতিক নির্ভরতা আছে, তাকে তারা উভয়ের   স্বার্থে কাজে লাগাতে প্রতিশ্রুতিবদ্ধ হয়েছেন।</span><span style=\"font-size: small;\">ইউরোজোনের দেশগুলোতে স্থিতি ফিরিয়ে আনার জন্য আলোচনা ও সহযোগিতা বাড়াতে   চীনের প্রতিশ্রুতিকে স্বাগত জানিয়েছেন ইউরোপীয় ইউনিয়নের প্রেসিডেন্ট।</span><span style=\"font-size: small;\">তিনি বলেন, চীনা প্রধানমন্ত্রীও এটা নিশ্চিত করেছেন যে, আমাদের অর্থনৈতিক   সম্পর্কের মূল বিষয় হচ্ছে বাণিজ্য। চীনের সবচেয়ে বড় বাণিজ্যিক অংশীদার  যেমন  ইউরোপ, ইউরোপীয় ইউনিয়নের জন্যও তেমনি বড় বাজার চীন।</span><span style=\"font-size: small;\">তবে ইউরোপের কর্মকর্তারা চীনের অর্থনৈতিক অগ্রগতির পাশাপাশি দেশটির   মানবাধিকার পরিস্থিতি আরও উন্নত করার বিষয়েও সতর্ক করে দিয়েছেন। জবাবে চীনা   প্রধানমন্ত্রী বলেছেন, তার দেশের সংস্কারের অংশ হিসেবেই বিষয়টির ওপর   গুরুত্ব দেয়া হচ্ছে।</span><br /><span style=\"font-size: small;\"> তিনি বলেন, মানবাধিকারের মতো সব বিষয়েই আলোচনা করতে তারা আগ্রহী এবং   প্রস্তুত। তবে সেই সংলাপ হতে হবে পরস্পরের প্রতি শ্রদ্ধাবোধ ও বস্তুনিষ্ঠতা   বজায় রেখে, যা উভয়পক্ষের আস্থা ও সহযোগিতা বাড়াতে সহায়ক হবে।</span></div>','bn',4),(13,'ভিডিও','<strong><span style=\"font-size: medium;\">ভিডিও দেখুন................................</span></strong>','bn',5),(14,'','','en',5);
/*!40000 ALTER TABLE `news_news_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'menus','0001_initial','2012-02-02 16:20:18'),(2,'cms','0001_initial','2012-02-02 16:20:18'),(3,'picture','0001_initial','2012-02-02 16:20:18'),(4,'picture','0002_link_rename','2012-02-02 16:20:18'),(5,'picture','0003_freeze','2012-02-02 16:20:18'),(6,'cms','0002_auto_start','2012-02-02 16:20:18'),(7,'cms','0003_remove_placeholder','2012-02-02 16:20:18'),(8,'cms','0004_textobjects','2012-02-02 16:20:18'),(9,'cms','0005_mptt_added_to_plugins','2012-02-02 16:20:18'),(10,'cms','0006_apphook','2012-02-02 16:20:18'),(11,'cms','0007_apphook_longer','2012-02-02 16:20:18'),(12,'cms','0008_redirects','2012-02-02 16:20:18'),(13,'cms','0009_added_meta_fields','2012-02-02 16:20:18'),(14,'cms','0010_5char_language','2012-02-02 16:20:18'),(15,'cms','0011_title_overwrites','2012-02-02 16:20:18'),(16,'cms','0012_publisher','2012-02-02 16:20:18'),(17,'picture','0004_publisher','2012-02-02 16:20:18'),(18,'picture','0005_table_rename','2012-02-02 16:20:18'),(19,'text','0001_initial','2012-02-02 16:20:18'),(20,'text','0002_freeze','2012-02-02 16:20:18'),(21,'text','0003_publisher','2012-02-02 16:20:18'),(22,'link','0001_initial','2012-02-02 16:20:18'),(23,'link','0002_link_rename','2012-02-02 16:20:18'),(24,'link','0003_page_link','2012-02-02 16:20:18'),(25,'link','0004_larger_link_names','2012-02-02 16:20:18'),(26,'link','0005_publisher','2012-02-02 16:20:18'),(27,'googlemap','0001_initial','2012-02-02 16:20:18'),(28,'file','0001_initial','2012-02-02 16:20:18'),(29,'file','0002_freeze','2012-02-02 16:20:18'),(30,'file','0003_publisher','2012-02-02 16:20:18'),(31,'cms','0013_site_copy','2012-02-02 16:20:18'),(32,'cms','0014_sites_removed','2012-02-02 16:20:18'),(33,'cms','0015_modified_by_added','2012-02-02 16:20:18'),(34,'cms','0016_author_copy','2012-02-02 16:20:18'),(35,'cms','0017_author_removed','2012-02-02 16:20:18'),(36,'cms','0018_site_permissions','2012-02-02 16:20:18'),(37,'cms','0019_public_table_renames','2012-02-02 16:20:18'),(38,'picture','0006_float_added','2012-02-02 16:20:18'),(39,'cms','0020_advanced_permissions','2012-02-02 16:20:18'),(40,'cms','0021_publisher2','2012-02-02 16:20:18'),(41,'cms','0022_login_required_added','2012-02-02 16:20:18'),(42,'cms','0023_plugin_table_naming_function_changed','2012-02-02 16:20:18'),(43,'cms','0024_added_placeholder_model','2012-02-02 16:20:18'),(44,'cms','0025_placeholder_migration','2012-02-02 16:20:18'),(45,'cms','0026_finish_placeholder_migration','2012-02-02 16:20:18'),(46,'cms','0027_added_width_to_placeholder','2012-02-02 16:20:18'),(47,'cms','0028_limit_visibility_in_menu_step1of3','2012-02-02 16:20:18'),(48,'cms','0029_limit_visibility_in_menu_step2of3_data','2012-02-02 16:20:18'),(49,'cms','0030_limit_visibility_in_menu_step3of3','2012-02-02 16:20:18'),(50,'cms','0031_improved_language_code_support','2012-02-02 16:20:18'),(51,'cms','0032_auto__del_field_cmsplugin_publisher_public__del_field_cmsplugin_publis','2012-02-02 16:20:18'),(52,'cms','0033_auto__del_field_title_publisher_is_draft__del_field_title_publisher_st','2012-02-02 16:20:18'),(53,'file','0004_table_rename','2012-02-02 16:20:18'),(54,'file','0005_publisher2','2012-02-02 16:20:18'),(55,'googlemap','0002_table_rename','2012-02-02 16:20:18'),(56,'googlemap','0003_address_unified','2012-02-02 16:20:18'),(57,'googlemap','0004_copy_address','2012-02-02 16:20:18'),(58,'googlemap','0005_delete_street','2012-02-02 16:20:18'),(59,'googlemap','0006_publisher2','2012-02-02 16:20:18'),(60,'googlemap','0007_latlng','2012-02-02 16:20:18'),(61,'googlemap','0008_routeplaner','2012-02-02 16:20:18'),(62,'googlemap','0009_routeplaner_title','2012-02-02 16:20:18'),(63,'link','0006_table_rename','2012-02-02 16:20:18'),(64,'link','0007_publisher2','2012-02-02 16:20:18'),(65,'link','0008_mailto','2012-02-02 16:20:18'),(66,'picture','0007_publisher2','2012-02-02 16:20:18'),(67,'picture','0008_longdesc_added','2012-02-02 16:20:18'),(68,'text','0004_table_rename','2012-02-02 16:20:18'),(69,'text','0005_publisher2','2012-02-02 16:20:18'),(70,'video','0001_initial','2012-02-02 16:20:18'),(71,'video','0002_color_mute_controller','2012-02-02 16:20:18'),(72,'video','0003_newplayer_step1','2012-02-02 16:20:18'),(73,'video','0004_newplayer_step2','2012-02-02 16:20:18'),(74,'video','0005_newplayer_step3','2012-02-02 16:20:18'),(75,'video','0006_newplayer_step4','2012-02-02 16:20:18'),(76,'video','0007_newplayer_step5','2012-02-02 16:20:18'),(77,'news','0001_initial','2012-02-11 05:21:30'),(78,'md_messages','0001_initial','2012-02-13 13:09:43'),(79,'contacts','0001_initial','2012-02-14 02:09:19'),(80,'about_us','0001_initial','2012-02-14 20:23:51'),(81,'branches','0001_initial','2012-02-16 01:56:54');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thumbnail_kvstore`
--

DROP TABLE IF EXISTS `thumbnail_kvstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thumbnail_kvstore` (
  `key` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thumbnail_kvstore`
--

LOCK TABLES `thumbnail_kvstore` WRITE;
/*!40000 ALTER TABLE `thumbnail_kvstore` DISABLE KEYS */;
INSERT INTO `thumbnail_kvstore` VALUES ('sorl-thumbnail||image||06ece0283e7b488ab7a5fdc9e75523c0','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"uploads/news/images/P5_europke-orthonoitik_1.jpg\", \"size\": [288, 245]}'),('sorl-thumbnail||image||10d313fb4c1a4cbaf7e6b0bb020647ec','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/4b/83/4b832641544ac09841d3a3aeaf325caa.jpg\", \"size\": [400, 300]}'),('sorl-thumbnail||image||173ee7ce7167e770662d9b943781b110','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/ab/3a/ab3a0188c9efc307fa849019a5964c65.jpg\", \"size\": [228, 200]}'),('sorl-thumbnail||image||1bd1cd097f1075484f20c269d42d917f','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/74/7d/747de1f1e4b48c91d2cda145f4e400b3.jpg\", \"size\": [233, 300]}'),('sorl-thumbnail||image||1cb935aa2040561ac0c23bff70500aee','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/50/ab/50aba4d800961a693bc3838a7514b588.jpg\", \"size\": [600, 450]}'),('sorl-thumbnail||image||2223676fa0841009323722bcc07123f4','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/53/fd/53fdfb39340fbba512d416bd98892b31.jpg\", \"size\": [93, 120]}'),('sorl-thumbnail||image||24615f95acb65f6f3f883fd969948a38','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/db/cb/dbcb0c7394212d9172a6c1b8c135603d.jpg\", \"size\": [120, 102]}'),('sorl-thumbnail||image||31e4f386b142e5880ade6432dc16344f','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/dd/fc/ddfc8a6453e1a600be2563edbe75821d.jpg\", \"size\": [75, 75]}'),('sorl-thumbnail||image||33516c0ec0ce4ec8075f2415b2eb5dd4','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/28/39/2839a79642b91fb03f0773c5b3b10ce7.jpg\", \"size\": [75, 75]}'),('sorl-thumbnail||image||37d3923f3ac8f400586b78710e606d2c','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"uploads/news/images/1111.jpg\", \"size\": [250, 219]}'),('sorl-thumbnail||image||38f6c6699323ae018c56d2c817c472e4','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/30/f1/30f1045a5cf118dc527658f455e86386.jpg\", \"size\": [353, 300]}'),('sorl-thumbnail||image||39955c6ef8bd630137319008852a2e0b','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/83/00/83009067765581fd67bcb1dd707827b6.jpg\", \"size\": [533, 400]}'),('sorl-thumbnail||image||3e2a0f658e3f4e1415db6962c8286a10','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/1c/b1/1cb1cab36af04cc309a28af539bce42e.jpg\", \"size\": [600, 450]}'),('sorl-thumbnail||image||498586bb7ff21be3e8086dab1478f2a6','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/6d/0f/6d0f01c01be68bd944f4b4e132a8c554.jpg\", \"size\": [310, 400]}'),('sorl-thumbnail||image||5695f925676fd0805af55e8e13cf8e56','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"uploads/about_us/images/Princess_Heart_1.gif\", \"size\": [48, 48]}'),('sorl-thumbnail||image||64262310879fd3bc265e3c0425675ab0','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/4e/7d/4e7d17680e8f589dc49c98d407722ae7.jpg\", \"size\": [233, 300]}'),('sorl-thumbnail||image||6e6042a913543869c224059a06d8525d','{\"storage\": \"sorl.thumbnail.images.UrlStorage\", \"name\": \"http://bticltd.com/media/products/BUSHRA_Adarsha_Nagar.jpg\", \"size\": [600, 339]}'),('sorl-thumbnail||image||75aeac37c819ec3bbe31f6fbb55bd069','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/65/fd/65fdef01ead7af0cf28f5cc05875586b.jpg\", \"size\": [400, 226]}'),('sorl-thumbnail||image||769e0a7dbcc72aa180bff2fc181f7fd0','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/1c/03/1c03f5bbdfc0c67139a10c99aae719d4.jpg\", \"size\": [310, 400]}'),('sorl-thumbnail||image||7a17e34e4d1c46c9372d839dcc28fce6','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/2c/ba/2cbaf0cf1b2d7bfab2d2141f12ee09ff.jpg\", \"size\": [120, 68]}'),('sorl-thumbnail||image||7e448dd1eea86d44c2da246ece6970d8','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/e8/60/e86025471569c20ca54a3fcaf03dfedb.jpg\", \"size\": [93, 120]}'),('sorl-thumbnail||image||85d2859bf13d9f5a2ad56c6a8506b92a','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/68/b0/68b0593d02a18e0d780f03c48a219639.jpg\", \"size\": [120, 90]}'),('sorl-thumbnail||image||8ed167be6e8577ab9d9520e847eab338','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/a2/73/a273ef2b67697bd5be2239ff229724fb.jpg\", \"size\": [76, 67]}'),('sorl-thumbnail||image||9421e874d5bf849ae40f1ccd13fdc264','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/06/da/06da94f2505f8b7e47283e2d9207421a.jpg\", \"size\": [342, 300]}'),('sorl-thumbnail||image||96dee97200b41c478733086b59d082f3','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/07/fc/07fcd0804bc544decf825ed3c0e5d962.jpg\", \"size\": [353, 300]}'),('sorl-thumbnail||image||a27b7af9bcb6a4c2f28eb2e58fec00af','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"uploads/news/images/M_Mofazzal.jpg\", \"size\": [444, 572]}'),('sorl-thumbnail||image||a5a6a75d059e7aef0fffb7d2082f2d76','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"uploads/news/images/M_Mofazzal_2.jpg\", \"size\": [444, 572]}'),('sorl-thumbnail||image||a5daf65a4b887167fcba1e0218eaea35','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/29/86/2986de48b17bb9c36b3bcf088a65c1a0.jpg\", \"size\": [75, 75]}'),('sorl-thumbnail||image||a85705ae4e174115903f865a436f06cd','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"uploads/news/images/P5_europke-orthonoitik.jpg\", \"size\": [288, 245]}'),('sorl-thumbnail||image||afcc52bef3c349373ad9dd079e9f6e9b','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/15/2e/152e2a4cce2882978c68df420afb2154.jpg\", \"size\": [800, 600]}'),('sorl-thumbnail||image||b5188e4ea16c43e6e5d37b180560b065','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"uploads/about_us/images/Orange.gif\", \"size\": [48, 48]}'),('sorl-thumbnail||image||b65d859541c264b1bdf0b01a6c555c04','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"uploads/news/images/1111_1.jpg\", \"size\": [250, 219]}'),('sorl-thumbnail||image||c0266eeb49936506c5303f044e453fdb','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/39/f6/39f6b4c3cb6800192c8375da8e74d0da.jpg\", \"size\": [120, 90]}'),('sorl-thumbnail||image||c5dc1ab0ac768885072a4c19e9cebc88','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/3e/21/3e21e36bc5d14a32ccc371d933a1af87.jpg\", \"size\": [600, 450]}'),('sorl-thumbnail||image||c87c68065a7d66caeb507231cf544f75','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/92/b7/92b7fda7e9a0ceeb02983d8147ce943e.jpg\", \"size\": [467, 350]}'),('sorl-thumbnail||image||c896c7dc0c0ca8b6d45d9b31421c4456','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"uploads/news/images/421603_146698662116010_100003276322884_176703_482713606_n.jpg\", \"size\": [960, 720]}'),('sorl-thumbnail||image||c995b210f602c7827ffda3d33555f3e9','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/d7/d2/d7d240bde42b24e700dd6a029530edd6.jpg\", \"size\": [120, 105]}'),('sorl-thumbnail||image||cbd8f87fc0a68d4d65a27c832ba7d3c6','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"uploads/about_us/images/Princess_Heart.gif\", \"size\": [48, 48]}'),('sorl-thumbnail||image||ccd908475cedf50dc287ae28d1a5b3e5','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/53/ed/53edc89eb3a9057ca60464e7e50f8266.jpg\", \"size\": [119, 67]}'),('sorl-thumbnail||image||ce72fe9870dafd604d1b7f1b5b91d93c','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/b3/54/b35448a7dd3d4cf06ad43f50e5a248af.jpg\", \"size\": [120, 102]}'),('sorl-thumbnail||image||cf1e3c5502da696e0b3d0a3bf0e26cc5','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/8f/28/8f28fd6ef00d4d5dd921c2664f90a869.jpg\", \"size\": [120, 105]}'),('sorl-thumbnail||image||d289a07712b8c63ed0f3f7a350920fb0','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/da/cb/dacb22433fb58bb14d2e75feac6e74f1.jpg\", \"size\": [600, 450]}'),('sorl-thumbnail||image||d5a77d686dff2adbe810404051ef34b6','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/45/36/4536395b6241c2bf47c3a52d8c9f8064.jpg\", \"size\": [533, 400]}'),('sorl-thumbnail||image||dac47fda07e2a05b024c4038cc9e7b77','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"uploads/news/images/DSCF1587.JPG\", \"size\": [1000, 750]}'),('sorl-thumbnail||image||dd5e65414d9b0d8f0c22260dda7b1e2d','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/09/f2/09f27b62af96909cf0cfda1393e1f78d.jpg\", \"size\": [400, 300]}'),('sorl-thumbnail||image||e02be4ef76472669d1b3108934b08fbe','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/5b/9f/5b9f69565ea4b9ce76e292d972c9db54.jpg\", \"size\": [400, 300]}'),('sorl-thumbnail||image||eeb83925c24c5492038365c8c6090b61','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/85/ea/85ea3a31225a987f4cff0d0136fb2a58.jpg\", \"size\": [342, 300]}'),('sorl-thumbnail||image||ef909a5b7133995583d1e6a8e9cbfd7d','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/f8/8a/f88a623995bf2201741924cd74c42878.jpg\", \"size\": [400, 300]}'),('sorl-thumbnail||image||f152d9ce4313ee131c102d2a21eb907a','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/5d/47/5d47ef8c56ce8d295acb282d38665e94.jpg\", \"size\": [300, 170]}'),('sorl-thumbnail||image||f7a3ec8426342c2e23c7e17fa3af453d','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/c4/49/c449e161c661e1034d787c3db9d5e6f1.jpg\", \"size\": [93, 120]}'),('sorl-thumbnail||image||fc8d7841ce5d80937d0e65f5bcf14113','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/9f/83/9f8354d7401c00d1c44c29f90b1a5564.jpg\", \"size\": [233, 300]}'),('sorl-thumbnail||image||ff7e1dafe225d978444ab2a724151b21','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"uploads/news/images/M_Mofazzal_1.jpg\", \"size\": [444, 572]}'),('sorl-thumbnail||thumbnails||06ece0283e7b488ab7a5fdc9e75523c0','[\"96dee97200b41c478733086b59d082f3\", \"24615f95acb65f6f3f883fd969948a38\", \"38f6c6699323ae018c56d2c817c472e4\"]'),('sorl-thumbnail||thumbnails||37d3923f3ac8f400586b78710e606d2c','[\"c995b210f602c7827ffda3d33555f3e9\", \"8ed167be6e8577ab9d9520e847eab338\", \"9421e874d5bf849ae40f1ccd13fdc264\", \"173ee7ce7167e770662d9b943781b110\"]'),('sorl-thumbnail||thumbnails||5695f925676fd0805af55e8e13cf8e56','[\"33516c0ec0ce4ec8075f2415b2eb5dd4\"]'),('sorl-thumbnail||thumbnails||6e6042a913543869c224059a06d8525d','[\"ccd908475cedf50dc287ae28d1a5b3e5\", \"7a17e34e4d1c46c9372d839dcc28fce6\", \"f152d9ce4313ee131c102d2a21eb907a\", \"75aeac37c819ec3bbe31f6fbb55bd069\"]'),('sorl-thumbnail||thumbnails||a27b7af9bcb6a4c2f28eb2e58fec00af','[\"64262310879fd3bc265e3c0425675ab0\", \"7e448dd1eea86d44c2da246ece6970d8\", \"769e0a7dbcc72aa180bff2fc181f7fd0\"]'),('sorl-thumbnail||thumbnails||a5a6a75d059e7aef0fffb7d2082f2d76','[\"2223676fa0841009323722bcc07123f4\", \"1bd1cd097f1075484f20c269d42d917f\"]'),('sorl-thumbnail||thumbnails||a85705ae4e174115903f865a436f06cd','[\"ce72fe9870dafd604d1b7f1b5b91d93c\"]'),('sorl-thumbnail||thumbnails||b5188e4ea16c43e6e5d37b180560b065','[\"31e4f386b142e5880ade6432dc16344f\"]'),('sorl-thumbnail||thumbnails||b65d859541c264b1bdf0b01a6c555c04','[\"cf1e3c5502da696e0b3d0a3bf0e26cc5\", \"eeb83925c24c5492038365c8c6090b61\"]'),('sorl-thumbnail||thumbnails||c896c7dc0c0ca8b6d45d9b31421c4456','[\"3e2a0f658e3f4e1415db6962c8286a10\", \"d5a77d686dff2adbe810404051ef34b6\", \"10d313fb4c1a4cbaf7e6b0bb020647ec\", \"c5dc1ab0ac768885072a4c19e9cebc88\", \"1cb935aa2040561ac0c23bff70500aee\", \"c87c68065a7d66caeb507231cf544f75\", \"d289a07712b8c63ed0f3f7a350920fb0\", \"85d2859bf13d9f5a2ad56c6a8506b92a\", \"dd5e65414d9b0d8f0c22260dda7b1e2d\"]'),('sorl-thumbnail||thumbnails||cbd8f87fc0a68d4d65a27c832ba7d3c6','[\"a5daf65a4b887167fcba1e0218eaea35\"]'),('sorl-thumbnail||thumbnails||dac47fda07e2a05b024c4038cc9e7b77','[\"e02be4ef76472669d1b3108934b08fbe\", \"39955c6ef8bd630137319008852a2e0b\", \"c0266eeb49936506c5303f044e453fdb\", \"afcc52bef3c349373ad9dd079e9f6e9b\", \"ef909a5b7133995583d1e6a8e9cbfd7d\"]'),('sorl-thumbnail||thumbnails||ff7e1dafe225d978444ab2a724151b21','[\"498586bb7ff21be3e8086dab1478f2a6\", \"f7a3ec8426342c2e23c7e17fa3af453d\", \"fc8d7841ce5d80937d0e65f5bcf14113\"]');
/*!40000 ALTER TABLE `thumbnail_kvstore` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-02-23  0:25:05
