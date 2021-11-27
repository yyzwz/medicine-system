-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.26 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 medicine 的数据库结构
DROP DATABASE IF EXISTS `medicine`;
CREATE DATABASE IF NOT EXISTS `medicine` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_croatian_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `medicine`;

-- 导出  表 medicine.t_department 结构
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE IF NOT EXISTS `t_department` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_parent` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  medicine.t_department 的数据：~11 rows (大约)
DELETE FROM `t_department`;
/*!40000 ALTER TABLE `t_department` DISABLE KEYS */;
INSERT INTO `t_department` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `parent_id`, `sort_order`, `status`, `title`, `is_parent`) VALUES
	(40322777781112832, '', '2018-08-10 20:40:40', 0, '', '2018-08-11 00:03:06', 0, 1.00, 0, '总部', b'1'),
	(40322811096469504, '', '2018-08-10 20:40:48', 0, '', '2018-08-11 00:27:05', 40322777781112832, 1.00, 0, '技术部', b'1'),
	(40322852833988608, '', '2018-08-10 20:40:58', 0, '', '2018-08-11 01:29:42', 40322811096469504, 1.00, 0, '研发中心', NULL),
	(40327204755738624, '', '2018-08-10 20:58:15', 0, '', '2018-08-10 22:02:15', 40322811096469504, 2.00, 0, '大数据', NULL),
	(40327253309001728, '', '2018-08-10 20:58:27', 0, '', '2018-08-11 17:26:38', 40322811096469504, 3.00, -1, '人工智障', NULL),
	(40343262766043136, '', '2018-08-10 22:02:04', 0, '', '2018-08-11 00:02:53', 0, 2.00, 0, '成都分部', b'1'),
	(40344005342400512, '', '2018-08-10 22:05:01', 0, '', '2018-08-11 17:48:44', 40343262766043136, 2.00, 0, 'Vue', NULL),
	(40389030113710080, '', '2018-08-11 01:03:56', 0, '', '2018-08-11 17:50:04', 40343262766043136, 1.00, 0, 'JAVA', b'0'),
	(40652270295060480, '', '2018-08-11 18:29:57', 0, '', '2018-08-12 18:45:01', 0, 3.00, 0, '人事部', b'1'),
	(40652338142121984, NULL, '2018-08-11 18:30:13', 0, NULL, '2018-08-11 18:30:13', 40652270295060480, 1.00, 0, '游客', b'0'),
	(40681289119961088, '', '2018-08-11 20:25:16', 0, '', '2018-08-11 22:47:48', 40652270295060480, 2.00, 0, 'VIP', b'0');
/*!40000 ALTER TABLE `t_department` ENABLE KEYS */;

-- 导出  表 medicine.t_department_header 结构
DROP TABLE IF EXISTS `t_department_header`;
CREATE TABLE IF NOT EXISTS `t_department_header` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  medicine.t_department_header 的数据：~3 rows (大约)
DELETE FROM `t_department_header`;
/*!40000 ALTER TABLE `t_department_header` DISABLE KEYS */;
INSERT INTO `t_department_header` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `department_id`, `type`, `user_id`) VALUES
	(1254427833757995008, 'admin', '2020-04-26 23:11:16', 0, 'admin', '2020-04-26 23:11:16', 40322777781112832, 0, 682265633886208),
	(1254427833757995009, 'admin', '2020-04-26 23:11:16', 0, 'admin', '2020-04-26 23:11:16', 40322777781112832, 0, 16739222421508096),
	(1254427833757995010, 'admin', '2020-04-26 23:11:16', 0, 'admin', '2020-04-26 23:11:16', 40322777781112832, 1, 16739222421508096);
/*!40000 ALTER TABLE `t_department_header` ENABLE KEYS */;

-- 导出  表 medicine.t_dict 结构
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE IF NOT EXISTS `t_dict` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  medicine.t_dict 的数据：~7 rows (大约)
DELETE FROM `t_dict`;
/*!40000 ALTER TABLE `t_dict` DISABLE KEYS */;
INSERT INTO `t_dict` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `description`, `title`, `type`, `sort_order`) VALUES
	(75135930788220928, 'admin', '2018-11-14 22:15:43', 0, 'admin', '2018-11-27 01:39:06', '', '性别', 'sex', 0.00),
	(75383353938808832, 'admin', '2018-11-15 14:38:53', 0, 'admin', '2018-11-27 01:39:15', '', '消息类型', 'message_type', 1.00),
	(75388696739713024, 'admin', '2018-11-15 15:00:07', 0, 'admin', '2018-11-27 01:39:22', '', '按钮权限类型', 'permission_type', 2.00),
	(81843858882695168, 'admin', '2018-12-03 10:30:38', 0, 'admin', '2018-12-03 10:30:49', '', '优先级', 'priority', 5.00),
	(99020862912466944, 'admin', '2019-01-19 20:05:54', 0, 'admin', '2019-01-19 20:06:10', '', '请假类型', 'leave_type', 8.00),
	(1337558960772878336, 'admin', '2020-12-12 08:44:42', 0, 'admin', '2020-12-12 08:44:42', '', '药物类型', 'medicineType', 5.00),
	(1337560969819328513, 'admin', '2020-12-12 08:52:41', 0, 'admin', '2020-12-12 08:52:41', '', '门诊类型', 'examineType', 6.00);
/*!40000 ALTER TABLE `t_dict` ENABLE KEYS */;

-- 导出  表 medicine.t_dict_data 结构
DROP TABLE IF EXISTS `t_dict_data`;
CREATE TABLE IF NOT EXISTS `t_dict_data` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `dict_id` bigint unsigned DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sort_order` (`sort_order`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  medicine.t_dict_data 的数据：~39 rows (大约)
DELETE FROM `t_dict_data`;
/*!40000 ALTER TABLE `t_dict_data` DISABLE KEYS */;
INSERT INTO `t_dict_data` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `description`, `dict_id`, `sort_order`, `status`, `title`, `value`) VALUES
	(75158227712479232, 'admin', '2018-11-14 23:44:19', 0, 'admin', '2019-04-01 23:53:13', '', 75135930788220928, 0.00, 0, '男', '男'),
	(75159254272577536, 'admin', '2018-11-14 23:48:24', 0, 'admin', '2019-04-01 23:53:17', '', 75135930788220928, 1.00, 0, '女', '女'),
	(75159898425397248, 'admin', '2018-11-14 23:50:57', 0, 'admin', '2019-04-01 23:53:22', '', 75135930788220928, 2.00, -1, '保密', '保密'),
	(75385648017575936, 'admin', '2018-11-15 14:48:00', 0, 'admin', '2019-04-02 00:10:36', '', 75383353938808832, 0.00, 0, '系统公告', '系统公告'),
	(75385706913992704, 'admin', '2018-11-15 14:48:14', 0, 'admin', '2019-04-02 00:10:32', '', 75383353938808832, 1.00, 0, '提醒', '提醒'),
	(75385774274514944, 'admin', '2018-11-15 14:48:30', 0, 'admin', '2019-04-02 00:10:28', '', 75383353938808832, 2.00, 0, '私信', '私信'),
	(75390787835138048, 'admin', '2018-11-15 15:08:26', 0, 'admin', '2018-11-15 15:08:26', '', 75388696739713024, 0.00, 0, '查看操作(view)', 'view'),
	(75390886501945344, 'admin', '2018-11-15 15:08:49', 0, 'admin', '2018-11-15 15:08:57', '', 75388696739713024, 1.00, 0, '添加操作(add)', 'add'),
	(75390993939042304, 'admin', '2018-11-15 15:09:15', 0, 'admin', '2018-11-15 15:09:15', '', 75388696739713024, 2.00, 0, '编辑操作(edit)', 'edit'),
	(75391067532300288, 'admin', '2018-11-15 15:09:32', 0, 'admin', '2018-11-15 15:09:32', '', 75388696739713024, 3.00, 0, '删除操作(delete)', 'delete'),
	(75391126902673408, 'admin', '2018-11-15 15:09:46', 0, 'admin', '2018-11-15 15:09:46', '', 75388696739713024, 4.00, 0, '清空操作(clear)', 'clear'),
	(75391192883269632, 'admin', '2018-11-15 15:10:02', 0, 'admin', '2018-11-15 15:10:02', '', 75388696739713024, 5.00, 0, '启用操作(enable)', 'enable'),
	(75391251024711680, 'admin', '2018-11-15 15:10:16', 0, 'admin', '2018-11-15 15:10:16', '', 75388696739713024, 6.00, 0, '禁用操作(disable)', 'disable'),
	(75391297124306944, 'admin', '2018-11-15 15:10:27', 0, 'admin', '2018-11-15 15:10:27', '', 75388696739713024, 7.00, 0, '搜索操作(search)', 'search'),
	(75391343379091456, 'admin', '2018-11-15 15:10:38', 0, 'admin', '2018-11-15 15:10:38', '', 75388696739713024, 8.00, 0, '上传文件(upload)', 'upload'),
	(75391407526776832, 'admin', '2018-11-15 15:10:53', 0, 'admin', '2018-11-15 15:10:53', '', 75388696739713024, 9.00, 0, '导出操作(output)', 'output'),
	(75391475042488320, 'admin', '2018-11-15 15:11:09', 0, 'admin', '2018-11-15 15:11:09', '', 75388696739713024, 10.00, 0, '导入操作(input)', 'input'),
	(75391522182270976, 'admin', '2018-11-15 15:11:21', 0, 'admin', '2018-11-15 15:11:21', '', 75388696739713024, 11.00, 0, '分配权限(editPerm)', 'editPerm'),
	(75391576364290048, 'admin', '2018-11-15 15:11:34', 0, 'admin', '2018-11-15 15:11:34', '', 75388696739713024, 12.00, 0, '设为默认(setDefault)', 'setDefault'),
	(75391798033256448, 'admin', '2018-11-15 15:12:26', 0, 'admin', '2018-11-15 15:12:26', '', 75388696739713024, 13.00, 0, '其他操作(other)', 'other'),
	(81843987719131136, 'admin', '2018-12-03 10:31:08', 0, 'admin', '2018-12-03 10:31:08', '', 81843858882695168, 0.00, 0, '普通', '0'),
	(81844044015079424, 'admin', '2018-12-03 10:31:22', 0, 'admin', '2018-12-03 10:31:22', '', 81843858882695168, 1.00, 0, '重要', '1'),
	(81844100705292288, 'admin', '2018-12-03 10:31:35', 0, 'admin', '2018-12-03 10:31:35', '', 81843858882695168, 2.00, 0, '紧急', '2'),
	(99020985985929216, 'admin', '2019-01-19 20:06:23', 0, 'admin', '2019-04-01 23:55:48', '', 99020862912466944, 0.00, 0, '年假', '年假'),
	(99021020739932160, 'admin', '2019-01-19 20:06:32', 0, 'admin', '2019-04-01 23:55:52', '', 99020862912466944, 1.00, 0, '事假', '事假'),
	(99021195566911488, 'admin', '2019-01-19 20:07:13', 0, 'admin', '2019-04-01 23:55:56', '', 99020862912466944, 2.00, 0, '病假', '病假'),
	(99021242476007424, 'admin', '2019-01-19 20:07:24', 0, 'admin', '2019-04-01 23:56:01', '', 99020862912466944, 3.00, 0, '调休', '调休'),
	(99021300730695680, 'admin', '2019-01-19 20:07:38', 0, 'admin', '2019-04-01 23:56:05', '', 99020862912466944, 4.00, 0, '产假', '产假'),
	(99021341889400832, 'admin', '2019-01-19 20:07:48', 0, 'admin', '2019-04-01 23:56:10', '', 99020862912466944, 5.00, 0, '陪产假', '陪产假'),
	(99021382393794560, 'admin', '2019-01-19 20:07:58', 0, 'admin', '2019-04-01 23:56:14', '', 99020862912466944, 6.00, 0, '婚假', '婚假'),
	(99021437171404800, 'admin', '2019-01-19 20:08:11', 0, 'admin', '2019-04-01 23:56:18', '', 99020862912466944, 7.00, 0, '例假', '例假'),
	(99021497724571648, 'admin', '2019-01-19 20:08:25', 0, 'admin', '2019-04-01 23:56:23', '', 99020862912466944, 8.00, 0, '丧假', '丧假'),
	(99021556704874496, 'admin', '2019-01-19 20:08:39', 0, 'admin', '2019-04-01 23:56:27', '', 99020862912466944, 9.00, 0, '哺乳假', '哺乳假'),
	(1337559031413346304, 'admin', '2020-12-12 08:44:58', 0, 'admin', '2021-01-17 10:20:15', '', 1337558960772878336, 1.00, 0, '一级手术', '一级手术'),
	(1337559056939880449, 'admin', '2020-12-12 08:45:04', 0, 'admin', '2021-01-17 10:20:19', '', 1337558960772878336, 2.00, 0, '二级手术', '二级手术'),
	(1337559094038499329, 'admin', '2020-12-12 08:45:13', 0, 'admin', '2021-01-17 10:20:22', '', 1337558960772878336, 3.00, 0, '三级手术', '三级手术'),
	(1337561074496573440, 'admin', '2020-12-12 08:53:06', 0, 'admin', '2021-01-17 10:19:48', '', 1337560969819328513, 1.00, 0, 'A类大病门诊', 'A类大病门诊'),
	(1337561119761502208, 'admin', '2020-12-12 08:53:16', 0, 'admin', '2021-01-17 10:19:56', '', 1337560969819328513, 2.00, 0, 'B类大病门诊', 'B类大病门诊'),
	(1337561149687861249, 'admin', '2020-12-12 08:53:23', 0, 'admin', '2021-01-17 10:20:02', '', 1337560969819328513, 3.00, 0, 'C类大病门诊', 'C类大病门诊');
/*!40000 ALTER TABLE `t_dict_data` ENABLE KEYS */;

-- 导出  表 medicine.t_examine 结构
DROP TABLE IF EXISTS `t_examine`;
CREATE TABLE IF NOT EXISTS `t_examine` (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `insurance_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `insurance_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

-- 正在导出表  medicine.t_examine 的数据：~7 rows (大约)
DELETE FROM `t_examine`;
/*!40000 ALTER TABLE `t_examine` DISABLE KEYS */;
INSERT INTO `t_examine` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `insurance_id`, `insurance_name`, `money`, `status`, `user_id`, `user_name`, `message`) VALUES
	('1337742682793054208', 'admin', '2020-12-12 20:54:44.302000', 0, 'admin', '2020-12-12 21:05:35.434000', '1337709526010433537', '基本医疗保险', '409.172', '审核通过', '1337360883575296000', '张三', '审核通过,已报销!'),
	('1340929408856363008', 'admin', '2020-12-21 15:57:38.998000', 0, 'admin', '2020-12-21 15:59:57.287000', '1337933430834466817', '高档医疗保险', '167.69', '审核通过', '1337933671960809473', '李四', '审核通过,已报销!'),
	('1340929850206195712', 'admin', '2020-12-21 15:59:24.220000', 0, NULL, NULL, '1337709526010433537', '基本医疗保险', '432.94', '待审核', '1337360883575296000', '张三', NULL),
	('1340929947266584576', 'admin', '2020-12-21 15:59:47.361000', 0, 'admin', '2021-01-17 10:48:50.922000', '1337933430834466817', '高档医疗保险', '6288.82', '审核不通过', '1337933671960809473', '李四', '该病不予报销'),
	('1350633403602571264', 'admin', '2021-01-17 10:37:51.633000', 0, 'admin', '2021-01-17 10:43:38.843000', '1337933430834466817', '高档医疗保险', '8060.0', '审核不通过', '1337933671960809473', '李四', '该病不予报销'),
	('1350636890465898496', 'admin', '2021-01-17 10:51:42.967000', 0, 'admin', '2021-01-17 10:54:14.996000', '1337933430834466817', '高档医疗保险', '1860.0', '审核不通过', '1337933671960809473', '李四', '该病不予报销'),
	('1355751405767495680', 'admin', '2021-01-31 13:34:58.442000', 0, 'company', '2021-01-31 13:36:18.332000', '1337933430834466817', '高档医疗保险', '8460.0', '审核通过', '1337933671960809473', '李四', '审核通过,已报销!');
/*!40000 ALTER TABLE `t_examine` ENABLE KEYS */;

-- 导出  表 medicine.t_file 结构
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE IF NOT EXISTS `t_file` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `f_key` varchar(255) DEFAULT NULL,
  `location` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  medicine.t_file 的数据：~0 rows (大约)
DELETE FROM `t_file`;
/*!40000 ALTER TABLE `t_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_file` ENABLE KEYS */;

-- 导出  表 medicine.t_insurance 结构
DROP TABLE IF EXISTS `t_insurance`;
CREATE TABLE IF NOT EXISTS `t_insurance` (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `big` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `common` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `mine` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `one` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `three` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `two` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

-- 正在导出表  medicine.t_insurance 的数据：~3 rows (大约)
DELETE FROM `t_insurance`;
/*!40000 ALTER TABLE `t_insurance` DISABLE KEYS */;
INSERT INTO `t_insurance` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `big`, `common`, `mine`, `name`, `one`, `three`, `two`) VALUES
	('1337709526010433537', 'admin', '2020-12-12 18:42:59.103000', 0, NULL, NULL, '80', '70', '5', '基本医疗保险', '40', '10', '20'),
	('1337933430834466817', 'admin', '2020-12-13 09:32:42.181000', 0, NULL, NULL, '90', '70', '20', '高档医疗保险', '60', '40', '50'),
	('1337933534492495872', 'admin', '2020-12-13 09:33:06.887000', 0, NULL, NULL, '30', '20', '0', '最低医疗保险', '20', '10', '10');
/*!40000 ALTER TABLE `t_insurance` ENABLE KEYS */;

-- 导出  表 medicine.t_log 结构
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE IF NOT EXISTS `t_log` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `cost_time` int unsigned DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `ip_info` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `request_param` longtext,
  `request_type` varchar(255) DEFAULT NULL,
  `request_url` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `log_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  medicine.t_log 的数据：~27 rows (大约)
DELETE FROM `t_log`;
/*!40000 ALTER TABLE `t_log` DISABLE KEYS */;
INSERT INTO `t_log` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `cost_time`, `ip`, `ip_info`, `name`, `request_param`, `request_type`, `request_url`, `username`, `log_type`) VALUES
	(1337311281962684416, NULL, '2020-12-11 16:20:31', 0, NULL, '2020-12-11 16:20:31', 453, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"wqsv","saveLogin":"true","captchaId":"ec504bd47f2644b2952c697fc39cbb35","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337311546707152896, NULL, '2020-12-11 16:21:34', 0, NULL, '2020-12-11 16:21:34', 421, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"gs34","saveLogin":"true","captchaId":"5ea68daeacd34c61ae2c38b90792e4dd","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337550219369385984, NULL, '2020-12-12 08:09:58', 0, NULL, '2020-12-12 08:09:58', 376, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"h9my","saveLogin":"true","captchaId":"bae6c0767a56494a9c0e28c0cf00331b","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337697718230978560, NULL, '2020-12-12 17:56:04', 0, NULL, '2020-12-12 17:56:04', 393, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"39Ga","saveLogin":"true","captchaId":"ecbf9e66c5d54c9eb2cafcd8af008dda","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337706410254929920, NULL, '2020-12-12 18:30:37', 0, NULL, '2020-12-12 18:30:37', 304, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"vrrg","saveLogin":"true","captchaId":"d56a7fb6fc59486aaadf51ef6b0dfd06","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337748746032779264, NULL, '2020-12-12 21:18:50', 0, NULL, '2020-12-12 21:18:50', 101, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"pctt","saveLogin":"true","captchaId":"727df872b6ef4e76872127c6714a6a85","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337759827593662464, NULL, '2020-12-12 22:02:52', 0, NULL, '2020-12-12 22:02:52', 90, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"mhfb","saveLogin":"true","captchaId":"224cd89ef641460b8c93782079ac2791","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337762190274465792, NULL, '2020-12-12 22:12:15', 0, NULL, '2020-12-12 22:12:15', 85, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"35kp","saveLogin":"true","captchaId":"463a5adb0613404698aa743fdfe17562","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337919204048900096, NULL, '2020-12-13 08:36:11', 0, NULL, '2020-12-13 08:36:11', 557, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"tm46","saveLogin":"true","captchaId":"d60af9eda81f41299a3409e498e4a0d8","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337922224795029504, NULL, '2020-12-13 08:48:11', 0, NULL, '2020-12-13 08:48:11', 273, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"xl6z","saveLogin":"true","captchaId":"796b06527a314567a5b5c29e8a990b1b","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1337927477359677440, NULL, '2020-12-13 09:09:03', 0, NULL, '2020-12-13 09:09:03', 79, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"psu5","saveLogin":"true","captchaId":"157632a0dbd240ddbf91a4c709afe135","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1340928955515015168, NULL, '2020-12-21 15:55:51', 0, NULL, '2020-12-21 15:55:51', 225, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"vfvm","saveLogin":"true","captchaId":"30819a32fef64e02b7c125d553f46fb6","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1350603974109171712, NULL, '2021-01-17 08:40:55', 0, NULL, '2021-01-17 08:40:55', 236, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"wxdm","saveLogin":"true","captchaId":"b11c720c740b4451a0a2699bba67caf5","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1350609327995621376, NULL, '2021-01-17 09:02:12', 0, NULL, '2021-01-17 09:02:12', 86, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"5oxc","saveLogin":"true","captchaId":"187e612f6b484475ad78a32660e89e1e","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1355731771634880512, NULL, '2021-01-31 12:16:57', 0, NULL, '2021-01-31 12:16:57', 71, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"TIO6","saveLogin":"true","captchaId":"1143b9c8114449bc8e6d1c591aaed6e9","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1355731946143092736, NULL, '2021-01-31 12:17:39', 0, NULL, '2021-01-31 12:17:39', 107, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"ghf5","saveLogin":"true","captchaId":"8376fb3295bc466cb7cc526108b0da8c","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1355732778704048128, NULL, '2021-01-31 12:20:58', 0, NULL, '2021-01-31 12:20:58', 465, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"ep9m","saveLogin":"true","captchaId":"64271e9c4b83490789639141e537a35b","username":"company"}', 'POST', '/xboot/login', 'company', 1),
	(1355732845221515264, NULL, '2021-01-31 12:21:13', 0, NULL, '2021-01-31 12:21:13', 74, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"gxsc","saveLogin":"true","captchaId":"4317339ba1414b1b8d7bd3fda768f6f8","username":"doctor"}', 'POST', '/xboot/login', 'doctor', 1),
	(1355732928340037632, NULL, '2021-01-31 12:21:33', 0, NULL, '2021-01-31 12:21:33', 60, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"due8","saveLogin":"true","captchaId":"648c07f55a2b463eb814768b25211c53","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1355751708294254592, NULL, '2021-01-31 13:36:11', 0, NULL, '2021-01-31 13:36:11', 75, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"uwxd","saveLogin":"true","captchaId":"ffe6067e7b3740f3aeb837111b79486b","username":"company"}', 'POST', '/xboot/login', 'company', 1),
	(1355751794889854976, NULL, '2021-01-31 13:36:31', 0, NULL, '2021-01-31 13:36:31', 70, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"dekd","saveLogin":"true","captchaId":"e2e4c16b08bb49508e8ae345a5387141","username":"doctor"}', 'POST', '/xboot/login', 'doctor', 1),
	(1355751908521938944, NULL, '2021-01-31 13:36:58', 0, NULL, '2021-01-31 13:36:58', 91, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"jpss","saveLogin":"true","captchaId":"00b0a0f70492445fa1ba3c7d5892aa8d","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463375568652341248, NULL, '2021-11-24 13:14:59', 0, NULL, '2021-11-24 13:14:59', 204, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"OLUR","saveLogin":"true","captchaId":"c9bc133822c6438e8c9499cb461a27d2","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463375637669613568, NULL, '2021-11-24 13:15:15', 0, NULL, '2021-11-24 13:15:15', 79, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"SKUE","saveLogin":"true","captchaId":"77e6552ca17840dbacd9c8727f0573de","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463384643616247808, NULL, '2021-11-24 13:51:02', 0, NULL, '2021-11-24 13:51:02', 69, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"IY7Q","saveLogin":"true","captchaId":"a2287d7f99f64fc98ad6316a2dbc8bf2","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463390317393874944, NULL, '2021-11-24 14:13:35', 0, NULL, '2021-11-24 14:13:35', 81, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"9RNO","saveLogin":"true","captchaId":"e2ee9fed43db435095eed265a832df38","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463396744564969472, NULL, '2021-11-24 14:39:07', 0, NULL, '2021-11-24 14:39:07', 92, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"avvh","saveLogin":"true","captchaId":"265ab32faada425f9e30adcacd27b263","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463396965332160512, NULL, '2021-11-24 14:40:00', 0, NULL, '2021-11-24 14:40:00', 84, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"GER9","saveLogin":"true","captchaId":"8e5ed6a725c24ce586f85a828525bcbc","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463397001549975552, NULL, '2021-11-24 14:40:09', 0, NULL, '2021-11-24 14:40:09', 83, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"YZHZ","saveLogin":"true","captchaId":"43b642dd04a84ff0b598c7e45dd8cbae","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463745354230009856, NULL, '2021-11-25 13:44:22', 0, NULL, '2021-11-25 13:44:22', 199, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"7ptg","saveLogin":"true","captchaId":"b1e2e425f57145579c5bea5d5ed76ad2","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463751360750161920, NULL, '2021-11-25 14:08:15', 0, NULL, '2021-11-25 14:08:15', 247, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"JQN5","saveLogin":"true","captchaId":"6a2975c9452e4243931b0d7b380325c6","username":"admin"}', 'POST', '/xboot/login', 'admin', 1),
	(1463770014329999360, NULL, '2021-11-25 15:22:22', 0, NULL, '2021-11-25 15:22:22', 319, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"RZDZ","saveLogin":"true","captchaId":"f9b38f92cd224fe093bfde7948d9da04","username":"admin"}', 'POST', '/zwz/login', 'admin', 1),
	(1463778047030333440, NULL, '2021-11-25 15:54:17', 0, NULL, '2021-11-25 15:54:17', 143, '127.0.0.1', '未知', '登录系统', '{"password":"你是看不见我的","code":"R9FZ","saveLogin":"true","captchaId":"ea065e931bb34e3583f1ec6238799060","username":"admin"}', 'POST', '/zwz/login', 'admin', 1),
	(1464410444235149312, NULL, '2021-11-27 09:47:12', 0, NULL, '2021-11-27 09:47:12', 288, '127.0.0.1', '未知', '登录系统', '{"password":"密码已被隐藏","code":"BPQZ","saveLogin":"true","captchaId":"bce096c9b0d0430181d142f55f027ae7","username":"admin"}', 'POST', '/zwz/login', 'admin', 1);
/*!40000 ALTER TABLE `t_log` ENABLE KEYS */;

-- 导出  表 medicine.t_medicine 结构
DROP TABLE IF EXISTS `t_medicine`;
CREATE TABLE IF NOT EXISTS `t_medicine` (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `efficacy` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

-- 正在导出表  medicine.t_medicine 的数据：~13 rows (大约)
DELETE FROM `t_medicine`;
/*!40000 ALTER TABLE `t_medicine` DISABLE KEYS */;
INSERT INTO `t_medicine` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `efficacy`, `name`, `price`, `type`) VALUES
	('1337932650672951297', 'admin', '2020-12-13 09:29:36.000000', 0, 'admin', '2021-01-17 10:21:01.342000', '治疗胸腔的胸腔穿刺术', '胸腔穿刺术', '1600', '一级手术'),
	('1350629234195959809', 'admin', '2021-01-17 10:21:17.570000', 0, NULL, NULL, '治疗腰间盘突出', '腰椎穿刺', '6000', '二级手术'),
	('1350629325371740161', 'admin', '2021-01-17 10:21:39.306000', 0, NULL, NULL, '治疗皮肤异常的经皮腹腔穿刺术', '经皮腹腔穿刺术', '3900', '三级手术'),
	('1350629434922766337', 'admin', '2021-01-17 10:22:05.425000', 0, NULL, NULL, '用于治疗严重的硬膜外阻滞术', '连续硬膜外阻滞术', '3870', '一级手术'),
	('1350629553902587905', 'admin', '2021-01-17 10:22:33.792000', 0, NULL, NULL, '治疗人体的椎管内异常', '椎管内注射封闭', '3640', '二级手术'),
	('1350629664133091329', 'admin', '2021-01-17 10:23:00.074000', 0, NULL, NULL, '治疗人体静脉异常', '静脉穿刺术', '1300', '三级手术'),
	('1350629791572824064', 'admin', '2021-01-17 10:23:30.457000', 0, NULL, NULL, '治疗人体出血过多的问题', '伤口止血术', '600', '三级手术'),
	('1350629875693785089', 'admin', '2021-01-17 10:23:50.513000', 0, NULL, NULL, '治疗人体阑尾的手术', '阑尾切除术', '1200', '二级手术'),
	('1350629966991200257', 'admin', '2021-01-17 10:24:12.280000', 0, NULL, NULL, '治疗人体腹部的异常手术', '腹股沟疝修补术', '3500', '一级手术'),
	('1350630064059977729', 'admin', '2021-01-17 10:24:35.424000', 0, NULL, NULL, '治疗人体鞘膜异常的手术', '鞘膜翻转术', '3590', '三级手术'),
	('1350630177914359809', 'admin', '2021-01-17 10:25:02.568000', 0, NULL, NULL, '对人体的直肠指进行检查', '直肠指检', '3100', '二级手术'),
	('1350630263918563329', 'admin', '2021-01-17 10:25:23.074000', 0, NULL, NULL, '对人体骨折闭合进行复位', '骨折闭合复位术', '3160', '一级手术'),
	('1350630395485491201', 'admin', '2021-01-17 10:25:54.441000', 0, NULL, NULL, '对人体的关键骨节进行复位穿刺', '关节穿刺术', '6750', '一级手术');
/*!40000 ALTER TABLE `t_medicine` ENABLE KEYS */;

-- 导出  表 medicine.t_permission 结构
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE IF NOT EXISTS `t_permission` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `level` int unsigned DEFAULT NULL,
  `button_type` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `show_always` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  medicine.t_permission 的数据：~81 rows (大约)
DELETE FROM `t_permission`;
/*!40000 ALTER TABLE `t_permission` DISABLE KEYS */;
INSERT INTO `t_permission` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `description`, `name`, `parent_id`, `type`, `sort_order`, `component`, `path`, `title`, `icon`, `level`, `button_type`, `status`, `url`, `show_always`) VALUES
	(5129710648430592, '', '2018-06-04 19:02:29', 0, '', '2018-09-29 23:11:56', '', 'sys', 125909152017944576, 0, 1.00, 'Main', '/sys', '系统管理', 'ios-settings', 1, '', 0, '', b'1'),
	(5129710648430593, '', '2018-06-04 19:02:32', 0, 'admin', '2021-01-17 10:59:29', '', 'user-manage', 5129710648430592, 0, 1.10, 'sys/user-manage/userManage', 'user-manage', '登入用户', 'md-person', 2, '', 0, '', b'1'),
	(5129710648430594, '', '2018-06-04 19:02:35', 0, 'admin', '2021-01-17 10:59:46', '', 'role-manage', 5129710648430592, 0, 1.60, 'sys/role-manage/roleManage', 'role-manage', '角色权限', 'md-contacts', 2, '', 0, '', b'1'),
	(5129710648430595, '', '2018-06-04 19:02:37', 0, 'admin', '2021-01-17 11:00:10', '', 'menu-manage', 5129710648430592, 0, 1.70, 'sys/menu-manage/menuManage', 'menu-manage', '系统菜单', 'md-menu', 2, '', 0, '', b'1'),
	(15701400130424832, '', '2018-06-03 22:04:06', 0, '', '2018-09-19 22:16:44', '', '', 5129710648430593, 1, 1.11, '', '/xboot/user/admin/add*', '添加用户', '', 3, 'add', 0, '', b'1'),
	(15701915807518720, '', '2018-06-03 22:06:09', 0, '', '2018-06-06 14:46:51', '', '', 5129710648430593, 1, 1.13, '', '/xboot/user/admin/disable/**', '禁用用户', '', 3, 'disable', 0, NULL, b'1'),
	(15708892205944832, '', '2018-06-03 22:33:52', 0, '', '2018-06-28 16:44:48', '', '', 5129710648430593, 1, 1.14, '', '/xboot/user/admin/enable/**', '启用用户', '', 3, 'enable', 0, NULL, b'1'),
	(16678126574637056, '', '2018-06-06 14:45:16', 0, '', '2018-09-19 22:16:48', '', '', 5129710648430593, 1, 1.12, '', '/xboot/user/admin/edit*', '编辑用户', '', 3, 'edit', 0, '', b'1'),
	(16678447719911424, '', '2018-06-06 14:46:32', 0, 'admin', '2020-04-28 14:27:03', '', '', 5129710648430593, 1, 1.15, '', '/xboot/user/delByIds**', '删除用户', '', 3, 'delete', 0, '', b'1'),
	(16687383932047360, '', '2018-06-06 15:22:03', 0, '', '2018-09-19 22:07:34', '', '', 5129710648430594, 1, 1.21, '', '/xboot/role/save*', '添加角色', '', 3, 'add', 0, '', b'1'),
	(16689632049631232, '', '2018-06-06 15:30:59', 0, '', '2018-09-19 22:07:37', '', '', 5129710648430594, 1, 1.22, '', '/xboot/role/edit*', '编辑角色', '', 3, 'edit', 0, '', b'1'),
	(16689745006432256, '', '2018-06-06 15:31:26', 0, 'admin', '2020-04-28 14:29:02', '', '', 5129710648430594, 1, 1.23, '', '/xboot/role/delByIds**', '删除角色', '', 3, 'delete', 0, '', b'1'),
	(16689883993083904, NULL, '2018-06-06 15:31:59', 0, NULL, '2018-06-06 15:31:59', NULL, NULL, 5129710648430594, 1, 1.24, NULL, '/xboot/role/editRolePerm**', '分配权限', NULL, 3, 'editPerm', 0, NULL, b'1'),
	(16690313745666048, '', '2018-06-06 15:33:41', 0, '', '2018-09-19 22:07:46', '', '', 5129710648430594, 1, 1.25, '', '/xboot/role/setDefault*', '设为默认角色', '', 3, 'setDefault', 0, '', b'1'),
	(16694861252005888, '', '2018-06-06 15:51:46', 0, '', '2018-09-19 22:07:52', '', '', 5129710648430595, 1, 1.31, '', '/xboot/permission/add*', '添加菜单', '', 3, 'add', 0, '', b'1'),
	(16695107491205120, '', '2018-06-06 15:52:44', 0, '', '2018-09-19 22:07:57', '', '', 5129710648430595, 1, 1.32, '', '/xboot/permission/edit*', '编辑菜单', '', 3, 'edit', 0, '', b'1'),
	(16695243126607872, '', '2018-06-06 15:53:17', 0, 'admin', '2020-04-28 14:29:17', '', '', 5129710648430595, 1, 1.33, '', '/xboot/permission/delByIds**', '删除菜单', '', 3, 'delete', 0, '', b'1'),
	(25014528525733888, '', '2018-06-29 14:51:09', 0, '', '2018-10-08 11:13:27', '', '', 5129710648430593, 1, 1.16, '', '无', '上传图片', '', 3, 'upload', 0, '', b'1'),
	(39915540965232640, NULL, '2018-08-09 17:42:28', 0, NULL, '2018-08-09 17:42:28', NULL, 'monitor', 125909152017944576, 0, 2.00, 'Main', '/monitor', '系统监控', 'ios-analytics', 1, NULL, 0, NULL, b'1'),
	(39916171171991552, '', '2018-08-09 17:44:57', 0, 'admin', '2019-01-20 00:37:29', '', 'druid', 39915540965232640, 0, 2.40, 'sys/monitor/monitor', 'druid', 'SQL监控', 'md-analytics', 2, '', 0, 'http://127.0.0.1:8888/druid/login.html', b'1'),
	(39918482854252544, '', '2018-08-09 17:54:08', 0, 'admin', '2019-01-20 00:37:41', '', 'swagger', 39915540965232640, 0, 2.50, 'sys/monitor/monitor', 'swagger', '接口文档', 'md-document', 2, '', 0, 'http://127.0.0.1:8888/swagger-ui.html', b'1'),
	(40238597734928384, NULL, '2018-08-10 15:06:10', 0, NULL, '2018-08-10 15:06:10', NULL, 'department-manage', 5129710648430592, 0, 1.20, 'sys/department-manage/departmentManage', 'department-manage', '部门管理', 'md-git-branch', 2, '', 0, NULL, b'1'),
	(41363147411427328, '', '2018-08-13 17:34:43', 0, 'admin', '2021-01-17 11:00:19', '', 'log-manage', 39915540965232640, 0, 2.20, 'sys/log-manage/logManage', 'log-manage', '系统日志', 'md-list-box', 2, '', 0, '', b'1'),
	(41363537456533504, '', '2018-08-13 17:36:16', 0, 'admin', '2020-04-28 14:31:54', '', '', 41363147411427328, 1, 2.11, '', '/xboot/log/delByIds**', '删除日志', '', 3, 'delete', 0, '', b'1'),
	(41364927394353152, '', '2018-08-13 17:41:48', 0, '', '2018-09-19 22:08:57', '', '', 41363147411427328, 1, 2.12, '', '/xboot/log/delAll*', '清空日志', '', 3, 'undefined', 0, '', b'1'),
	(41370251991977984, NULL, '2018-08-13 18:02:57', 0, NULL, '2018-08-13 18:02:57', NULL, 'quartz-job', 39915540965232640, 0, 2.10, 'sys/quartz-manage/quartzManage', 'quartz-job', '定时任务', 'md-time', 2, '', 0, NULL, b'1'),
	(41371711400054784, '', '2018-08-13 18:08:45', 0, '', '2019-07-07 21:24:26', '', 'actuator', 39915540965232640, 0, 2.30, 'sys/actuator/actuator', 'actuator', 'Actuator监控', 'logo-angular', 2, '', 0, '', b'1'),
	(41469219249852416, NULL, '2018-08-14 00:36:13', 0, NULL, '2018-08-14 00:36:13', NULL, '', 41371711400054784, 1, 2.31, '', '无', '查看数据', '', 3, 'view', 0, NULL, b'1'),
	(43117268627886080, '', '2018-08-18 13:44:58', 0, 'admin', '2020-12-12 21:36:58', '', 'message-manage', 5129710648430592, 0, 1.30, 'sys/message-manage/messageManage', 'message-manage', '消息管理', 'md-mail', 2, '', 0, '', b'1'),
	(45235621697949696, '', '2018-08-24 10:02:33', 0, '', '2018-09-19 22:06:57', '', '', 40238597734928384, 1, 1.21, '', '/xboot/department/add*', '添加部门', '', 3, 'add', 0, '', b'1'),
	(45235787867885568, '', '2018-08-24 10:03:13', 0, '', '2018-09-19 22:07:02', '', '', 40238597734928384, 1, 1.22, '', '/xboot/department/edit*', '编辑部门', '', 3, 'edit', 0, '', b'1'),
	(45235939278065664, '', '2018-08-24 10:03:49', 0, 'admin', '2020-04-28 14:27:35', '', '', 40238597734928384, 1, 1.23, '', '/xboot/department/delByIds*', '删除部门', '', 3, 'delete', 0, '', b'1'),
	(45236734832676864, '', '2018-08-24 10:06:59', 0, '', '2018-09-19 22:07:07', '', '', 43117268627886080, 1, 1.31, '', '/xboot/message/add*', '添加消息', '', 3, 'add', 0, '', b'1'),
	(45237010692050944, '', '2018-08-24 10:08:04', 0, '', '2018-09-19 22:07:12', '', '', 43117268627886080, 1, 1.32, '', '/xboot/message/edit*', '编辑消息', '', 3, 'edit', 0, '', b'1'),
	(45237170029465600, '', '2018-08-24 10:08:42', 0, 'admin', '2020-04-28 14:28:03', '', '', 43117268627886080, 1, 1.33, '', '/xboot/message/delByIds*', '删除消息', '', 3, 'delete', 0, '', b'1'),
	(45264987354042368, '', '2018-08-24 11:59:14', 0, '', '2018-09-19 22:08:11', '', '', 41370251991977984, 1, 2.11, '', '/xboot/quartzJob/add*', '添加定时任务', '', 3, 'add', 0, '', b'1'),
	(45265487029866496, '', '2018-08-24 12:01:14', 0, '', '2018-09-19 22:08:17', '', '', 41370251991977984, 1, 2.12, '', '/xboot/quartzJob/edit*', '编辑定时任务', '', 3, 'edit', 0, '', b'1'),
	(45265762415284224, '', '2018-08-24 12:02:19', 0, '', '2018-09-19 22:08:24', '', '', 41370251991977984, 1, 2.13, '', '/xboot/quartzJob/pause*', '暂停定时任务', '', 3, 'disable', 0, '', b'1'),
	(45265886315024384, '', '2018-08-24 12:02:49', 0, '', '2018-09-19 22:09:13', '', '', 41370251991977984, 1, 2.14, '', '/xboot/quartzJob/resume*', '恢复定时任务', '', 3, 'enable', 0, '', b'1'),
	(45266070000373760, '', '2018-08-24 12:03:33', 0, 'admin', '2020-04-28 14:31:48', '', '', 41370251991977984, 1, 2.15, '', '/xboot/quartzJob/delByIds*', '删除定时任务', '', 3, 'delete', 0, '', b'1'),
	(56898976661639168, '', '2018-09-25 14:28:34', 0, '', '2018-09-25 15:12:46', '', '', 5129710648430593, 1, 1.17, '', '/xboot/user/importData*', '导入用户', '', 3, 'input', 0, '', b'1'),
	(57009544286441472, NULL, '2018-09-25 21:47:55', 0, NULL, '2018-09-25 21:47:55', NULL, '', 43117268627886080, 1, 1.40, '', '/xboot/messageSend/save*', '添加已发送消息', '', 3, 'add', 0, NULL, b'1'),
	(57009744761589760, NULL, '2018-09-25 21:48:43', 0, NULL, '2018-09-25 21:48:43', NULL, '', 43117268627886080, 1, 1.50, '', '/xboot/messageSend/update*', '编辑已发送消息', '', 3, 'edit', 0, NULL, b'1'),
	(57009981228060672, NULL, '2018-09-25 21:49:39', 0, NULL, '2018-09-25 21:49:39', NULL, '', 43117268627886080, 1, 1.60, '', '/xboot/messageSend/delByIds/*', '删除已发送消息', '', 3, 'delete', 0, NULL, b'1'),
	(75002207560273920, 'admin', '2018-11-14 13:24:21', 0, 'admin', '2021-01-17 10:59:52', '', 'dict', 5129710648430592, 0, 1.80, 'sys/dict-manage/dictManage', 'dict', '数据字典', 'md-bookmarks', 2, '', 0, '', b'1'),
	(76215889006956544, 'admin', '2018-11-17 21:47:05', 0, 'admin', '2018-11-17 21:47:53', '', '', 75002207560273920, 1, 1.81, '', '/xboot/dict/add*', '添加字典', '', 3, 'add', 0, '', b'1'),
	(76216071333351424, 'admin', '2018-11-17 21:47:48', 0, 'admin', '2018-11-17 21:47:48', NULL, '', 75002207560273920, 1, 1.82, '', '/xboot/dict/edit*', '编辑字典', '', 3, 'edit', 0, NULL, b'1'),
	(76216264070008832, 'admin', '2018-11-17 21:48:34', 0, 'admin', '2020-04-28 14:29:30', '', '', 75002207560273920, 1, 1.83, '', '/xboot/dict/delByIds**', '删除字典', '', 3, 'delete', 0, '', b'1'),
	(76216459709124608, 'admin', '2018-11-17 21:49:21', 0, 'admin', '2018-11-17 21:49:21', NULL, '', 75002207560273920, 1, 1.84, '', '/xboot/dictData/add*', '添加字典数据', '', 3, 'add', 0, NULL, b'1'),
	(76216594207870976, 'admin', '2018-11-17 21:49:53', 0, 'admin', '2018-11-17 21:49:53', NULL, '', 75002207560273920, 1, 1.85, '', '/xboot/dictData/edit*', '编辑字典数据', '', 3, 'edit', 0, NULL, b'1'),
	(76216702639017984, 'admin', '2018-11-17 21:50:18', 0, 'admin', '2018-11-17 21:50:18', NULL, '', 75002207560273920, 1, 1.86, '', '/xboot/dictData/delByIds/**', '删除字典数据', '', 3, 'delete', 0, NULL, b'1'),
	(102235632889237504, 'admin', '2019-01-28 17:00:15', 0, 'admin', '2019-11-22 11:47:14', '', 'vue-generator', 125909152017944576, 0, 3.00, 'Main', '/vue-generator', 'Vue代码生成', 'md-send', 1, '', 0, '', b'1'),
	(102237605176807424, 'admin', '2019-01-28 17:08:06', 0, 'admin', '2020-12-12 21:36:35', '', 'table-generator', 102235632889237504, 0, 0.00, 'xboot-vue-generator/tableGenerator', 'table', '增删改表格生成', 'md-grid', 2, '', 0, '', b'1'),
	(102240052523831296, 'admin', '2019-01-28 17:17:49', 0, 'admin', '2020-12-12 21:36:40', '', 'tree-generator', 102235632889237504, 0, 1.00, 'xboot-vue-generator/treeGenerator', 'tree', '树形结构生成', 'md-git-branch', 2, '', 0, '', b'1'),
	(103658022701633536, 'admin', '2019-02-01 15:12:20', 0, 'admin', '2019-02-01 18:38:29', '', 'test', 102235632889237504, 0, 3.00, 'xboot-vue-generator/test', 'test', '代码生成测试页', 'ios-bug', 2, '', 0, '', b'1'),
	(121426317022334976, 'admin', '2019-03-22 15:57:11', 0, 'admin', '2019-03-22 15:57:11', NULL, 'redis', 39915540965232640, 0, 2.21, 'sys/redis/redis', 'redis', 'Redis缓存管理', 'md-barcode', 2, '', 0, '', b'1'),
	(125909152017944576, 'admin', '2019-04-04 00:50:22', 0, 'admin', '2021-01-17 10:58:07', '', 'xboot', 0, -1, 1.00, '', '', '大病系统配置', 'md-home', 0, '', 0, '', b'1'),
	(127996320085446656, 'admin', '2019-04-09 19:04:02', 0, 'admin', '2021-01-17 10:59:06', '', 'app', 0, -1, 10.00, '', '', '其他', 'md-phone-portrait', 0, '', 0, '', b'1'),
	(149452775095275520, 'admin', '2019-06-08 00:04:19', 0, 'admin', '2019-06-08 00:04:19', NULL, 'admin', 39915540965232640, 0, 2.29, 'sys/monitor/monitor', '/admin', 'Admin监控', 'md-speedometer', 2, '', 0, 'http://127.0.0.1:8888/xboot/admin', b'1'),
	(156365156580855808, 'admin', '2019-06-27 01:51:39', 0, 'admin', '2019-06-27 01:51:39', NULL, '', 5129710648430593, 1, 1.18, '', '/xboot/user/resetPass', '重置密码', '', 3, 'other', 0, NULL, b'1'),
	(1251760630449442816, 'admin', '2020-04-19 14:32:46', 0, 'admin', '2020-04-27 18:31:03', '', 'member-log', 127996320085446656, 0, 3.00, 'Main', '/member-log', '日志记录', 'md-list-box', 1, '', 0, '', b'1'),
	(1251761480286736384, 'admin', '2020-04-19 14:36:08', 0, 'admin', '2020-12-12 21:36:27', '', 'member-log', 1251760630449442816, 0, 0.00, 'sys/log-manage/logManage', 'member-log', '日志记录', 'md-list-box', 2, '', 0, '', b'1'),
	(1255336077691064320, 'admin', '2020-04-29 11:20:18', 0, 'admin', '2020-04-29 11:20:47', '', '', 121426317022334976, 1, 0.00, '', '/xboot/redis/getAllByPage**', '获取Redis', '', 3, 'view', 0, '', b'1'),
	(1255336361339260928, 'admin', '2020-04-29 11:21:26', 0, 'admin', '2020-04-29 11:21:26', NULL, '', 121426317022334976, 1, 0.00, '', '/xboot/redis/save', '添加Redis', '', 3, 'add', 0, NULL, b'1'),
	(1255336455472025601, 'admin', '2020-04-29 11:21:48', 0, 'admin', '2020-04-29 11:21:48', NULL, '', 121426317022334976, 1, 0.00, '', '/xboot/redis/delByKeys**', '删除Redis', '', 3, 'delete', 0, NULL, b'1'),
	(1255336553971060737, 'admin', '2020-04-29 11:22:12', 0, 'admin', '2020-04-29 11:22:12', NULL, '', 121426317022334976, 1, 0.00, '', '/xboot/redis/delAll', '清空Redis', '', 3, 'clear', 0, NULL, b'1'),
	(1337319819627859969, 'admin', '2020-12-11 16:54:26', 0, 'admin', '2021-01-17 11:00:00', '', 'people', 0, -1, 2.00, '', '', '大病人员模块', 'md-aperture', 0, '', 0, '', b'1'),
	(1337319951794573313, 'admin', '2020-12-11 16:54:57', 0, 'admin', '2021-01-17 10:58:34', '', 'Insurance', 0, -1, 3.00, '', '', '大病保险模块', 'ios-at', 0, '', 0, '', b'1'),
	(1337320087052488705, 'admin', '2020-12-11 16:55:30', 0, 'admin', '2021-01-17 10:58:49', '', 'medical', 0, -1, 4.00, '', '', '大病登记模块', 'md-bookmarks', 0, '', 0, '', b'1'),
	(1337320167616679936, 'admin', '2020-12-11 16:55:49', 0, 'admin', '2021-01-17 10:58:56', '', 'examine', 0, -1, 5.00, '', '', '保险审核模块', 'md-cloud-circle', 0, '', 0, '', b'1'),
	(1337324650472017921, 'admin', '2020-12-11 17:13:38', 0, 'admin', '2020-12-11 17:13:38', NULL, 'roster', 1337319819627859969, 0, 1.00, 'Main', '/roster', '参保人员档案', 'md-aperture', 1, '', 0, NULL, b'1'),
	(1337325396064079872, 'admin', '2020-12-11 17:16:35', 0, 'admin', '2020-12-11 17:16:35', NULL, 'roster', 1337324650472017921, 0, 1.00, 'roster/roster/roster', 'roster', '参保人员档案', 'md-analytics', 2, '', 0, NULL, b'1'),
	(1337366451853594624, 'admin', '2020-12-11 19:59:44', 0, 'admin', '2020-12-11 19:59:44', NULL, 'medicalInsurance', 1337319951794573313, 0, 1.00, 'Main', '/medicalInsurance', '医疗保险档案', 'md-basket', 1, '', 0, NULL, b'1'),
	(1337366572867653632, 'admin', '2020-12-11 20:00:13', 0, 'admin', '2020-12-11 20:00:13', NULL, 'insurance', 1337366451853594624, 0, 1.00, 'medicalInsurance/insurance/insurance', 'insurance', '医疗保险', 'ios-beer', 2, '', 0, NULL, b'1'),
	(1337376912225472513, 'admin', '2020-12-11 20:41:18', 0, 'admin', '2020-12-11 20:41:18', NULL, 'recharge', 1337319819627859969, 0, 2.00, 'Main', '/recharge', '医保充值', 'ios-beaker', 1, '', 0, NULL, b'1'),
	(1337377059000946689, 'admin', '2020-12-11 20:41:53', 0, 'admin', '2020-12-11 20:41:53', NULL, 'recharge', 1337376912225472513, 0, 1.00, 'roster/recharge/recharge', 'recharge', '医保充值', 'md-cafe', 2, '', 0, NULL, b'1'),
	(1337391052256055297, 'admin', '2020-12-11 21:37:29', 0, 'admin', '2020-12-11 21:37:29', NULL, 'seeDoctor', 1337320087052488705, 0, 1.00, 'Main', '/seeDoctor', '看病', 'md-archive', 1, '', 0, NULL, b'1'),
	(1337391123898961921, 'admin', '2020-12-11 21:37:46', 0, 'admin', '2020-12-11 21:37:46', NULL, 'seeDoctor', 1337391052256055297, 0, 1.00, 'seeDoctor/seeDoctor/seeDoctor', 'seeDoctor', '看病登记', 'md-aperture', 2, '', 0, NULL, b'1'),
	(1337557674727968769, 'admin', '2020-12-12 08:39:35', 0, 'admin', '2020-12-12 08:39:35', NULL, 'medicine', 1337366451853594624, 0, 2.00, 'medicalInsurance/medicine/medicine', 'medicine', '手术档案', 'ios-baseball', 2, '', 0, NULL, b'1'),
	(1337741980058390528, 'admin', '2020-12-12 20:51:57', 0, 'admin', '2020-12-12 20:51:57', NULL, 'examine', 1337320167616679936, 0, 1.00, 'Main', '/examine', '保险审核', 'md-aperture', 1, '', 0, NULL, b'1'),
	(1337742085226369025, 'admin', '2020-12-12 20:52:22', 0, 'admin', '2020-12-12 20:52:22', NULL, 'examine', 1337741980058390528, 0, 1.00, 'examine/examine/medicine', 'examine', '保险审核', 'md-baseball', 2, '', 0, NULL, b'1');
/*!40000 ALTER TABLE `t_permission` ENABLE KEYS */;

-- 导出  表 medicine.t_role 结构
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE IF NOT EXISTS `t_role` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `default_role` bit(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `data_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  medicine.t_role 的数据：~3 rows (大约)
DELETE FROM `t_role`;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `del_flag`, `default_role`, `description`, `data_type`) VALUES
	(496138616573952, '', '2018-04-22 23:03:49', 'admin', '2021-01-17 09:03:33', 'ROLE_ADMIN', 0, NULL, '超级管理员', 0),
	(496138616573953, '', '2018-05-02 21:40:03', 'admin', '2021-01-17 09:03:22', 'ROLE_BXGS', 0, b'1', '保险公司', 0),
	(16457350655250432, '', '2018-06-06 00:08:00', 'admin', '2021-01-17 09:03:53', 'ROLE_DOCTER', 0, NULL, '医生', 1);
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;

-- 导出  表 medicine.t_role_department 结构
DROP TABLE IF EXISTS `t_role_department`;
CREATE TABLE IF NOT EXISTS `t_role_department` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `role_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  medicine.t_role_department 的数据：~3 rows (大约)
DELETE FROM `t_role_department`;
/*!40000 ALTER TABLE `t_role_department` DISABLE KEYS */;
INSERT INTO `t_role_department` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `department_id`, `role_id`) VALUES
	(70763874256687105, 'admin', '2018-11-02 20:42:43', 0, 'admin', '2018-11-02 20:42:43', 40322777781112832, 16457350655250432),
	(70763874265075712, 'admin', '2018-11-02 20:42:43', 0, 'admin', '2018-11-02 20:42:43', 40322811096469504, 16457350655250432),
	(70763874277658624, 'admin', '2018-11-02 20:42:43', 0, 'admin', '2018-11-02 20:42:43', 40322852833988608, 16457350655250432);
/*!40000 ALTER TABLE `t_role_department` ENABLE KEYS */;

-- 导出  表 medicine.t_role_permission 结构
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE IF NOT EXISTS `t_role_permission` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `permission_id` bigint unsigned DEFAULT NULL,
  `role_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  medicine.t_role_permission 的数据：~67 rows (大约)
DELETE FROM `t_role_permission`;
/*!40000 ALTER TABLE `t_role_permission` DISABLE KEYS */;
INSERT INTO `t_role_permission` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `permission_id`, `role_id`) VALUES
	(1350609855282548736, 'admin', '2021-01-17 09:04:17', 0, 'admin', '2021-01-17 09:04:17', 1337320167616679936, 496138616573953),
	(1350609855282548737, 'admin', '2021-01-17 09:04:17', 0, 'admin', '2021-01-17 09:04:17', 1337741980058390528, 496138616573953),
	(1350609855282548738, 'admin', '2021-01-17 09:04:17', 0, 'admin', '2021-01-17 09:04:17', 1337742085226369025, 496138616573953),
	(1350610088599097344, 'admin', '2021-01-17 09:05:13', 0, 'admin', '2021-01-17 09:05:13', 1337319819627859969, 16457350655250432),
	(1350610088599097345, 'admin', '2021-01-17 09:05:13', 0, 'admin', '2021-01-17 09:05:13', 1337324650472017921, 16457350655250432),
	(1350610088599097346, 'admin', '2021-01-17 09:05:13', 0, 'admin', '2021-01-17 09:05:13', 1337325396064079872, 16457350655250432),
	(1350610088599097347, 'admin', '2021-01-17 09:05:13', 0, 'admin', '2021-01-17 09:05:13', 1337376912225472513, 16457350655250432),
	(1350610088599097348, 'admin', '2021-01-17 09:05:13', 0, 'admin', '2021-01-17 09:05:13', 1337377059000946689, 16457350655250432),
	(1350610088599097349, 'admin', '2021-01-17 09:05:13', 0, 'admin', '2021-01-17 09:05:13', 1337319951794573313, 16457350655250432),
	(1350610088599097350, 'admin', '2021-01-17 09:05:13', 0, 'admin', '2021-01-17 09:05:13', 1337366451853594624, 16457350655250432),
	(1350610088599097351, 'admin', '2021-01-17 09:05:13', 0, 'admin', '2021-01-17 09:05:13', 1337366572867653632, 16457350655250432),
	(1350610088599097352, 'admin', '2021-01-17 09:05:13', 0, 'admin', '2021-01-17 09:05:13', 1337557674727968769, 16457350655250432),
	(1350610088599097353, 'admin', '2021-01-17 09:05:13', 0, 'admin', '2021-01-17 09:05:13', 1337320087052488705, 16457350655250432),
	(1350610088599097354, 'admin', '2021-01-17 09:05:13', 0, 'admin', '2021-01-17 09:05:13', 1337391052256055297, 16457350655250432),
	(1350610088599097355, 'admin', '2021-01-17 09:05:13', 0, 'admin', '2021-01-17 09:05:13', 1337391123898961921, 16457350655250432),
	(1463389412896411648, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 125909152017944576, 496138616573952),
	(1463389412896411649, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 5129710648430592, 496138616573952),
	(1463389412896411650, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 5129710648430593, 496138616573952),
	(1463389412896411651, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 15701400130424832, 496138616573952),
	(1463389412896411652, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 16678126574637056, 496138616573952),
	(1463389412896411653, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 15701915807518720, 496138616573952),
	(1463389412896411654, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 15708892205944832, 496138616573952),
	(1463389412896411655, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 16678447719911424, 496138616573952),
	(1463389412896411656, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 25014528525733888, 496138616573952),
	(1463389412896411657, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 56898976661639168, 496138616573952),
	(1463389412896411658, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 156365156580855808, 496138616573952),
	(1463389412896411659, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 5129710648430594, 496138616573952),
	(1463389412896411660, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 16687383932047360, 496138616573952),
	(1463389412896411661, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 16689632049631232, 496138616573952),
	(1463389412896411662, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 16689745006432256, 496138616573952),
	(1463389412896411663, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 16689883993083904, 496138616573952),
	(1463389412896411664, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 16690313745666048, 496138616573952),
	(1463389412896411665, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 5129710648430595, 496138616573952),
	(1463389412896411666, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 16694861252005888, 496138616573952),
	(1463389412896411667, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 16695107491205120, 496138616573952),
	(1463389412896411668, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 16695243126607872, 496138616573952),
	(1463389412896411669, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 75002207560273920, 496138616573952),
	(1463389412896411670, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 76215889006956544, 496138616573952),
	(1463389412896411671, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 76216071333351424, 496138616573952),
	(1463389412896411672, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 76216264070008832, 496138616573952),
	(1463389412896411673, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 76216459709124608, 496138616573952),
	(1463389412896411674, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 76216594207870976, 496138616573952),
	(1463389412896411675, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 76216702639017984, 496138616573952),
	(1463389412896411676, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 39915540965232640, 496138616573952),
	(1463389412896411677, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 41363147411427328, 496138616573952),
	(1463389412896411678, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 41363537456533504, 496138616573952),
	(1463389412896411679, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 41364927394353152, 496138616573952),
	(1463389412896411680, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 121426317022334976, 496138616573952),
	(1463389412896411681, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 1255336077691064320, 496138616573952),
	(1463389412896411682, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 1255336361339260928, 496138616573952),
	(1463389412896411683, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 1255336455472025601, 496138616573952),
	(1463389412896411684, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 1255336553971060737, 496138616573952),
	(1463389412896411685, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 1337319819627859969, 496138616573952),
	(1463389412896411686, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 1337324650472017921, 496138616573952),
	(1463389412896411687, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 1337325396064079872, 496138616573952),
	(1463389412896411688, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 1337376912225472513, 496138616573952),
	(1463389412896411689, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 1337377059000946689, 496138616573952),
	(1463389412896411690, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 1337319951794573313, 496138616573952),
	(1463389412896411691, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 1337366451853594624, 496138616573952),
	(1463389412896411692, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 1337366572867653632, 496138616573952),
	(1463389412896411693, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 1337557674727968769, 496138616573952),
	(1463389412896411694, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 1337320087052488705, 496138616573952),
	(1463389412896411695, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 1337391052256055297, 496138616573952),
	(1463389412896411696, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 1337391123898961921, 496138616573952),
	(1463389412896411697, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 1337320167616679936, 496138616573952),
	(1463389412896411698, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 1337741980058390528, 496138616573952),
	(1463389412896411699, 'admin', '2021-11-24 14:09:59', 0, 'admin', '2021-11-24 14:09:59', 1337742085226369025, 496138616573952);
/*!40000 ALTER TABLE `t_role_permission` ENABLE KEYS */;

-- 导出  表 medicine.t_roster 结构
DROP TABLE IF EXISTS `t_roster`;
CREATE TABLE IF NOT EXISTS `t_roster` (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `identity` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `insurance_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `balance` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `card_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `native_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `age` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `insurance_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

-- 正在导出表  medicine.t_roster 的数据：~2 rows (大约)
DELETE FROM `t_roster`;
/*!40000 ALTER TABLE `t_roster` DISABLE KEYS */;
INSERT INTO `t_roster` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `identity`, `insurance_type`, `address`, `balance`, `card_number`, `mobile`, `name`, `native_place`, `sex`, `age`, `status`, `insurance_name`) VALUES
	('1337360883575296000', 'admin', '2020-12-11 19:37:36.000000', 0, 'admin', '2021-01-17 10:50:36.924000', '330281199908080808', '1337709526010433537', '浙江省XX市XX区XX街道', '63235.04', '1545452454152', '17857054301', '张三', '浙江省宁波市余姚市', '女', '22', '0', '基本医疗保险'),
	('1337933671960809473', 'admin', '2020-12-13 09:33:39.662000', 0, 'admin', '2021-11-25 16:16:29.130000', '330282199912121212', '1337933430834466817', '浙江省慈溪市XXXXXX', '61231.29', '545454545454', '17857054302', '李四', '浙江省宁波市慈溪市', '男', '22', '0', '高档医疗保险');
/*!40000 ALTER TABLE `t_roster` ENABLE KEYS */;

-- 导出  表 medicine.t_see_doctor 结构
DROP TABLE IF EXISTS `t_see_doctor`;
CREATE TABLE IF NOT EXISTS `t_see_doctor` (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `medicine_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `price_sum` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `medicine_old` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `price_discount` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `balance` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `balance_new` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `medicine_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `price_old` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `price_you` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

-- 正在导出表  medicine.t_see_doctor 的数据：~5 rows (大约)
DELETE FROM `t_see_doctor`;
/*!40000 ALTER TABLE `t_see_doctor` DISABLE KEYS */;
INSERT INTO `t_see_doctor` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `date`, `type`, `user_id`, `price`, `medicine_price`, `price_sum`, `user_name`, `medicine_old`, `price_discount`, `balance`, `balance_new`, `medicine_name`, `name`, `price_old`, `price_you`) VALUES
	('1340929850193612800', 'admin', '2020-12-21 15:59:24.236000', 0, NULL, NULL, '2020-12-21', '普通门诊', '1337360883575296000', '156.03', '126.93', '282.96', '张三', '195.8', '68.87', '5518.0', '5235.04', '(青霉素)=1.0个*8.8(阿莫西林)=5.0个*31.1(红霉素)=5.0个*6.3', '基本医疗保险', '520.1', '364.07'),
	('1340929947254001665', 'admin', '2020-12-21 15:59:47.362000', 0, NULL, NULL, '2020-12-21', '大病门诊', '1337933671960809473', '686.87', '91.61000000000001', '778.48', '李四', '198.6', '106.98999999999998', '13878.59', '13100.11', '(青霉素)=1个*8.8(苯唑西林)=2个*16.9(阿莫西林)=3个*31.1(红霉素)=4个*6.3(诺氟沙星)=5个*7.5', '高档医疗保险', '6868.7', '6181.83'),
	('1350633403585794049', 'admin', '2021-01-17 10:37:51.638000', 0, NULL, NULL, '2021-1-17', 'B类大病门诊', '1337933671960809473', '1500', '5340', '6840', '李四', '9900', '4560', '29100.11', '22260.11', '(腰椎穿刺)=1次*6000(经皮腹腔穿刺术)=1次*3900', '高档医疗保险', '5000', '3500'),
	('1350636890440732672', 'admin', '2021-01-17 10:51:42.976000', 0, NULL, NULL, '2021-1-17', 'A类大病门诊', '1337933671960809473', '100', '640', '740', '李四', '1600', '960', '57911.29', '57171.29', '(胸腔穿刺术)=1次*1600', '高档医疗保险', '1000', '900'),
	('1355751405658443777', 'admin', '2021-01-31 13:34:58.452000', 0, NULL, NULL, '2021-1-31', 'A类大病门诊', '1337933671960809473', '500', '3640', '4140', '李四', '7600', '3960', '65311.29', '61171.29', '(胸腔穿刺术)=1次*1600(腰椎穿刺)=1次*6000', '高档医疗保险', '5000', '4500');
/*!40000 ALTER TABLE `t_see_doctor` ENABLE KEYS */;

-- 导出  表 medicine.t_setting 结构
DROP TABLE IF EXISTS `t_setting`;
CREATE TABLE IF NOT EXISTS `t_setting` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  medicine.t_setting 的数据：~0 rows (大约)
DELETE FROM `t_setting`;
/*!40000 ALTER TABLE `t_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_setting` ENABLE KEYS */;

-- 导出  表 medicine.t_user 结构
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE IF NOT EXISTS `t_user` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `pass_strength` varchar(2) DEFAULT NULL,
  `department_title` varchar(255) DEFAULT NULL,
  `birth` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  medicine.t_user 的数据：~3 rows (大约)
DELETE FROM `t_user`;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `address`, `avatar`, `description`, `email`, `mobile`, `nickname`, `password`, `sex`, `status`, `type`, `username`, `del_flag`, `department_id`, `street`, `pass_strength`, `department_title`, `birth`) VALUES
	(682265633886208, '', '2020-12-13 07:07:07', 'admin', '2020-12-13 07:07:07', '["330000","330600","330602"]', 'https://i.loli.net/2019/04/28/5cc5a71a6e3b6.png', '绍兴文理学院元培学院', '809394828@qq.com', '17857054385', '管理员', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '男', 0, 1, 'admin', 0, 40322777781112832, '东浦街道', '弱', '总部', '2000-01-08 00:00:00.000000'),
	(4363087427670016, '', '2020-12-13 07:07:07', 'admin', '2021-01-17 09:06:51', '["110000","110100","110101"]', 'https://i.loli.net/2019/04/28/5cc5a71a6e3b6.png', '', 'bxgsa@qq.cn', '13646661012', '保险公司A', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '男', 0, 0, 'company', 0, 40322777781112832, '', '弱', '总部', '2020-04-28 00:00:00.000000'),
	(16739222421508096, '', '2020-12-13 07:07:07', 'admin', '2021-01-17 09:06:11', '[]', 'https://i.loli.net/2019/04/28/5cc5a71a6e3b6.png', '', 'docter@qq.cn', '13646661011', '医生A', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '男', 0, 0, 'doctor', 0, 40322777781112832, '', '弱', '总部', '2020-04-23 00:00:00.000000');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;

-- 导出  表 medicine.t_user_role 结构
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE IF NOT EXISTS `t_user_role` (
  `id` bigint unsigned NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `role_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  medicine.t_user_role 的数据：~3 rows (大约)
DELETE FROM `t_user_role`;
/*!40000 ALTER TABLE `t_user_role` DISABLE KEYS */;
INSERT INTO `t_user_role` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `role_id`, `user_id`) VALUES
	(1337922925382209536, 'admin', '2020-12-13 08:50:57', 0, 'admin', '2020-12-13 08:50:57', 496138616573952, 682265633886208),
	(1350610331046645760, 'admin', '2021-01-17 09:06:11', 0, 'admin', '2021-01-17 09:06:11', 16457350655250432, 16739222421508096),
	(1350610500785934336, 'admin', '2021-01-17 09:06:51', 0, 'admin', '2021-01-17 09:06:51', 496138616573953, 4363087427670016);
/*!40000 ALTER TABLE `t_user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
