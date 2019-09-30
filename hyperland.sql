-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: hyperland
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `admin_email`
--

DROP TABLE IF EXISTS `admin_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '邮箱',
  `status` int(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_email`
--

LOCK TABLES `admin_email` WRITE;
/*!40000 ALTER TABLE `admin_email` DISABLE KEYS */;
INSERT INTO `admin_email` VALUES (1,'qd_usb@163.com',1),(2,'qd_usb@163.com2',0);
/*!40000 ALTER TABLE `admin_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `idx-auth_assignment-user_id` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('管理员','1',1566351114),('管理员','6',1566372533),('系统管理员','1',1566354276);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('/*',2,NULL,NULL,NULL,1566297072,1566297072),('/admin-email/*',2,NULL,NULL,NULL,1566297072,1566297072),('/admin-email/create',2,NULL,NULL,NULL,1566297072,1566297072),('/admin-email/delete',2,NULL,NULL,NULL,1566297072,1566297072),('/admin-email/index',2,NULL,NULL,NULL,1566297072,1566297072),('/admin-email/update',2,NULL,NULL,NULL,1566297072,1566297072),('/admin-email/view',2,NULL,NULL,NULL,1566297072,1566297072),('/admin/*',2,NULL,NULL,NULL,1566297071,1566297071),('/admin/assignment/*',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/assignment/assign',2,NULL,NULL,NULL,1566297069,1566297069),('/admin/assignment/index',2,NULL,NULL,NULL,1566297069,1566297069),('/admin/assignment/revoke',2,NULL,NULL,NULL,1566297069,1566297069),('/admin/assignment/view',2,NULL,NULL,NULL,1566297069,1566297069),('/admin/default/*',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/default/index',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/menu/*',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/menu/create',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/menu/delete',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/menu/index',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/menu/update',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/menu/view',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/permission/*',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/permission/assign',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/permission/create',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/permission/delete',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/permission/index',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/permission/remove',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/permission/update',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/permission/view',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/role/*',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/role/assign',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/role/create',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/role/delete',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/role/index',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/role/remove',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/role/update',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/role/view',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/route/*',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/route/assign',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/route/create',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/route/index',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/route/refresh',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/route/remove',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/rule/*',2,NULL,NULL,NULL,1566297071,1566297071),('/admin/rule/create',2,NULL,NULL,NULL,1566297071,1566297071),('/admin/rule/delete',2,NULL,NULL,NULL,1566297071,1566297071),('/admin/rule/index',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/rule/update',2,NULL,NULL,NULL,1566297071,1566297071),('/admin/rule/view',2,NULL,NULL,NULL,1566297070,1566297070),('/admin/user/*',2,NULL,NULL,NULL,1566297071,1566297071),('/admin/user/activate',2,NULL,NULL,NULL,1566297071,1566297071),('/admin/user/change-password',2,NULL,NULL,NULL,1566297071,1566297071),('/admin/user/delete',2,NULL,NULL,NULL,1566297071,1566297071),('/admin/user/index',2,NULL,NULL,NULL,1566297071,1566297071),('/admin/user/login',2,NULL,NULL,NULL,1566297071,1566297071),('/admin/user/logout',2,NULL,NULL,NULL,1566297071,1566297071),('/admin/user/request-password-reset',2,NULL,NULL,NULL,1566297071,1566297071),('/admin/user/reset-password',2,NULL,NULL,NULL,1566297071,1566297071),('/admin/user/signup',2,NULL,NULL,NULL,1566297071,1566297071),('/admin/user/view',2,NULL,NULL,NULL,1566297071,1566297071),('/debug/*',2,NULL,NULL,NULL,1566297071,1566297071),('/debug/default/*',2,NULL,NULL,NULL,1566297071,1566297071),('/debug/default/db-explain',2,NULL,NULL,NULL,1566297071,1566297071),('/debug/default/download-mail',2,NULL,NULL,NULL,1566297071,1566297071),('/debug/default/index',2,NULL,NULL,NULL,1566297071,1566297071),('/debug/default/toolbar',2,NULL,NULL,NULL,1566297071,1566297071),('/debug/default/view',2,NULL,NULL,NULL,1566297071,1566297071),('/debug/user/*',2,NULL,NULL,NULL,1566297071,1566297071),('/debug/user/reset-identity',2,NULL,NULL,NULL,1566297071,1566297071),('/debug/user/set-identity',2,NULL,NULL,NULL,1566297071,1566297071),('/gii/*',2,NULL,NULL,NULL,1566297072,1566297072),('/gii/default/*',2,NULL,NULL,NULL,1566297071,1566297071),('/gii/default/action',2,NULL,NULL,NULL,1566297071,1566297071),('/gii/default/diff',2,NULL,NULL,NULL,1566297071,1566297071),('/gii/default/index',2,NULL,NULL,NULL,1566297071,1566297071),('/gii/default/preview',2,NULL,NULL,NULL,1566297071,1566297071),('/gii/default/view',2,NULL,NULL,NULL,1566297071,1566297071),('/media-type/*',2,NULL,NULL,NULL,1566305384,1566305384),('/media-type/change-name',2,NULL,NULL,NULL,1567132550,1567132550),('/media-type/create',2,NULL,NULL,NULL,1566305384,1566305384),('/media-type/delete',2,NULL,NULL,NULL,1566305384,1566305384),('/media-type/index',2,NULL,NULL,NULL,1566305384,1566305384),('/media-type/update',2,NULL,NULL,NULL,1566305384,1566305384),('/media-type/view',2,NULL,NULL,NULL,1566305384,1566305384),('/notice/*',2,NULL,NULL,NULL,1566350823,1566350823),('/notice/create',2,NULL,NULL,NULL,1566350828,1566350828),('/notice/delete',2,NULL,NULL,NULL,1566350828,1566350828),('/notice/index',2,NULL,NULL,NULL,1566350828,1566350828),('/notice/update',2,NULL,NULL,NULL,1566350828,1566350828),('/notice/view',2,NULL,NULL,NULL,1566350828,1566350828),('/redactor/*',2,NULL,NULL,NULL,1566305384,1566305384),('/site/*',2,NULL,NULL,NULL,1566297072,1566297072),('/site/error',2,NULL,NULL,NULL,1566297072,1566297072),('/site/index',2,NULL,NULL,NULL,1566297072,1566297072),('/site/login',2,NULL,NULL,NULL,1566297072,1566297072),('/site/logout',2,NULL,NULL,NULL,1566297072,1566297072),('/user/*',2,NULL,NULL,NULL,1566372238,1566372238),('/user/create',2,NULL,NULL,NULL,1566372237,1566372237),('/user/delete',2,NULL,NULL,NULL,1566372237,1566372237),('/user/index',2,NULL,NULL,NULL,1566372237,1566372237),('/user/update',2,NULL,NULL,NULL,1566372237,1566372237),('/user/view',2,NULL,NULL,NULL,1566372237,1566372237),('RBAC权限管理',2,'RBAC管理',NULL,NULL,1566376345,1566376345),('会员',1,'一般会员',NULL,NULL,1566297195,1566297195),('媒体管理权限',2,NULL,NULL,NULL,1567132685,1567132685),('用户管理权限',2,'用户管理权限',NULL,NULL,1566376388,1566376388),('管理员',1,'常规管理员,有删除权限\r\n',NULL,NULL,1566351070,1566372515),('系统管理员',1,'系统管理员',NULL,NULL,1566297116,1566376279),('通告管理权限',2,'可以对通告做增删改查',NULL,NULL,1566376218,1566376218),('邮箱管理权限',2,'对管理员邮箱有增删改查权限',NULL,NULL,1566376317,1566376317);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('系统管理员','/*'),('管理员','/admin-email/*'),('系统管理员','/admin-email/*'),('邮箱管理权限','/admin-email/*'),('管理员','/admin-email/create'),('系统管理员','/admin-email/create'),('邮箱管理权限','/admin-email/create'),('管理员','/admin-email/delete'),('系统管理员','/admin-email/delete'),('邮箱管理权限','/admin-email/delete'),('管理员','/admin-email/index'),('系统管理员','/admin-email/index'),('邮箱管理权限','/admin-email/index'),('管理员','/admin-email/update'),('系统管理员','/admin-email/update'),('邮箱管理权限','/admin-email/update'),('管理员','/admin-email/view'),('系统管理员','/admin-email/view'),('邮箱管理权限','/admin-email/view'),('RBAC权限管理','/admin/*'),('系统管理员','/admin/*'),('RBAC权限管理','/admin/assignment/*'),('系统管理员','/admin/assignment/*'),('RBAC权限管理','/admin/assignment/assign'),('系统管理员','/admin/assignment/assign'),('RBAC权限管理','/admin/assignment/index'),('系统管理员','/admin/assignment/index'),('RBAC权限管理','/admin/assignment/revoke'),('系统管理员','/admin/assignment/revoke'),('RBAC权限管理','/admin/assignment/view'),('系统管理员','/admin/assignment/view'),('RBAC权限管理','/admin/default/*'),('系统管理员','/admin/default/*'),('RBAC权限管理','/admin/default/index'),('系统管理员','/admin/default/index'),('RBAC权限管理','/admin/menu/*'),('系统管理员','/admin/menu/*'),('RBAC权限管理','/admin/menu/create'),('系统管理员','/admin/menu/create'),('RBAC权限管理','/admin/menu/delete'),('系统管理员','/admin/menu/delete'),('RBAC权限管理','/admin/menu/index'),('系统管理员','/admin/menu/index'),('RBAC权限管理','/admin/menu/update'),('系统管理员','/admin/menu/update'),('RBAC权限管理','/admin/menu/view'),('系统管理员','/admin/menu/view'),('RBAC权限管理','/admin/permission/*'),('系统管理员','/admin/permission/*'),('RBAC权限管理','/admin/permission/assign'),('系统管理员','/admin/permission/assign'),('RBAC权限管理','/admin/permission/create'),('系统管理员','/admin/permission/create'),('RBAC权限管理','/admin/permission/delete'),('系统管理员','/admin/permission/delete'),('RBAC权限管理','/admin/permission/index'),('系统管理员','/admin/permission/index'),('RBAC权限管理','/admin/permission/remove'),('系统管理员','/admin/permission/remove'),('RBAC权限管理','/admin/permission/update'),('系统管理员','/admin/permission/update'),('RBAC权限管理','/admin/permission/view'),('系统管理员','/admin/permission/view'),('RBAC权限管理','/admin/role/*'),('系统管理员','/admin/role/*'),('RBAC权限管理','/admin/role/assign'),('系统管理员','/admin/role/assign'),('RBAC权限管理','/admin/role/create'),('系统管理员','/admin/role/create'),('RBAC权限管理','/admin/role/delete'),('系统管理员','/admin/role/delete'),('RBAC权限管理','/admin/role/index'),('系统管理员','/admin/role/index'),('RBAC权限管理','/admin/role/remove'),('系统管理员','/admin/role/remove'),('RBAC权限管理','/admin/role/update'),('系统管理员','/admin/role/update'),('RBAC权限管理','/admin/role/view'),('系统管理员','/admin/role/view'),('RBAC权限管理','/admin/route/*'),('系统管理员','/admin/route/*'),('RBAC权限管理','/admin/route/assign'),('系统管理员','/admin/route/assign'),('RBAC权限管理','/admin/route/create'),('系统管理员','/admin/route/create'),('RBAC权限管理','/admin/route/index'),('系统管理员','/admin/route/index'),('RBAC权限管理','/admin/route/refresh'),('系统管理员','/admin/route/refresh'),('RBAC权限管理','/admin/route/remove'),('系统管理员','/admin/route/remove'),('RBAC权限管理','/admin/rule/*'),('系统管理员','/admin/rule/*'),('RBAC权限管理','/admin/rule/create'),('系统管理员','/admin/rule/create'),('RBAC权限管理','/admin/rule/delete'),('系统管理员','/admin/rule/delete'),('RBAC权限管理','/admin/rule/index'),('系统管理员','/admin/rule/index'),('RBAC权限管理','/admin/rule/update'),('系统管理员','/admin/rule/update'),('RBAC权限管理','/admin/rule/view'),('系统管理员','/admin/rule/view'),('RBAC权限管理','/admin/user/*'),('系统管理员','/admin/user/*'),('RBAC权限管理','/admin/user/activate'),('系统管理员','/admin/user/activate'),('RBAC权限管理','/admin/user/change-password'),('系统管理员','/admin/user/change-password'),('RBAC权限管理','/admin/user/delete'),('系统管理员','/admin/user/delete'),('RBAC权限管理','/admin/user/index'),('系统管理员','/admin/user/index'),('RBAC权限管理','/admin/user/login'),('系统管理员','/admin/user/login'),('RBAC权限管理','/admin/user/logout'),('系统管理员','/admin/user/logout'),('RBAC权限管理','/admin/user/request-password-reset'),('系统管理员','/admin/user/request-password-reset'),('RBAC权限管理','/admin/user/reset-password'),('系统管理员','/admin/user/reset-password'),('RBAC权限管理','/admin/user/signup'),('系统管理员','/admin/user/signup'),('RBAC权限管理','/admin/user/view'),('系统管理员','/admin/user/view'),('系统管理员','/debug/*'),('系统管理员','/debug/default/*'),('系统管理员','/debug/default/db-explain'),('系统管理员','/debug/default/download-mail'),('系统管理员','/debug/default/index'),('系统管理员','/debug/default/toolbar'),('系统管理员','/debug/default/view'),('系统管理员','/debug/user/*'),('系统管理员','/debug/user/reset-identity'),('系统管理员','/debug/user/set-identity'),('系统管理员','/gii/*'),('系统管理员','/gii/default/*'),('系统管理员','/gii/default/action'),('系统管理员','/gii/default/diff'),('系统管理员','/gii/default/index'),('系统管理员','/gii/default/preview'),('系统管理员','/gii/default/view'),('媒体管理权限','/media-type/*'),('管理员','/media-type/*'),('系统管理员','/media-type/*'),('媒体管理权限','/media-type/change-name'),('媒体管理权限','/media-type/create'),('管理员','/media-type/create'),('媒体管理权限','/media-type/delete'),('管理员','/media-type/delete'),('媒体管理权限','/media-type/index'),('管理员','/media-type/index'),('媒体管理权限','/media-type/update'),('管理员','/media-type/update'),('媒体管理权限','/media-type/view'),('管理员','/media-type/view'),('管理员','/notice/*'),('系统管理员','/notice/*'),('通告管理权限','/notice/*'),('管理员','/notice/create'),('系统管理员','/notice/create'),('通告管理权限','/notice/create'),('管理员','/notice/delete'),('系统管理员','/notice/delete'),('通告管理权限','/notice/delete'),('管理员','/notice/index'),('系统管理员','/notice/index'),('通告管理权限','/notice/index'),('管理员','/notice/update'),('系统管理员','/notice/update'),('通告管理权限','/notice/update'),('管理员','/notice/view'),('系统管理员','/notice/view'),('通告管理权限','/notice/view'),('管理员','/redactor/*'),('系统管理员','/redactor/*'),('RBAC权限管理','/site/*'),('管理员','/site/*'),('系统管理员','/site/*'),('RBAC权限管理','/site/error'),('管理员','/site/error'),('系统管理员','/site/error'),('RBAC权限管理','/site/index'),('管理员','/site/index'),('系统管理员','/site/index'),('RBAC权限管理','/site/login'),('管理员','/site/login'),('系统管理员','/site/login'),('RBAC权限管理','/site/logout'),('管理员','/site/logout'),('系统管理员','/site/logout'),('用户管理权限','/user/*'),('系统管理员','/user/*'),('用户管理权限','/user/create'),('系统管理员','/user/create'),('用户管理权限','/user/delete'),('系统管理员','/user/delete'),('用户管理权限','/user/index'),('系统管理员','/user/index'),('用户管理权限','/user/update'),('系统管理员','/user/update'),('用户管理权限','/user/view'),('系统管理员','/user/view');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_type`
--

DROP TABLE IF EXISTS `media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(18) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `intro` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '简介',
  `qrcode` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '二维码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='媒体类型，如微博，推特';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_type`
--

LOCK TABLES `media_type` WRITE;
/*!40000 ALTER TABLE `media_type` DISABLE KEYS */;
INSERT INTO `media_type` VALUES (2,'wechat','<p>信二维码2222</p>','20190820/20190820150842.png'),(3,'qq','<p>qq二维码</p>','20190820/20190820143615.png'),(4,'android','<p>app二维码</p>','20190820/20190820144813.png'),(5,'ios','ios二维码','20190820/20190820143645.png'),(6,'blog','sina','20190829/20190829131630.png');
/*!40000 ALTER TABLE `media_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Notice',NULL,'/notice/index',3,'newspaper-o'),(2,'Email',NULL,'/admin-email/index',2,'envelope'),(3,'Media',NULL,'/media-type/index',1,'medium'),(4,'User',NULL,'/user/index',NULL,'user');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init',1566296767),('m170907_052038_rbac_add_index_on_auth_assignment_user_id',1566296767),('m180523_151638_rbac_updates_indexes_without_prefix',1566296768);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '标题',
  `intro` varchar(800) COLLATE utf8_unicode_ci NOT NULL COMMENT '简介',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '内容',
  `user_id` int(6) NOT NULL COMMENT '发布人',
  `created_at` int(10) NOT NULL COMMENT '发布时间',
  `lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '语言版本',
  `sort` int(6) NOT NULL COMMENT '排序',
  `status` int(1) NOT NULL COMMENT '状态',
  `title_cn` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '中文标题',
  `intro_cn` varchar(800) COLLATE utf8_unicode_ci NOT NULL COMMENT '中文介绍',
  `content_cn` text COLLATE utf8_unicode_ci NOT NULL COMMENT '中文内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'这是第一条EN','这是第一条EN','<p>这是第一条EN</p>',1,1566366507,'en',1,1,'CN_TITLE','CN_INTRO','<p>CN_CONTENT</p>'),(2,'中文通告','','<p><img src=\"http://backend.hyperland.cc/uploads/1/292f541e86-738ed2d8cee03ae2fb9abd193c04c58d.png\"></p><p><img src=\"http://backend.hyperland.cc/uploads/1/19bc916108-beef.png\">中文</p><p>第一条</p>',1,1566368877,'zh-CN',2,1,'','',''),(3,'中文通过2','2','<p>中文通过2</p><p><img src=\"http://backend.hyperland.cc/uploads/1/2f7a9c9514-738ed2d8cee03ae2fb9abd193c04c58d.png\"></p><p><br></p>',1,1566368920,'zh-CN',3,1,'','',''),(4,'222','222','<p>222</p>',1,1566555401,'language',22,1,'','',''),(5,'3222','333','<p>333</p>',1,1566555413,'language',33,1,'','',''),(6,'222','222','<p>22</p>',1,1566555429,'language',22,1,'','',''),(7,'333','333','<p>333</p>',1,1566555451,'language',3,1,'','',''),(8,'333','333','<p>3333</p>',1,1566555573,'language',3,1,'','',''),(9,'333','3333','<p>3333</p>',1,1566555604,'zh-CN',3,1,'','',''),(10,'333','3333','<p>3333333333333</p>',1,1566555668,'zh-CN',3,1,'','',''),(11,'222','222','<p>2222</p>',1,1566801568,'en',2,1,'','',''),(12,'3333','3333','<p>3333</p>',1,1566801577,'en',3,1,'','',''),(13,'4444','444','<p>444</p>',1,1566801774,'zh-CN',4,1,'','',''),(14,'55555','555','<p>555</p>',1,1566801786,'zh-CN',5,1,'','','');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_test_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `password_hash` varchar(100) NOT NULL DEFAULT '' COMMENT '密码',
  `password_reset_token` varchar(50) NOT NULL DEFAULT '' COMMENT '密码token',
  `email` varchar(20) NOT NULL DEFAULT '' COMMENT '邮箱',
  `auth_key` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NOT NULL COMMENT '更新时间',
  `access_token` varchar(64) NOT NULL DEFAULT '' COMMENT 'restful请求token',
  `allowance` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'restful剩余的允许的请求数',
  `allowance_updated_at` timestamp NOT NULL COMMENT 'restful请求的UNIX时间戳数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `access_token` (`access_token`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e','','qd_usb@26','z3sM2KZvXdk6mNXXrz25D3JoZlGXoJMC',10,'0000-00-00 00:00:00','2019-09-30 08:07:28','123',4,'0000-00-00 00:00:00'),(21,'admin333','e10adc3949ba59abbe56e057f20f883e','','','',10,'2019-09-30 07:13:52','2019-09-30 07:51:18','axukq5b27qqs97j7re1xfsg66jp5jmonc1c3d3ihpiimldkeyc6ao8xftl39ej8k',0,'0000-00-00 00:00:00'),(23,'admin222','e10adc3949ba59abbe56e057f20f883e','','','',10,'2019-09-30 07:14:53','2019-09-30 07:14:53','0stqy4adej9m1fgxf4wl4a3ik0jne17yldsdvcjqnq0qdp95mgpcm3872mhoh74z',0,'0000-00-00 00:00:00'),(25,'root','e10adc3949ba59abbe56e057f20f883e','','','',10,'2019-09-30 07:37:04','2019-09-30 07:37:04','22088xl4bcd5vuvq6ich0yazs4f1kjs3wknc04tmnx1590k591zme38w8j4d1fq2',0,'0000-00-00 00:00:00'),(28,'root2','e10adc3949ba59abbe56e057f20f883e','','','',10,'2019-09-30 07:37:37','2019-09-30 07:37:37','k1bonxyl0oc0dxxek7ulo9xg6hq9au4i9a0fz6b3is9w8dl35e8mm7fo2aq5vcl6',0,'0000-00-00 00:00:00'),(32,'admin333123','e10adc3949ba59abbe56e057f20f883e','','','',10,'2019-09-30 09:46:53','2019-09-30 09:46:53','4k9i3qn6vjk0k7w3hjrhfhxu3ofnxl5u9ztsrixay91t5irdzy0sfc8pa1uszhur',0,'0000-00-00 00:00:00');
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

-- Dump completed on 2019-09-30 18:59:28
