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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user news meta',7,'add_usernewsmeta'),(20,'Can change user news meta',7,'change_usernewsmeta'),(21,'Can delete user news meta',7,'delete_usernewsmeta'),(22,'Can add vocabulary',8,'add_vocabulary'),(23,'Can change vocabulary',8,'change_vocabulary'),(24,'Can delete vocabulary',8,'delete_vocabulary'),(25,'Can add news',9,'add_news'),(26,'Can change news',9,'change_news'),(27,'Can delete news',9,'delete_news'),(28,'Can add exm sentence',10,'add_exmsentence'),(29,'Can change exm sentence',10,'change_exmsentence'),(30,'Can delete exm sentence',10,'delete_exmsentence'),(31,'Can add user journal',11,'add_userjournal'),(32,'Can change user journal',11,'change_userjournal'),(33,'Can delete user journal',11,'delete_userjournal'),(34,'Can add user base info',12,'add_userbaseinfo'),(35,'Can change user base info',12,'change_userbaseinfo'),(36,'Can delete user base info',12,'delete_userbaseinfo'),(37,'Can add user account',13,'add_useraccount'),(38,'Can change user account',13,'change_useraccount'),(39,'Can delete user account',13,'delete_useraccount'),(40,'Can add user resource',14,'add_userresource'),(41,'Can change user resource',14,'change_userresource'),(42,'Can delete user resource',14,'delete_userresource'),(43,'Can add word set',15,'add_wordset'),(44,'Can change word set',15,'change_wordset'),(45,'Can delete word set',15,'delete_wordset'),(46,'Can add user follower',16,'add_userfollower'),(47,'Can change user follower',16,'change_userfollower'),(48,'Can delete user follower',16,'delete_userfollower'),(49,'Can add user comment',17,'add_usercomment'),(50,'Can change user comment',17,'change_usercomment'),(51,'Can delete user comment',17,'delete_usercomment');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(10,'user','exmsentence'),(9,'user','news'),(13,'user','useraccount'),(12,'user','userbaseinfo'),(17,'user','usercomment'),(16,'user','userfollower'),(11,'user','userjournal'),(7,'user','usernewsmeta'),(14,'user','userresource'),(8,'user','vocabulary'),(15,'user','wordset');
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
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-12-31 18:06:09.730166'),(2,'auth','0001_initial','2017-12-31 18:06:11.234995'),(3,'admin','0001_initial','2017-12-31 18:06:11.568169'),(4,'admin','0002_logentry_remove_auto_add','2017-12-31 18:06:11.588205'),(5,'contenttypes','0002_remove_content_type_name','2017-12-31 18:06:11.817939'),(6,'auth','0002_alter_permission_name_max_length','2017-12-31 18:06:11.844383'),(7,'auth','0003_alter_user_email_max_length','2017-12-31 18:06:11.874751'),(8,'auth','0004_alter_user_username_opts','2017-12-31 18:06:11.894139'),(9,'auth','0005_alter_user_last_login_null','2017-12-31 18:06:12.005014'),(10,'auth','0006_require_contenttypes_0002','2017-12-31 18:06:12.015243'),(11,'auth','0007_alter_validators_add_error_messages','2017-12-31 18:06:12.031144'),(12,'auth','0008_alter_user_username_max_length','2017-12-31 18:06:12.279412'),(13,'auth','0009_alter_user_last_name_max_length','2017-12-31 18:06:12.307927'),(14,'sessions','0001_initial','2017-12-31 18:06:12.411941'),(15,'user','0001_initial','2017-12-31 18:06:14.552739');
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
  KEY `user_news_Nauthor_id_ab340c98_fk_user_userbaseinfo_UBid` (`Nauthor_id`),
  CONSTRAINT `user_news_Nauthor_id_ab340c98_fk_user_userbaseinfo_UBid` FOREIGN KEY (`Nauthor_id`) REFERENCES `user_userbaseinfo` (`UBid`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Uname` varchar(30) NOT NULL,
  `Uaccount` varchar(30) NOT NULL,
  `Upass` varchar(30) NOT NULL,
  `Uid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_useraccount_Uid_id_c1cfbd4f_fk_user_userbaseinfo_UBid` (`Uid_id`),
  CONSTRAINT `user_useraccount_Uid_id_c1cfbd4f_fk_user_userbaseinfo_UBid` FOREIGN KEY (`Uid_id`) REFERENCES `user_userbaseinfo` (`UBid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_useraccount`
--

LOCK TABLES `user_useraccount` WRITE;
/*!40000 ALTER TABLE `user_useraccount` DISABLE KEYS */;
INSERT INTO `user_useraccount` VALUES (2,'tqw','tqw503417','tqw503417',1);
/*!40000 ALTER TABLE `user_useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userbaseinfo`
--

DROP TABLE IF EXISTS `user_userbaseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_userbaseinfo` (
  `UBage` int(11) NOT NULL,
  `UBemail` varchar(50) NOT NULL,
  `UBfriend` int(11) NOT NULL,
  `UBsignature` varchar(100) NOT NULL,
  `UBsex` tinyint(1) NOT NULL,
  `UBphone_number` int(11) NOT NULL,
  `UBprofile_photo_url` varchar(200) NOT NULL,
  `UBid` int(11) NOT NULL AUTO_INCREMENT,
  `UBfollowing_num` int(11) NOT NULL,
  `UBfollower_num` int(11) NOT NULL,
  `UBreading_num` int(11) NOT NULL,
  PRIMARY KEY (`UBid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userbaseinfo`
--

LOCK TABLES `user_userbaseinfo` WRITE;
/*!40000 ALTER TABLE `user_userbaseinfo` DISABLE KEYS */;
INSERT INTO `user_userbaseinfo` VALUES (19,'2144799613@qq.com',1,'',0,123145,'http://120.76.140.147/EnglishStu/header.php',1,55,31,4564);
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
  `UBreading_play_num` int(11) NOT NULL,
  `UBComment_by_id` int(11) NOT NULL,
  PRIMARY KEY (`UBcomment_id`),
  KEY `user_usercomment_UBComment_by_id_24c9706a_fk_user_user` (`UBComment_by_id`),
  CONSTRAINT `user_usercomment_UBComment_by_id_24c9706a_fk_user_user` FOREIGN KEY (`UBComment_by_id`) REFERENCES `user_userbaseinfo` (`UBid`)
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
-- Table structure for table `user_userfollower`
--

DROP TABLE IF EXISTS `user_userfollower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_userfollower` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UF_friend_id_id` int(11) NOT NULL,
  `UF_uid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_userfollower_UF_friend_id_id_e05c53d9_fk_user_user` (`UF_friend_id_id`),
  KEY `user_userfollower_UF_uid_id_5a38a7b4_fk_user_userbaseinfo_UBid` (`UF_uid_id`),
  CONSTRAINT `user_userfollower_UF_friend_id_id_e05c53d9_fk_user_user` FOREIGN KEY (`UF_friend_id_id`) REFERENCES `user_userbaseinfo` (`UBid`),
  CONSTRAINT `user_userfollower_UF_uid_id_5a38a7b4_fk_user_userbaseinfo_UBid` FOREIGN KEY (`UF_uid_id`) REFERENCES `user_userbaseinfo` (`UBid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userfollower`
--

LOCK TABLES `user_userfollower` WRITE;
/*!40000 ALTER TABLE `user_userfollower` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_userfollower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userjournal`
--

DROP TABLE IF EXISTS `user_userjournal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_userjournal` (
  `UJ_id` int(11) NOT NULL AUTO_INCREMENT,
  `UJ_title` varchar(50) NOT NULL,
  `UJ_content` longtext NOT NULL,
  `UJ_create_date` date NOT NULL,
  `UJ_update_date` date NOT NULL,
  `UJ_uid_id` int(11) NOT NULL,
  PRIMARY KEY (`UJ_id`),
  KEY `user_userjournal_UJ_uid_id_d9c04c86_fk_user_userbaseinfo_UBid` (`UJ_uid_id`),
  CONSTRAINT `user_userjournal_UJ_uid_id_d9c04c86_fk_user_userbaseinfo_UBid` FOREIGN KEY (`UJ_uid_id`) REFERENCES `user_userbaseinfo` (`UBid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userjournal`
--

LOCK TABLES `user_userjournal` WRITE;
/*!40000 ALTER TABLE `user_userjournal` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_userjournal` ENABLE KEYS */;
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
-- Table structure for table `user_userresource`
--

DROP TABLE IF EXISTS `user_userresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_userresource` (
  `R_id` int(11) NOT NULL AUTO_INCREMENT,
  `R_name` varchar(50) NOT NULL,
  `R_price` double NOT NULL,
  `R_url` varchar(200) NOT NULL,
  `R_has` tinyint(1) NOT NULL,
  `R_uid_id` int(11) NOT NULL,
  PRIMARY KEY (`R_id`),
  KEY `user_userresource_R_uid_id_ba3e380b_fk_user_userbaseinfo_UBid` (`R_uid_id`),
  CONSTRAINT `user_userresource_R_uid_id_ba3e380b_fk_user_userbaseinfo_UBid` FOREIGN KEY (`R_uid_id`) REFERENCES `user_userbaseinfo` (`UBid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userresource`
--

LOCK TABLES `user_userresource` WRITE;
/*!40000 ALTER TABLE `user_userresource` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_userresource` ENABLE KEYS */;
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

--
-- Table structure for table `user_wordset`
--

DROP TABLE IF EXISTS `user_wordset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_wordset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WS_voc_book` varchar(20) NOT NULL,
  `WS_pronunciation` int(11) NOT NULL,
  `WS_translate_en` tinyint(1) NOT NULL,
  `WS_translate_cn` tinyint(1) NOT NULL,
  `WS_voc_auto_pron` tinyint(1) NOT NULL,
  `WS_sentence_auto_pron` tinyint(1) NOT NULL,
  `WS_disp_note` tinyint(1) NOT NULL,
  `WS_stu_degree` int(11) NOT NULL,
  `WS_stu_times` int(11) NOT NULL,
  `WS_stu_volume` int(11) NOT NULL,
  `WS_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_wordset_WS_id_id_f803091b_fk_user_useraccount_id` (`WS_id_id`),
  CONSTRAINT `user_wordset_WS_id_id_f803091b_fk_user_useraccount_id` FOREIGN KEY (`WS_id_id`) REFERENCES `user_useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_wordset`
--

LOCK TABLES `user_wordset` WRITE;
/*!40000 ALTER TABLE `user_wordset` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_wordset` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-01 16:41:31
