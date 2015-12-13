-- MySQL dump 10.11
--
-- Host: localhost    Database: dwz_thinkphp
-- ------------------------------------------------------
-- Server version    5.0.77-community-nt-log

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
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `pid` smallint(6) NOT NULL,
  `module` varchar(50) default NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
INSERT INTO `access` VALUES (2,1,1,0,NULL),(2,40,2,1,NULL),(2,30,2,1,NULL),(3,1,1,0,NULL),(2,69,2,1,NULL),(2,50,3,40,NULL),(3,50,3,40,NULL),(1,50,3,40,NULL),(3,7,2,1,NULL),(3,39,3,30,NULL),(2,39,3,30,NULL),(2,49,3,30,NULL),(4,1,1,0,NULL),(4,2,2,1,NULL),(4,3,2,1,NULL),(4,4,2,1,NULL),(4,5,2,1,NULL),(4,6,2,1,NULL),(4,7,2,1,NULL),(4,11,2,1,NULL),(5,25,1,0,NULL),(5,51,2,25,NULL),(1,1,1,0,NULL),(1,39,3,30,NULL),(1,40,2,1,NULL),(1,30,2,1,NULL),(1,7,2,1,NULL),(1,49,3,30,NULL),(3,69,2,1,NULL),(3,30,2,1,NULL),(3,40,2,1,NULL),(1,37,3,30,NULL),(1,36,3,30,NULL),(1,35,3,30,NULL),(1,34,3,30,NULL),(1,33,3,30,NULL),(1,32,3,30,NULL),(1,31,3,30,NULL),(2,32,3,30,NULL),(2,31,3,30,NULL),(7,1,1,0,NULL),(7,30,2,1,NULL),(7,40,2,1,NULL),(7,69,2,1,NULL),(7,50,3,40,NULL),(7,39,3,30,NULL),(7,49,3,30,NULL);
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `group` (
  `id` smallint(3) unsigned NOT NULL auto_increment,
  `name` varchar(25) NOT NULL,
  `title` varchar(50) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `sort` smallint(3) unsigned NOT NULL default '0',
  `show` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (2,'App','应用中心',1222841259,0,1,0,0);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `groups` (
  `id` mediumint(6) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'项目组1'),(2,'项目组2'),(3,'项目组3');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `node` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) default NULL,
  `status` tinyint(1) default '0',
  `remark` varchar(255) default NULL,
  `sort` smallint(6) unsigned default NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL default '0',
  `group_id` tinyint(3) unsigned default '0',
  PRIMARY KEY  (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` VALUES (49,'read','查看',1,'',NULL,30,3,0,0),(40,'Index','默认模块',1,'',1,1,2,0,0),(39,'index','列表',1,'',NULL,30,3,0,0),(37,'resume','恢复',1,'',NULL,30,3,0,0),(36,'forbid','禁用',1,'',NULL,30,3,0,0),(35,'foreverdelete','删除',1,'',NULL,30,3,0,0),(34,'update','更新',1,'',NULL,30,3,0,0),(33,'edit','编辑',1,'',NULL,30,3,0,0),(32,'insert','写入',1,'',NULL,30,3,0,0),(31,'add','新增',1,'',NULL,30,3,0,0),(30,'Public','公共模块',1,'',2,1,2,0,0),(7,'User','后台用户',1,'',4,1,2,0,2),(6,'Role','角色管理',1,'',3,1,2,0,2),(2,'Node','节点管理',1,'',2,1,2,0,2),(1,'Admin','后台管理',1,'',NULL,0,1,0,0),(50,'main','空白首页',1,'',NULL,40,3,0,0);
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `role` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) default NULL,
  `status` tinyint(1) unsigned default NULL,
  `remark` varchar(255) default NULL,
  `ename` varchar(5) default NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `parentId` (`pid`),
  KEY `ename` (`ename`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'领导组',0,1,'','',1208784792,1254325558),(2,'员工组',0,1,'','',1215496283,1254325566),(7,'演示组',0,1,'',NULL,1254325787,0);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `role_user` (
  `role_id` mediumint(9) unsigned default NULL,
  `user_id` char(32) default NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (4,'27'),(4,'26'),(4,'30'),(5,'31'),(3,'22'),(3,'1'),(1,'4'),(2,'3'),(7,'2'),(3,'35'),(3,'36');
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `account` varchar(64) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `bind_account` varchar(50) NOT DEFAULT NULL,
  `last_login_time` int(11) unsigned default '0',
  `last_login_ip` varchar(40) default NULL,
  `login_count` mediumint(8) unsigned default '0',
  `verify` varchar(32) default NULL,
  `email` varchar(50) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT DEFAULT 0,
  `status` tinyint(1) default '0',
  `type_id` tinyint(2) unsigned default '0',
  `info` text NOT DEFAULT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','管理员','21232f297a57a5a743894a0e4a801fc3','',1312088534,'127.0.0.1',924,'8888','liu21st@gmail.com','备注信息',1222907803,1239977420,1,0,''),(2,'demo','演示','fe01ce2a7fbac8fafaed7c982a04e229','',1306159437,'127.0.0.1',94,'8888','','',1239783735,1254325770,1,0,''),(3,'member','员工','aa08769cdcb26674c6706093503ff0a3','',1254326104,'127.0.0.1',15,'','','',1253514375,1254325728,1,0,''),(4,'leader','领导','c444858e0aaeb727da73d2eae62321ad','',1284542339,'127.0.0.1',17,'','','领导',1253514575,1254325705,1,0,''),(36,'zhanghuihua','张慧华','21218cca77804d2ba1922c33e0151105','',0,NULL,0,NULL,'zhanghuihua@sohu.com','',1284448629,1285638494,1,0,'');
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

-- Dump completed on 2011-07-31  5:04:13
