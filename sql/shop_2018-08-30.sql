# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.22)
# Database: shop
# Generation Time: 2018-08-30 12:31:15 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `addr` varchar(100) NOT NULL DEFAULT '' COMMENT '地址',
  `default_status` int(11) NOT NULL DEFAULT '0' COMMENT '默认状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;

INSERT INTO `address` (`id`, `uid`, `addr`, `default_status`)
VALUES
	(11,1,'啊啊啊',1),
	(12,106,'河南省郑州市高新区',0),
	(13,106,'测试地址',1);

/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table app
# ------------------------------------------------------------

DROP TABLE IF EXISTS `app`;

CREATE TABLE `app` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `link` text NOT NULL COMMENT '联系方式',
  `picture` text NOT NULL COMMENT '首页轮播图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `app` WRITE;
/*!40000 ALTER TABLE `app` DISABLE KEYS */;

INSERT INTO `app` (`id`, `link`, `picture`)
VALUES
	(1,'','');

/*!40000 ALTER TABLE `app` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `agid` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限组id',
  `ag_name` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '权限组名称',
  `ag_status` tinyint(4) DEFAULT NULL COMMENT '权限组状态',
  `enterprise` int(11) DEFAULT NULL COMMENT '所属企业',
  `project` int(11) DEFAULT NULL COMMENT '所属项目',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '操作人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`agid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;



# Dump of table auth_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_value`;

CREATE TABLE `auth_value` (
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  `group_id` int(11) NOT NULL COMMENT '权限组id',
  `value` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有权限',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` int(11) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`menu_id`,`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table buy_car
# ------------------------------------------------------------

DROP TABLE IF EXISTS `buy_car`;

CREATE TABLE `buy_car` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT 'uuid',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `goods_id` varchar(32) NOT NULL DEFAULT '' COMMENT '商品id',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `buy_car` WRITE;
/*!40000 ALTER TABLE `buy_car` DISABLE KEYS */;

INSERT INTO `buy_car` (`id`, `user_id`, `goods_id`, `number`, `create_time`)
VALUES
	('1535263399195',1,'b75643fe06b91fa4690c88d5ecd5995d',3,'2018-08-26 14:03:19'),
	('1535457357150',1,'371fbd7d52032d5feb54739c2c5722e7',3,'2018-08-28 19:55:57');

/*!40000 ALTER TABLE `buy_car` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table classify
# ------------------------------------------------------------

DROP TABLE IF EXISTS `classify`;

CREATE TABLE `classify` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类主键',
  `cl_name` varchar(20) NOT NULL COMMENT '分类名称',
  `cl_grade` tinyint(4) NOT NULL DEFAULT '0' COMMENT '分类等级',
  `cl_fid` int(11) NOT NULL DEFAULT '0' COMMENT '父级',
  `cl_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识0表示为删除1已删除',
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `classify` WRITE;
/*!40000 ALTER TABLE `classify` DISABLE KEYS */;

INSERT INTO `classify` (`cl_id`, `cl_name`, `cl_grade`, `cl_fid`, `cl_del`)
VALUES
	(1,'食品',0,0,0),
	(2,'食用油',1,1,0),
	(3,'测试分类父级',0,0,0),
	(4,'测试分类子集',1,3,0),
	(5,'粮食',0,0,0),
	(6,'大米',1,5,0),
	(7,'粮食1',0,0,0),
	(8,'大米1',1,7,0);

/*!40000 ALTER TABLE `classify` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table enterprise
# ------------------------------------------------------------

DROP TABLE IF EXISTS `enterprise`;

CREATE TABLE `enterprise` (
  `eid` int(11) NOT NULL AUTO_INCREMENT COMMENT '企业id',
  `ep_name` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '企业名称',
  `ep_short_name` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '企业简称',
  `ep_link` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '企业联系方式',
  `ep_remark` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '企业备注',
  `ep_type` tinyint(4) DEFAULT '0' COMMENT '企业类型',
  `ep_status` tinyint(4) DEFAULT '0' COMMENT '企业状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

LOCK TABLES `enterprise` WRITE;
/*!40000 ALTER TABLE `enterprise` DISABLE KEYS */;

INSERT INTO `enterprise` (`eid`, `ep_name`, `ep_short_name`, `ep_link`, `ep_remark`, `ep_type`, `ep_status`, `create_time`, `update_time`)
VALUES
	(1,X'E6B2B3E58D97E7A0BCE991ABE8BDAFE4BBB6E7A791E68A80E69C89E99990E585ACE58FB8',X'E7A0BCE991ABE8BDAFE4BBB6',X'30',X'30',0,1,'2018-07-05 11:01:38','2018-07-17 12:00:44');

/*!40000 ALTER TABLE `enterprise` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `goods_id` varchar(32) NOT NULL DEFAULT '' COMMENT '商品id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '商品标题',
  `describe` varchar(500) NOT NULL DEFAULT '' COMMENT '商品描述',
  `original_price` decimal(18,2) DEFAULT '0.00' COMMENT '原价',
  `sale_price` decimal(18,2) DEFAULT '0.00' COMMENT '促销价',
  `sale_status` tinyint(4) DEFAULT '0' COMMENT '促销状态0未促销，1促销中',
  `cover` varchar(255) DEFAULT '' COMMENT '商品封面',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态，0上架，1下架',
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `sales_volume` int(11) DEFAULT '0' COMMENT '月销量',
  `delivery_place` varchar(50) DEFAULT '' COMMENT '发货地',
  `despatch_money` decimal(18,2) DEFAULT '0.00' COMMENT '快递费',
  `pictures` varchar(1000) DEFAULT '' COMMENT 'banner图',
  `content` text COMMENT '内容',
  `update_user` int(11) NOT NULL COMMENT '更新人id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `cl_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属分类',
  `cl_fid` int(11) NOT NULL DEFAULT '0' COMMENT '所属分类父级',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;

INSERT INTO `goods` (`goods_id`, `title`, `describe`, `original_price`, `sale_price`, `sale_status`, `cover`, `status`, `stock`, `sales_volume`, `delivery_place`, `despatch_money`, `pictures`, `content`, `update_user`, `create_time`, `update_time`, `cl_id`, `cl_fid`)
VALUES
	('371fbd7d52032d5feb54739c2c5722e7','测试123456','测试123456',100.00,80.00,1,'http://192.168.31.8:8082/goods/cover/15af944b-4822-4d32-be6b-6f5ed61c9968.jpeg',0,100,0,'平顶山',2.00,'[{\"name\":\"5971a201-4b31-441f-a06a-51d09217102f.jpeg\",\"url\":\"http://192.168.31.8:8082/goods/pictures/5971a201-4b31-441f-a06a-51d09217102f.jpeg\",\"uid\":1535199778749,\"status\":\"success\"},{\"name\":\"aea7da70-9ef5-4257-8971-e955092dc019.jpeg\",\"url\":\"http://192.168.31.8:8082/goods/pictures/aea7da70-9ef5-4257-8971-e955092dc019.jpeg\",\"uid\":1535199787173,\"status\":\"success\"},{\"name\":\"f31cb36d-ff83-4b87-a542-31776468567e.jpeg\",\"url\":\"http://192.168.31.8:8082/goods/pictures/f31cb36d-ff83-4b87-a542-31776468567e.jpeg\",\"uid\":1535199812658,\"status\":\"success\"}]','<p>满10件包邮</p><p><img src=\"http://192.168.31.8:8082/goods/pictures/be11ab03-75b4-4d16-aa61-37630df8f38c.jpeg\"></p><p><br></p><p><br></p><p><br></p>',1,'2018-08-25 20:24:10','2018-08-25 20:24:10',6,5),
	('b75643fe06b91fa4690c88d5ecd5995d','测试商品001','测试商品001测试商品001测试商品001',10.00,5.00,0,'http://192.168.31.8:8082/goods/cover/8f5e4284-dd97-4293-acd9-823e6c95d089.jpeg',0,100,0,'本地',5.00,'[{\"name\":\"4f062d52-081a-4386-a1c2-79e3d19ba952.jpeg\",\"url\":\"http://192.168.31.8:8082/goods/pictures/4f062d52-081a-4386-a1c2-79e3d19ba952.jpeg\",\"uid\":1535262439787,\"status\":\"success\"},{\"name\":\"5bd96fcf-a0c4-4019-b8a4-81329f28fb27.jpeg\",\"url\":\"http://192.168.31.8:8082/goods/pictures/5bd96fcf-a0c4-4019-b8a4-81329f28fb27.jpeg\",\"uid\":1535262445815,\"status\":\"success\"}]','<p><br></p><p><img src=\"http://192.168.31.8:8082/goods/pictures/14317289-049d-4807-9972-55a90a5c700f.jpeg\"><img src=\"http://192.168.31.8:8082/goods/pictures/b4962abd-ce28-4abd-aa57-a76bdb007317.jpeg\"> </p>',1,'2018-08-26 13:48:03','2018-08-26 14:05:14',8,7),
	('c65b3d776d2c563b72bb65d2e54c635b','鲁花5s压榨花生油','食用油测试测试鲁花5s压榨花生油鲁花5s压榨花生油',60.00,50.00,0,'http://192.168.31.8:8088/goods/cover/dd0ee694-c980-49f1-9710-efca7e3530ea.png',0,100,0,'本地',0.00,'[{\"name\":\"e5fc7562-fb87-45d3-8d4d-f248b5e8424d.jpg\",\"url\":\"http://192.168.31.8:8088/goods/pictures/e5fc7562-fb87-45d3-8d4d-f248b5e8424d.jpg\",\"uid\":1533128268145,\"status\":\"success\"},{\"name\":\"6251cc45-98af-4513-b07f-ec7937aac83c.jpg\",\"url\":\"http://192.168.31.8:8088/goods/pictures/6251cc45-98af-4513-b07f-ec7937aac83c.jpg\",\"uid\":1533128272073,\"status\":\"success\"},{\"name\":\"fa579187-ed4f-4534-aad7-f1c26068d6ed.png\",\"url\":\"http://192.168.31.8:8088/goods/pictures/fa579187-ed4f-4534-aad7-f1c26068d6ed.png\",\"uid\":1533128279499,\"status\":\"success\"},{\"name\":\"19179005-f4d3-4134-b54d-c00d4fa465c8.png\",\"url\":\"http://192.168.31.8:8088/goods/pictures/19179005-f4d3-4134-b54d-c00d4fa465c8.png\",\"uid\":1533128283634,\"status\":\"success\"}]','<p>鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油</p>',1,'2018-08-01 21:08:07','2018-08-01 21:08:07',2,1),
	('c65b3d776d2c563b72bb65d2e54c635c','鲁花5s压榨花生油1','食用油测试测试鲁花5s压榨花生油鲁花5s压榨花生油',60.00,50.00,0,'http://192.168.31.8:8082/goods/cover/ccbf0515-2ed8-4aee-8bd2-192eebbf904d.jpeg',0,99,0,'本地',0.00,'[{\"name\":\"17ff1981-d320-4378-8f48-6f77a8c1f2d2.jpeg\",\"url\":\"http://192.168.31.8:8082/goods/pictures/17ff1981-d320-4378-8f48-6f77a8c1f2d2.jpeg\",\"uid\":1535195711003,\"status\":\"success\"},{\"name\":\"a0355eaa-7def-4d4f-89ee-900df8a62121.jpeg\",\"url\":\"http://192.168.31.8:8082/goods/pictures/a0355eaa-7def-4d4f-89ee-900df8a62121.jpeg\",\"uid\":1535195718851,\"status\":\"success\"},{\"name\":\"d84b945a-ed9b-4220-9901-c82333898008.jpeg\",\"url\":\"http://192.168.31.8:8082/goods/pictures/d84b945a-ed9b-4220-9901-c82333898008.jpeg\",\"uid\":1535195722844,\"status\":\"success\"},{\"name\":\"6647b651-bcbc-41ab-8fbe-ba9a7d216f6b.jpeg\",\"url\":\"http://192.168.31.8:8082/goods/pictures/6647b651-bcbc-41ab-8fbe-ba9a7d216f6b.jpeg\",\"uid\":1535195727489,\"status\":\"success\"}]','<p>鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油鲁花5s压榨花生油</p>',1,'2018-08-25 19:15:30','2018-08-25 19:16:22',2,1),
	('ce5d8b79df35c85bcdbc1896a0233f10','测试商品3','测试商品2',10.00,5.00,0,'http://192.168.31.8:8082/goods/cover/4798de34-5249-4a32-8930-94a89b00a0f6.png',0,98,0,'本地',5.00,'[{\"name\":\"d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"uid\":1535120228760,\"status\":\"success\"},{\"name\":\"e9162079-6930-478f-8915-c71c6cc25b44.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/e9162079-6930-478f-8915-c71c6cc25b44.png\",\"uid\":1535120231657,\"status\":\"success\"},{\"name\":\"cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"uid\":1535120235334,\"status\":\"success\"}]','<p>测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品</p>',1,'2018-08-24 22:17:21','2018-08-25 18:18:38',2,1),
	('ce5d8b79df35c85bcdbc1896a0233f11','测试商品2','测试商品2',10.00,5.00,0,'http://192.168.31.8:8082/goods/cover/4798de34-5249-4a32-8930-94a89b00a0f6.png',0,98,0,'本地',5.00,'[{\"name\":\"d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"uid\":1535120228760,\"status\":\"success\"},{\"name\":\"e9162079-6930-478f-8915-c71c6cc25b44.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/e9162079-6930-478f-8915-c71c6cc25b44.png\",\"uid\":1535120231657,\"status\":\"success\"},{\"name\":\"cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"uid\":1535120235334,\"status\":\"success\"}]','<p>测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品</p>',1,'2018-08-24 22:17:21','2018-08-24 22:53:12',2,1),
	('ce5d8b79df35c85bcdbc1896a0233fb1','测试商品1','测试商品1',10.00,5.00,0,'http://192.168.31.8:8082/goods/cover/4798de34-5249-4a32-8930-94a89b00a0f6.png',0,98,0,'本地',5.00,'[{\"name\":\"d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"uid\":1535120228760,\"status\":\"success\"},{\"name\":\"e9162079-6930-478f-8915-c71c6cc25b44.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/e9162079-6930-478f-8915-c71c6cc25b44.png\",\"uid\":1535120231657,\"status\":\"success\"},{\"name\":\"cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"uid\":1535120235334,\"status\":\"success\"}]','<p>测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品</p>',1,'2018-08-24 22:17:21','2018-08-24 22:53:12',2,1),
	('ce5d8b79df35c85bcdbc1896a0233fb2','测试商品4','测试商品',10.00,5.00,0,'http://192.168.31.8:8082/goods/cover/4798de34-5249-4a32-8930-94a89b00a0f6.png',0,98,0,'本地',5.00,'[{\"name\":\"d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"uid\":1535120228760,\"status\":\"success\"},{\"name\":\"e9162079-6930-478f-8915-c71c6cc25b44.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/e9162079-6930-478f-8915-c71c6cc25b44.png\",\"uid\":1535120231657,\"status\":\"success\"},{\"name\":\"cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"uid\":1535120235334,\"status\":\"success\"}]','<p>测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品</p>',1,'2018-08-24 22:17:21','2018-08-25 18:18:41',2,1),
	('ce5d8b79df35c85bcdbc1896a0233fb3','测试商品5','测试商品2',10.00,5.00,0,'http://192.168.31.8:8082/goods/cover/4798de34-5249-4a32-8930-94a89b00a0f6.png',0,98,0,'本地',5.00,'[{\"name\":\"d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"uid\":1535120228760,\"status\":\"success\"},{\"name\":\"e9162079-6930-478f-8915-c71c6cc25b44.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/e9162079-6930-478f-8915-c71c6cc25b44.png\",\"uid\":1535120231657,\"status\":\"success\"},{\"name\":\"cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"uid\":1535120235334,\"status\":\"success\"}]','<p>测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品</p>',1,'2018-08-24 22:17:21','2018-08-25 18:18:43',2,1),
	('ce5d8b79df35c85bcdbc1896a0233fb4','测试商品6','测试商品2',10.00,5.00,0,'http://192.168.31.8:8082/goods/cover/4798de34-5249-4a32-8930-94a89b00a0f6.png',0,98,0,'本地',5.00,'[{\"name\":\"d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"uid\":1535120228760,\"status\":\"success\"},{\"name\":\"e9162079-6930-478f-8915-c71c6cc25b44.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/e9162079-6930-478f-8915-c71c6cc25b44.png\",\"uid\":1535120231657,\"status\":\"success\"},{\"name\":\"cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"uid\":1535120235334,\"status\":\"success\"}]','<p>测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品</p>',1,'2018-08-24 22:17:21','2018-08-25 18:18:46',2,1),
	('ce5d8b79df35c85bcdbc1896a0233fb5','测试商品7','测试商品2',10.00,5.00,0,'http://192.168.31.8:8082/goods/cover/4798de34-5249-4a32-8930-94a89b00a0f6.png',0,98,0,'本地',5.00,'[{\"name\":\"d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"uid\":1535120228760,\"status\":\"success\"},{\"name\":\"e9162079-6930-478f-8915-c71c6cc25b44.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/e9162079-6930-478f-8915-c71c6cc25b44.png\",\"uid\":1535120231657,\"status\":\"success\"},{\"name\":\"cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"uid\":1535120235334,\"status\":\"success\"}]','<p>测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品</p>',1,'2018-08-24 22:17:21','2018-08-25 18:18:48',2,1),
	('ce5d8b79df35c85bcdbc1896a0233fb6','测试商品8','测试商品2',10.00,5.00,0,'http://192.168.31.8:8082/goods/cover/4798de34-5249-4a32-8930-94a89b00a0f6.png',0,98,0,'本地',5.00,'[{\"name\":\"d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"uid\":1535120228760,\"status\":\"success\"},{\"name\":\"e9162079-6930-478f-8915-c71c6cc25b44.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/e9162079-6930-478f-8915-c71c6cc25b44.png\",\"uid\":1535120231657,\"status\":\"success\"},{\"name\":\"cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"uid\":1535120235334,\"status\":\"success\"}]','<p>测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品</p>',1,'2018-08-24 22:17:21','2018-08-25 18:18:50',2,1),
	('ce5d8b79df35c85bcdbc1896a0233fb7','测试商品9','测试商品2',10.00,5.00,0,'http://192.168.31.8:8082/goods/cover/4798de34-5249-4a32-8930-94a89b00a0f6.png',0,98,0,'本地',5.00,'[{\"name\":\"d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"uid\":1535120228760,\"status\":\"success\"},{\"name\":\"e9162079-6930-478f-8915-c71c6cc25b44.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/e9162079-6930-478f-8915-c71c6cc25b44.png\",\"uid\":1535120231657,\"status\":\"success\"},{\"name\":\"cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"uid\":1535120235334,\"status\":\"success\"}]','<p>测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品</p>',1,'2018-08-24 22:17:21','2018-08-25 18:18:52',2,1),
	('ce5d8b79df35c85bcdbc1896a0233fb8','测试商品10','测试商品2',10.00,5.00,0,'http://192.168.31.8:8082/goods/cover/4798de34-5249-4a32-8930-94a89b00a0f6.png',0,97,0,'本地',5.00,'[{\"name\":\"d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"uid\":1535120228760,\"status\":\"success\"},{\"name\":\"e9162079-6930-478f-8915-c71c6cc25b44.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/e9162079-6930-478f-8915-c71c6cc25b44.png\",\"uid\":1535120231657,\"status\":\"success\"},{\"name\":\"cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"uid\":1535120235334,\"status\":\"success\"}]','<p>测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品12324</p>',1,'2018-08-24 22:17:21','2018-08-25 19:21:59',2,1),
	('ce5d8b79df35c85bcdbc1896a0233fb9','测试商品11','测试商品2',10.00,5.00,0,'http://192.168.31.8:8082/goods/cover/4798de34-5249-4a32-8930-94a89b00a0f6.png',0,97,0,'本地',5.00,'[{\"name\":\"d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/d1eabd1e-92cc-445d-9df1-680d7535f8e9.png\",\"uid\":1535120228760,\"status\":\"success\"},{\"name\":\"e9162079-6930-478f-8915-c71c6cc25b44.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/e9162079-6930-478f-8915-c71c6cc25b44.png\",\"uid\":1535120231657,\"status\":\"success\"},{\"name\":\"cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"url\":\"http://192.168.31.8:8082/goods/pictures/cf4379d5-fce9-4301-a77c-9c086af64f92.png\",\"uid\":1535120235334,\"status\":\"success\"}]','<p>测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品测试商品</p>',1,'2018-08-24 22:17:21','2018-08-25 19:11:22',2,1);

/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `mid` int(11) NOT NULL AUTO_INCREMENT COMMENT ' 菜单id',
  `menu_name` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '菜单页面地址',
  `menu_api` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '菜单api地址',
  `menu_fmid` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  `menu_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `menu_level` tinyint(4) DEFAULT '1' COMMENT '菜单等级',
  `enterprise` int(11) NOT NULL COMMENT '所属企业',
  `project` int(11) DEFAULT '0' COMMENT '所属项目',
  `update_user` int(11) NOT NULL COMMENT '更新人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;

INSERT INTO `menu` (`mid`, `menu_name`, `menu_url`, `menu_api`, `menu_fmid`, `menu_status`, `menu_level`, `enterprise`, `project`, `update_user`, `create_time`, `update_time`)
VALUES
	(1,X'E88F9CE58D95E58897E8A1A8',X'2F',X'2F',0,0,1,0,0,1,'2018-07-24 20:49:29','2018-07-24 20:49:29'),
	(22,X'E794A8E688B7E7AEA1E79086',X'2F75736572',X'',1,0,2,0,0,1,'2018-07-24 20:50:53','2018-07-24 20:50:53'),
	(23,X'E69D83E99990E7AEA1E79086',X'2F61757468',X'',1,0,2,0,0,1,'2018-07-24 20:51:10','2018-07-24 20:51:10'),
	(24,X'E59586E59381E7AEA1E79086',X'2F676F6F6473',X'',1,0,2,0,0,1,'2018-07-24 20:51:31','2018-07-24 20:51:31'),
	(25,X'E7AEA1E79086E59198E799BBE5BD95',X'2F61646D696E2F6C6F67696E',X'2F757365722F6C6F67696E',22,0,3,0,0,1,'2018-07-24 20:53:36','2018-07-24 20:53:36'),
	(26,X'E794A8E688B7E799BBE5BD95',X'2F70686F6E652F757365722F6C6F67696E',X'2F757365722F6C6F67696E',22,0,3,0,0,1,'2018-07-24 20:55:16','2018-07-24 20:55:16'),
	(28,X'E794A8E688B7E58897E8A1A8',X'',X'2F757365722F757365724C697374',1,1,2,0,0,1,'2018-07-24 20:57:41','2018-07-24 20:57:41');

/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '订单id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `order_amount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `despatch_money` decimal(18,2) NOT NULL COMMENT '快递费',
  `offer` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '优惠',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `addr_id` int(11) NOT NULL COMMENT '收货地址',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;

INSERT INTO `order` (`order_id`, `user_id`, `order_amount`, `despatch_money`, `offer`, `status`, `create_time`, `addr_id`)
VALUES
	('1535024318569178',1,240.00,0.00,0.00,0,'2018-08-23 19:38:38',11),
	('1535024480883598',1,60.00,0.00,0.00,0,'2018-08-23 19:41:20',11),
	('1535120473140989',1,80.00,10.00,0.00,0,'2018-08-24 22:21:13',11),
	('1535122392070053',1,80.00,10.00,0.00,0,'2018-08-24 22:53:12',11),
	('1535195482722136',1,20.00,10.00,0.00,0,'2018-08-25 19:11:22',11),
	('1535263381716182',1,10.00,5.00,0.00,0,'2018-08-26 14:03:01',11);

/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
  `od_id` varchar(35) NOT NULL DEFAULT '' COMMENT '详情id',
  `order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '订单id',
  `goods_id` varchar(32) NOT NULL DEFAULT '' COMMENT '商品id',
  `number` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `transaction_price` decimal(18,2) NOT NULL COMMENT '成交价',
  PRIMARY KEY (`od_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;

INSERT INTO `order_details` (`od_id`, `order_id`, `goods_id`, `number`, `transaction_price`)
VALUES
	('15350243185691780000','1535024318569178','c65b3d776d2c563b72bb65d2e54c635b',1,60.00),
	('15350243185691780001','1535024318569178','c65b3d776d2c563b72bb65d2e54c635c',3,60.00),
	('15350244808835980000','1535024480883598','c65b3d776d2c563b72bb65d2e54c635c',1,60.00),
	('15351204731409890000','1535120473140989','c65b3d776d2c563b72bb65d2e54c635c',1,60.00),
	('15351204731409890001','1535120473140989','ce5d8b79df35c85bcdbc1896a0233fb2',2,10.00),
	('15351223920700530000','1535122392070053','c65b3d776d2c563b72bb65d2e54c635c',1,60.00),
	('15351223920700530001','1535122392070053','ce5d8b79df35c85bcdbc1896a0233fb2',2,10.00),
	('15351954827221360000','1535195482722136','ce5d8b79df35c85bcdbc1896a0233fb8',1,10.00),
	('15351954827221360001','1535195482722136','ce5d8b79df35c85bcdbc1896a0233fb9',1,10.00),
	('15352633817161820000','1535263381716182','b75643fe06b91fa4690c88d5ecd5995d',1,10.00);

/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_info`;

CREATE TABLE `order_info` (
  `order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '订单id',
  `goods_id` varchar(11) NOT NULL DEFAULT '' COMMENT '商品id',
  `original_price` decimal(18,2) DEFAULT '0.00' COMMENT '原价',
  `sale_price` decimal(18,2) DEFAULT '0.00' COMMENT '促销价',
  `sale_status` tinyint(4) DEFAULT '0' COMMENT '促销状态',
  `number` int(11) DEFAULT '1' COMMENT '数量',
  `price` decimal(18,2) DEFAULT '0.00' COMMENT '价格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table order_master
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_master`;

CREATE TABLE `order_master` (
  `order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '订单id',
  `money` decimal(18,2) DEFAULT '0.00' COMMENT '订单金额',
  `status` tinyint(4) DEFAULT '0' COMMENT '订单状态',
  `despatch_money` decimal(18,2) DEFAULT '0.00' COMMENT '订单运费',
  `address_id` int(11) DEFAULT '0' COMMENT '收货地址id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `order_user` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(128) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '密码',
  `phone` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '邮箱',
  `enterprise` int(11) DEFAULT '1' COMMENT '所属企业',
  `header` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '头像',
  `auth_group` int(11) DEFAULT '0' COMMENT '所属权限组',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `admin` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为管理员',
  PRIMARY KEY (`uid`),
  KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`uid`, `username`, `password`, `phone`, `email`, `enterprise`, `header`, `auth_group`, `status`, `create_time`, `update_time`, `admin`)
VALUES
	(1,X'6C6872',X'6164323136306634356435376561366632366332363532373063353431663531',X'3139393337313530323138',X'6C697568616F72616E40686E7478726A2E636F6D',1,X'',1,0,'2018-06-28 15:43:47','2018-08-25 18:58:49',1),
	(105,X'6C6872',X'3563653335663634323236663230323034306138386632363062643062393530',X'3139393337313530323131',X'',0,X'',0,0,'2018-08-25 19:06:26','2018-08-25 19:06:26',0),
	(106,X'E6B58BE8AF95E794A8E688B7',X'3563653335663634323236663230323034306138386632363062643062393530',X'3132333435363738393131',X'',0,X'',0,0,'2018-08-25 20:31:31','2018-08-25 20:31:31',0);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_login
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_login`;

CREATE TABLE `user_login` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_token` varchar(32) NOT NULL DEFAULT '' COMMENT '登录获取token',
  `login_ip` varchar(20) NOT NULL DEFAULT '0.0.0.0' COMMENT '登录ip',
  `login_address` varchar(50) DEFAULT '未知' COMMENT '登录地址',
  `login_app` varchar(20) DEFAULT '未知' COMMENT '登录应用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `expire_time` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `user_login` WRITE;
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;

INSERT INTO `user_login` (`id`, `user_id`, `user_token`, `login_ip`, `login_address`, `login_app`, `create_time`, `expire_time`)
VALUES
	('0d8bf825bc2c221bcaadbca2307e7d41',1,'97079f54645294856819a3ee74c50b05','192.168.31.8','未知','未知','2018-08-25 18:52:02','2018-09-24 18:52:03'),
	('2fa12ca03d16b7670d51fbda7216716c',1,'53995cc19fed5427fffe6442a00dca71','192.168.31.8','未知','未知','2018-08-26 13:32:00','2018-09-25 13:32:00'),
	('4b2ccefc0f90e8e588a2a8cb4888b2c9',1,'424d11cb754efb4b5480187245cc76c8','192.168.31.8','未知','未知','2018-08-25 19:11:01','2018-09-24 19:11:02'),
	('5e831b737597ecc0df6e7b97ba354986',1,'9dad27e8052de84e38f7df2191681579','192.168.31.8','未知','未知','2018-08-25 19:11:43','2018-09-24 19:11:43'),
	('77577a5d3ab80766170249adc141bd59',1,'72bf5ca14fb16a31c31f58a23a4e497a','192.168.31.8','未知','未知','2018-08-26 14:17:08','2018-09-25 14:17:08'),
	('8cc0c0e50d54ef4b95cfcbeb7795ae9f',1,'0fcc21522ab654763721329ff312e4a6','192.168.31.8','未知','未知','2018-08-25 19:33:24','2018-09-24 19:33:25'),
	('9ae4c91a89f0eac660e3e32394d87672',1,'1779b01aab7232da13c19062b833b9a4','192.168.31.8','未知','未知','2018-08-25 18:53:47','2018-09-24 18:53:48'),
	('9f9f9848f92bf9c6c3dc3bc99ccf7649',1,'47a853c471a36e7ec9c9f995f450cb2a','192.168.31.8','未知','未知','2018-08-28 20:44:03','2018-09-27 20:44:03'),
	('a75b37c05671fc600f256dca27b2f2b2',1,'de1765ecb9981be223cbc6703be2a2a9','192.168.31.10','未知','未知','2018-08-25 19:27:13','2018-09-24 19:27:13'),
	('aeb13d95fce978aaf43cece3108cc0ee',1,'ada08e3fe13ac8f777fa1266507a4670','192.168.31.8','未知','未知','2018-08-28 19:27:33','2018-09-27 19:27:33'),
	('af7185bfa4487a127aecf88b1fcdffdf',1,'a7d410707e136173160e2f3438b54b7e','192.168.31.8','未知','未知','2018-08-25 19:33:48','2018-09-24 19:33:48'),
	('bace1c5bd9710e05061401d15957fc3c',1,'aca6d5a9c94323829804a95d254834bc','192.168.31.8','未知','未知','2018-08-28 19:24:48','2018-09-27 19:24:49'),
	('e416cfdbcf45a0b4db244b5302a8afa9',106,'acf461e0c470bed900a7f566fe53d646','192.168.31.8','未知','未知','2018-08-25 20:31:42','2018-09-24 20:31:43'),
	('f1623ff650da2f52c9721cb530c1f106',1,'7f7363dd443751db48c7c849d6ab4b25','192.168.31.8','未知','未知','2018-08-25 18:52:50','2018-09-24 18:52:50'),
	('fe67f4f68426636878aa1950a7a084d0',1,'e6f24799c214a514fd96c7b3c6d48e11','192.168.31.8','未知','未知','2018-08-25 19:32:10','2018-09-24 19:32:11');

/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
