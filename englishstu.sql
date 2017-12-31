-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: englishstu
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add user',2,'add_user'),(5,'Can change user',2,'change_user'),(6,'Can delete user',2,'delete_user'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user base info',7,'add_userbaseinfo'),(20,'Can change user base info',7,'change_userbaseinfo'),(21,'Can delete user base info',7,'delete_userbaseinfo'),(22,'Can add vocabulary',8,'add_vocabulary'),(23,'Can change vocabulary',8,'change_vocabulary'),(24,'Can delete vocabulary',8,'delete_vocabulary'),(25,'Can add exm sentence',9,'add_exmsentence'),(26,'Can change exm sentence',9,'change_exmsentence'),(27,'Can delete exm sentence',9,'delete_exmsentence'),(28,'Can add news',10,'add_news'),(29,'Can change news',10,'change_news'),(30,'Can delete news',10,'delete_news'),(31,'Can add user news meta',11,'add_usernewsmeta'),(32,'Can change user news meta',11,'change_usernewsmeta'),(33,'Can delete user news meta',11,'delete_usernewsmeta'),(34,'Can add user account',12,'add_useraccount'),(35,'Can change user account',12,'change_useraccount'),(36,'Can delete user account',12,'delete_useraccount'),(37,'Can add user comment',13,'add_usercomment'),(38,'Can change user comment',13,'change_usercomment'),(39,'Can delete user comment',13,'delete_usercomment');
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
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(3,'auth','permission'),(2,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(9,'user','exmsentence'),(10,'user','news'),(12,'user','useraccount'),(7,'user','userbaseinfo'),(13,'user','usercomment'),(11,'user','usernewsmeta'),(8,'user','vocabulary');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-12-31 11:21:56.751889'),(2,'auth','0001_initial','2017-12-31 11:21:58.184182'),(3,'admin','0001_initial','2017-12-31 11:21:58.501001'),(4,'admin','0002_logentry_remove_auto_add','2017-12-31 11:21:58.517993'),(5,'contenttypes','0002_remove_content_type_name','2017-12-31 11:21:58.753951'),(6,'auth','0002_alter_permission_name_max_length','2017-12-31 11:21:58.777252'),(7,'auth','0003_alter_user_email_max_length','2017-12-31 11:21:58.810725'),(8,'auth','0004_alter_user_username_opts','2017-12-31 11:21:58.826703'),(9,'auth','0005_alter_user_last_login_null','2017-12-31 11:21:58.931196'),(10,'auth','0006_require_contenttypes_0002','2017-12-31 11:21:58.942018'),(11,'auth','0007_alter_validators_add_error_messages','2017-12-31 11:21:58.957789'),(12,'auth','0008_alter_user_username_max_length','2017-12-31 11:21:59.171171'),(13,'auth','0009_alter_user_last_name_max_length','2017-12-31 11:21:59.203319'),(14,'sessions','0001_initial','2017-12-31 11:21:59.299910'),(15,'user','0001_initial','2017-12-31 11:22:00.492340');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_exmsentence`
--

DROP TABLE IF EXISTS `user_exmsentence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_exmsentence` (
  `ES_id` int(11) NOT NULL AUTO_INCREMENT,
  `ES_sen` longtext NOT NULL,
  `ES_definition` longtext NOT NULL,
  `ES_voc_id_id` int(11) NOT NULL,
  PRIMARY KEY (`ES_id`),
  KEY `user_exmsentence_ES_voc_id_id_fab88634_fk_user_vocabulary_id` (`ES_voc_id_id`),
  CONSTRAINT `user_exmsentence_ES_voc_id_id_fab88634_fk_user_vocabulary_id` FOREIGN KEY (`ES_voc_id_id`) REFERENCES `user_vocabulary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_exmsentence`
--

LOCK TABLES `user_exmsentence` WRITE;
/*!40000 ALTER TABLE `user_exmsentence` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_exmsentence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_news`
--

DROP TABLE IF EXISTS `user_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_news` (
  `Nid` int(11) NOT NULL AUTO_INCREMENT,
  `Ndate` datetime(6) NOT NULL,
  `Ncontent` longtext NOT NULL,
  `Ntitle_cn` varchar(60) NOT NULL,
  `Ntitle_en` varchar(60) NOT NULL,
  `Nstatus` varchar(12) NOT NULL,
  `Ncomment_status` varchar(12) NOT NULL,
  `Npost_modified` datetime(6) NOT NULL,
  `Npost_parent` int(11) NOT NULL,
  `Nlength` int(11) NOT NULL,
  `Ngrade_info` varchar(14) NOT NULL,
  `Nhas_audio` tinyint(1) NOT NULL,
  `Nhas_video` tinyint(1) NOT NULL,
  `Nsummary` longtext NOT NULL,
  `Nnum_reviews` int(11) NOT NULL,
  `Nauthor_id` int(11) NOT NULL,
  PRIMARY KEY (`Nid`),
  KEY `user_news_Nauthor_id_ab340c98_fk_user_userbaseinfo_id` (`Nauthor_id`),
  CONSTRAINT `user_news_Nauthor_id_ab340c98_fk_user_userbaseinfo_id` FOREIGN KEY (`Nauthor_id`) REFERENCES `user_userbaseinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_news`
--

LOCK TABLES `user_news` WRITE;
/*!40000 ALTER TABLE `user_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_useraccount`
--

DROP TABLE IF EXISTS `user_useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_useraccount` (
  `Uid` int(11) NOT NULL AUTO_INCREMENT,
  `Uname` varchar(30) NOT NULL,
  `Uaccount` varchar(30) NOT NULL,
  `Upass` varchar(30) NOT NULL,
  PRIMARY KEY (`Uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_useraccount`
--

LOCK TABLES `user_useraccount` WRITE;
/*!40000 ALTER TABLE `user_useraccount` DISABLE KEYS */;
INSERT INTO `user_useraccount` VALUES (1,'tqw','tqw503417','tqw503417');
/*!40000 ALTER TABLE `user_useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userbaseinfo`
--

DROP TABLE IF EXISTS `user_userbaseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_userbaseinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UBage` int(11) NOT NULL,
  `UBemail` varchar(50) NOT NULL,
  `UBfriend` int(11) NOT NULL,
  `UBsignature` varchar(100) NOT NULL,
  `UBsex` tinyint(1) NOT NULL,
  `UBphone_number` int(11) NOT NULL,
  `UBprofile_photo_url` varchar(200) NOT NULL,
  `UBid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_userbaseinfo_UBid_id_11e17743_fk_user_useraccount_Uid` (`UBid_id`),
  CONSTRAINT `user_userbaseinfo_UBid_id_11e17743_fk_user_useraccount_Uid` FOREIGN KEY (`UBid_id`) REFERENCES `user_useraccount` (`Uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userbaseinfo`
--

LOCK TABLES `user_userbaseinfo` WRITE;
/*!40000 ALTER TABLE `user_userbaseinfo` DISABLE KEYS */;
INSERT INTO `user_userbaseinfo` VALUES (1,15,'2144799613@qq.com',1,'xE8xA1XA8xE9xA2',0,1592741,'http://120.76.140.147/EnglishStu/header.php',1);
/*!40000 ALTER TABLE `user_userbaseinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_usercomment`
--

DROP TABLE IF EXISTS `user_usercomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_usercomment` (
  `UBcomment_id` int(11) NOT NULL AUTO_INCREMENT,
  `UBcomment_date` datetime(6) NOT NULL,
  `UBcomment` varchar(200) NOT NULL,
  `UBcomment_to` int(11) NOT NULL,
  `UBcomment_IP` varchar(50) NOT NULL,
  `UBcomment_approved` tinyint(1) NOT NULL,
  `UBcomment_parent` int(11) NOT NULL,
  `UBComment_by_id` int(11) NOT NULL,
  PRIMARY KEY (`UBcomment_id`),
  KEY `user_usercomment_UBComment_by_id_24c9706a_fk_user_user` (`UBComment_by_id`),
  CONSTRAINT `user_usercomment_UBComment_by_id_24c9706a_fk_user_user` FOREIGN KEY (`UBComment_by_id`) REFERENCES `user_useraccount` (`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_usercomment`
--

LOCK TABLES `user_usercomment` WRITE;
/*!40000 ALTER TABLE `user_usercomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_usercomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_usernewsmeta`
--

DROP TABLE IF EXISTS `user_usernewsmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_usernewsmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_finished` tinyint(1) NOT NULL,
  `is_liked` tinyint(1) NOT NULL,
  `is_reviewed` tinyint(1) NOT NULL,
  `UNM_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_usernewsmeta_UNM_id_id_ac882f2c_fk_user_news_Nid` (`UNM_id_id`),
  CONSTRAINT `user_usernewsmeta_UNM_id_id_ac882f2c_fk_user_news_Nid` FOREIGN KEY (`UNM_id_id`) REFERENCES `user_news` (`Nid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_usernewsmeta`
--

LOCK TABLES `user_usernewsmeta` WRITE;
/*!40000 ALTER TABLE `user_usernewsmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_usernewsmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_vocabulary`
--

DROP TABLE IF EXISTS `user_vocabulary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_vocabulary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Voc_id` int(11) NOT NULL,
  `cn_definition` varchar(80) NOT NULL,
  `en_definition` varchar(80) NOT NULL,
  `content` varchar(30) NOT NULL,
  `content_type` varchar(12) NOT NULL,
  `uk_audio` varchar(200) NOT NULL,
  `us_audio` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_vocabulary`
--

LOCK TABLES `user_vocabulary` WRITE;
/*!40000 ALTER TABLE `user_vocabulary` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_vocabulary` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-31 22:49:00
