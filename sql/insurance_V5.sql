-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.26 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 insurance 的数据库结构
DROP DATABASE IF EXISTS `insurance`;
CREATE DATABASE IF NOT EXISTS `insurance` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_croatian_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `insurance`;

-- 导出  表 insurance.a_department 结构
DROP TABLE IF EXISTS `a_department`;
CREATE TABLE IF NOT EXISTS `a_department` (
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

-- 正在导出表  insurance.a_department 的数据：~13 rows (大约)
DELETE FROM `a_department`;
INSERT INTO `a_department` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `parent_id`, `sort_order`, `status`, `title`, `is_parent`) VALUES
	(1464487288363945985, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 0, 1.00, 0, '人力资源部', b'1'),
	(1464487332064399361, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 0, 2.00, 0, '行政综合部', b'1'),
	(1464487379074158593, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 0, 3.00, 0, '设计研发部', b'1'),
	(1464487406328745985, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 0, 4.00, 0, '财务部', b'0'),
	(1464487432169852929, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 0, 5.00, 0, '综合发展部', b'0'),
	(1464487524662644737, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464487288363945985, 1.00, 0, 'HRBP部', b'0'),
	(1464487559647334401, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464487288363945985, 2.00, 0, '招聘部', b'0'),
	(1464487623933431809, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464487332064399361, 1.00, 0, '安保部', b'0'),
	(1464487656678363137, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464487332064399361, 2.00, 0, '保洁部', b'0'),
	(1464487691780493313, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464487332064399361, 3.00, 0, '设备维修部', b'0'),
	(1464487733895499777, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464487379074158593, 1.00, 0, '视频剪辑部', b'0'),
	(1464487807572643841, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464487379074158593, 2.00, 0, '产品应用部', b'0'),
	(1527834362656198656, 'admin', '2022-05-21 10:11:13', 0, NULL, NULL, 0, 6.00, 0, '客服部', b'0');

-- 导出  表 insurance.a_department_header 结构
DROP TABLE IF EXISTS `a_department_header`;
CREATE TABLE IF NOT EXISTS `a_department_header` (
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

-- 正在导出表  insurance.a_department_header 的数据：~0 rows (大约)
DELETE FROM `a_department_header`;

-- 导出  表 insurance.a_dict 结构
DROP TABLE IF EXISTS `a_dict`;
CREATE TABLE IF NOT EXISTS `a_dict` (
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

-- 正在导出表  insurance.a_dict 的数据：~4 rows (大约)
DELETE FROM `a_dict`;
INSERT INTO `a_dict` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `description`, `title`, `type`, `sort_order`) VALUES
	(75135930788220928, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', '性别', 'sex', 0.00),
	(75388696739713024, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', '分权限', 'permission_type', 2.00),
	(1536612750841745408, 'admin', '2022-06-14 15:33:23', 0, NULL, NULL, '', '学历', 'education', 3.00),
	(1536613395229446144, 'admin', '2022-06-14 15:35:57', 0, NULL, NULL, '', '在职状态', 'occupationStatus', 4.00);

-- 导出  表 insurance.a_dict_data 结构
DROP TABLE IF EXISTS `a_dict_data`;
CREATE TABLE IF NOT EXISTS `a_dict_data` (
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

-- 正在导出表  insurance.a_dict_data 的数据：~24 rows (大约)
DELETE FROM `a_dict_data`;
INSERT INTO `a_dict_data` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `description`, `dict_id`, `sort_order`, `status`, `title`, `value`) VALUES
	(75158227712479232, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75135930788220928, 0.00, 0, '男', '男'),
	(75159254272577536, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75135930788220928, 1.00, 0, '女', '女'),
	(75159898425397248, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75135930788220928, 2.00, -1, '保密', '保密'),
	(75390787835138048, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 0.00, 0, '查看操作(view)', 'view'),
	(75390886501945344, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 1.00, 0, '添加操作(add)', 'add'),
	(75390993939042304, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 2.00, 0, '编辑操作(edit)', 'edit'),
	(75391067532300288, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 3.00, 0, '删除操作(delete)', 'delete'),
	(75391126902673408, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 4.00, 0, '清空操作(clear)', 'clear'),
	(75391192883269632, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 5.00, 0, '启用操作(enable)', 'enable'),
	(75391251024711680, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 6.00, 0, '禁用操作(disable)', 'disable'),
	(75391297124306944, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 7.00, 0, '搜索操作(search)', 'search'),
	(75391343379091456, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 8.00, 0, '上传文件(upload)', 'upload'),
	(75391407526776832, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 9.00, 0, '导出操作(output)', 'output'),
	(75391475042488320, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 10.00, 0, '导入操作(input)', 'input'),
	(75391522182270976, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 11.00, 0, '分配权限(editPerm)', 'editPerm'),
	(75391576364290048, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 12.00, 0, '设为默认(setDefault)', 'setDefault'),
	(75391798033256448, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 75388696739713024, 13.00, 0, '其他操作(other)', 'other'),
	(1536612796106674176, 'admin', '2022-06-14 15:33:34', 0, NULL, NULL, '', 1536612750841745408, 1.00, 0, '博士', '博士'),
	(1536612834962706432, 'admin', '2022-06-14 15:33:43', 0, NULL, NULL, '', 1536612750841745408, 2.00, 0, '硕士', '硕士'),
	(1536612883465637888, 'admin', '2022-06-14 15:33:55', 0, 'admin', '2022-06-14 15:34:13', '', 1536612750841745408, 3.00, 0, '本科', '本科'),
	(1536612930576060416, 'admin', '2022-06-14 15:34:06', 0, 'admin', '2022-06-14 15:34:11', '', 1536612750841745408, 4.00, 0, '专科', '专科'),
	(1536612993519980544, 'admin', '2022-06-14 15:34:21', 0, '', NULL, '', 1536612750841745408, 5.00, 0, '高中及以下', '高中及以下'),
	(1536613425902391296, 'admin', '2022-06-14 15:36:04', 0, NULL, NULL, '', 1536613395229446144, 1.00, 0, '在职', '在职'),
	(1536613447544999936, 'admin', '2022-06-14 15:36:09', 0, NULL, NULL, '', 1536613395229446144, 2.00, 0, '离职', '离职');

-- 导出  表 insurance.a_examine 结构
DROP TABLE IF EXISTS `a_examine`;
CREATE TABLE IF NOT EXISTS `a_examine` (
  `id` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `create_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int NOT NULL,
  `update_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `insurance_id` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `insurance_name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `money` decimal(19,2) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

-- 正在导出表  insurance.a_examine 的数据：~0 rows (大约)
DELETE FROM `a_examine`;
INSERT INTO `a_examine` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `insurance_id`, `insurance_name`, `message`, `money`, `status`, `user_id`, `user_name`) VALUES
	('1540211756255809536', 'admin', '2022-06-24 13:54:33.105000', 0, 'admin', '2022-06-24 13:54:41.359000', '1540199988687147008', '高等医疗保险', '审核通过,已报销!', 870.00, 1, '1540199119237287936', '薛之谦');

-- 导出  表 insurance.a_file 结构
DROP TABLE IF EXISTS `a_file`;
CREATE TABLE IF NOT EXISTS `a_file` (
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

-- 正在导出表  insurance.a_file 的数据：~7 rows (大约)
DELETE FROM `a_file`;
INSERT INTO `a_file` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `name`, `size`, `type`, `url`, `f_key`, `location`) VALUES
	(1527897791781801984, 'admin', '2022-05-21 14:23:15', 0, NULL, NULL, 'gh_57ba35562a20_258.jpg', 43531, 'image/jpeg', 'C:\\oa-file/20220521/1e07b00ffc20427fbdf2c434231c1e1e.jpg', '1e07b00ffc20427fbdf2c434231c1e1e.jpg', 0),
	(1527897840372813824, 'admin', '2022-05-21 14:23:27', 0, NULL, NULL, '美术版权.xlsx', 3605123, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'C:\\oa-file/20220521/4c1dadd45a8a4aca9a9ebd5f3256ba45.xlsx', '4c1dadd45a8a4aca9a9ebd5f3256ba45.xlsx', 0),
	(1527897921570344960, 'admin', '2022-05-21 14:23:46', 0, NULL, NULL, '公司大门通行设备使用说明-V1.pdf', 914877, 'application/pdf', 'C:\\oa-file/20220521/74e865aed9594ea9a9a0536161e40066.pdf', '74e865aed9594ea9a9a0536161e40066.pdf', 0),
	(1527898199690448896, 'admin', '2022-05-21 14:24:52', 0, NULL, NULL, '111.mp4', 180593, 'video/mp4', 'C:\\oa-file/20220521/113344a2389349ed8d02fb7dacfa058f.mp4', '113344a2389349ed8d02fb7dacfa058f.mp4', 0),
	(1527899386892390400, 'admin', '2022-05-21 14:29:36', 0, NULL, NULL, '【模版】需求文档.md.zip', 3104, 'application/x-zip-compressed', 'C:\\oa-file/20220521/dacc0bc61cf34bc18d1259b4ce60d52c.zip', 'dacc0bc61cf34bc18d1259b4ce60d52c.zip', 0),
	(1536614206311370752, 'admin', '2022-06-14 15:39:10', 0, NULL, NULL, '张三签名.png', 1686, 'image/png', 'C:\\\\oa-file/20220614/62a6f2fde5994e5fac6a78aa5ad070ad.png', '62a6f2fde5994e5fac6a78aa5ad070ad.png', 0),
	(1536614698903015424, 'admin', '2022-06-14 15:41:08', 0, NULL, NULL, '张三简历.pdf', 28091, 'application/pdf', 'C:\\\\oa-file/20220614/2a643018f08a4a4bbfacbb19218ab1e2.pdf', '2a643018f08a4a4bbfacbb19218ab1e2.pdf', 0);

-- 导出  表 insurance.a_insurance 结构
DROP TABLE IF EXISTS `a_insurance`;
CREATE TABLE IF NOT EXISTS `a_insurance` (
  `id` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `create_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int NOT NULL,
  `update_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `big` decimal(19,2) DEFAULT NULL,
  `common` decimal(19,2) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `mine` decimal(19,2) DEFAULT NULL,
  `one` decimal(19,2) DEFAULT NULL,
  `three` decimal(19,2) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `two` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

-- 正在导出表  insurance.a_insurance 的数据：~0 rows (大约)
DELETE FROM `a_insurance`;
INSERT INTO `a_insurance` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `big`, `common`, `content`, `mine`, `one`, `three`, `title`, `two`) VALUES
	('1540199783464046592', 'admin', '2022-06-24 13:06:58.569000', 0, NULL, NULL, 30.00, 20.00, '低档医疗保险，报销较少的比例', 10.00, 10.00, 30.00, '低档医疗保险', 20.00),
	('1540199885104615424', 'admin', '2022-06-24 13:07:22.801000', 0, NULL, NULL, 50.00, 40.00, '中等医疗保险，报销中等的比例', 30.00, 30.00, 50.00, '中等医疗保险', 40.00),
	('1540199988687147008', 'admin', '2022-06-24 13:07:47.495000', 0, NULL, NULL, 90.00, 80.00, '高等医疗保险，报销较多的比例', 70.00, 70.00, 90.00, '高等医疗保险', 80.00);

-- 导出  表 insurance.a_log 结构
DROP TABLE IF EXISTS `a_log`;
CREATE TABLE IF NOT EXISTS `a_log` (
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
  `code` varchar(255) DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  insurance.a_log 的数据：~216 rows (大约)
DELETE FROM `a_log`;
INSERT INTO `a_log` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `cost_time`, `ip`, `ip_info`, `name`, `request_param`, `request_type`, `request_url`, `username`, `log_type`, `code`, `device`) VALUES
	(1536883393592168448, NULL, '2022-06-15 09:28:50', 0, NULL, '2022-06-15 09:28:50', 287, '127.0.0.1', '本地测试', '登录系统', '{"password":"密码隐藏","code":"8817","saveLogin":"true","captchaId":"ef9e5437ff544c8b91d9810febcb58e7","username":"admin"}', 'POST', '/zwz/login', 'admin', 1, '', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883393592168449, NULL, '2022-06-15 09:28:50', 0, NULL, '2022-06-15 09:28:50', 263, '127.0.0.1', '本地测试', '获取当前登录用户', '{}', 'GET', '/zwz/user/info', 'admin', 2, 'USER-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883394787545090, NULL, '2022-06-15 09:28:50', 0, NULL, '2022-06-15 09:28:50', 43, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883395219558400, NULL, '2022-06-15 09:28:50', 0, NULL, '2022-06-15 09:28:50', 69, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883401452294144, NULL, '2022-06-15 09:28:52', 0, NULL, '2022-06-15 09:28:52', 76, '127.0.0.1', '本地测试', '查询日志', '{"logType":"1","pageNumber":"1","endDate":"","pageSize":"15","sort":"createTime","ipInfo":"","startDate":"","key":"","order":"desc"}', 'GET', '/zwz/log/getAllByPage', 'admin', 2, 'LOG-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883413934542848, NULL, '2022-06-15 09:28:54', 0, NULL, '2022-06-15 09:28:54', 40, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883415226388480, NULL, '2022-06-15 09:28:55', 0, NULL, '2022-06-15 09:28:55', 39, '127.0.0.1', '本地测试', '查询全部角色', '{}', 'GET', '/zwz/role/getAllList', 'admin', 2, 'ROLE-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883415259942913, NULL, '2022-06-15 09:28:55', 0, NULL, '2022-06-15 09:28:55', 49, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/sex', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883415280914432, NULL, '2022-06-15 09:28:55', 0, NULL, '2022-06-15 09:28:55', 94, '127.0.0.1', '本地测试', '查询用户', '{"pageNumber":"1","departmentId":"","nickname":"","pageSize":"20","sort":"createTime","order":"desc"}', 'GET', '/zwz/user/getUserList', 'admin', 2, 'USER-07', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883415444492288, NULL, '2022-06-15 09:28:55', 0, NULL, '2022-06-15 09:28:55', 36, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883420095975424, NULL, '2022-06-15 09:28:56', 0, NULL, '2022-06-15 09:28:56', 40, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883420171472896, NULL, '2022-06-15 09:28:56', 0, NULL, '2022-06-15 09:28:56', 58, '127.0.0.1', '本地测试', '查询用户', '{"pageNumber":"1","departmentId":"","pageSize":"10","sort":"createTime","order":"desc"}', 'GET', '/zwz/myUser/getByPage', 'admin', 2, 'USER-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883421131968513, NULL, '2022-06-15 09:28:56', 0, NULL, '2022-06-15 09:28:56', 38, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883423262674944, NULL, '2022-06-15 09:28:57', 0, NULL, '2022-06-15 09:28:57', 50, '127.0.0.1', '本地测试', '查询系统文件', '{"pageNumber":"1","endDate":"","fkey":"","name":"","pageSize":"15","sort":"createTime","type":"","startDate":"","order":"desc"}', 'GET', '/zwz/file/getByCondition', 'admin', 2, 'FILE-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883424516771840, NULL, '2022-06-15 09:28:57', 0, NULL, '2022-06-15 09:28:57', 41, '127.0.0.1', '本地测试', '查看单个配置', '{"id":"FILE_HTTP"}', 'GET', '/zwz/setting/getOne', 'admin', 2, 'SETTING-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883424516771841, NULL, '2022-06-15 09:28:57', 0, NULL, '2022-06-15 09:28:57', 34, '127.0.0.1', '本地测试', '查看单个配置', '{"id":"FILE_PATH"}', 'GET', '/zwz/setting/getOne', 'admin', 2, 'SETTING-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883424516771842, NULL, '2022-06-15 09:28:57', 0, NULL, '2022-06-15 09:28:57', 44, '127.0.0.1', '本地测试', '查看单个配置', '{"id":"FILE_VIEW"}', 'GET', '/zwz/setting/getOne', 'admin', 2, 'SETTING-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883426920108032, NULL, '2022-06-15 09:28:58', 0, NULL, '2022-06-15 09:28:58', 55, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883430367825920, NULL, '2022-06-15 09:28:58', 0, NULL, '2022-06-15 09:28:58', 45, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883433186398208, NULL, '2022-06-15 09:28:59', 0, NULL, '2022-06-15 09:28:59', 43, '127.0.0.1', '本地测试', '查询日志', '{"logType":"1","pageNumber":"1","endDate":"","pageSize":"15","sort":"createTime","ipInfo":"","startDate":"","key":"","order":"desc"}', 'GET', '/zwz/log/getAllByPage', 'admin', 2, 'LOG-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883444859146240, NULL, '2022-06-15 09:29:02', 0, NULL, '2022-06-15 09:29:02', 50, '127.0.0.1', '本地测试', '查询所有数据字典', '{}', 'GET', '/zwz/dict/getAll', 'admin', 2, 'DICT-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883444947226624, NULL, '2022-06-15 09:29:02', 0, NULL, '2022-06-15 09:29:02', 59, '127.0.0.1', '本地测试', '查询数据字典值', '{"pageNumber":"1","name":"","pageSize":"10","sort":"sortOrder","status":"","order":"asc"}', 'GET', '/zwz/dictData/getByCondition', 'admin', 2, 'DICT_DATA-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883446968881152, NULL, '2022-06-15 09:29:02', 0, NULL, '2022-06-15 09:29:02', 43, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883451238682624, NULL, '2022-06-15 09:29:03', 0, NULL, '2022-06-15 09:29:03', 52, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/sex', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883451347734528, NULL, '2022-06-15 09:29:03', 0, NULL, '2022-06-15 09:29:03', 65, '127.0.0.1', '本地测试', '查询学生', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/student/getByPage', 'admin', 3, 'STUDENT-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883452538916864, NULL, '2022-06-15 09:29:04', 0, NULL, '2022-06-15 09:29:04', 43, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/education', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883453881094144, NULL, '2022-06-15 09:29:04', 0, NULL, '2022-06-15 09:29:04', 48, '127.0.0.1', '本地测试', '查询教师', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/teacher/getByPage', 'admin', 3, 'TEACHER-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883466526920704, NULL, '2022-06-15 09:29:07', 0, NULL, '2022-06-15 09:29:07', 42, '127.0.0.1', '本地测试', '查询图表数据', '{}', 'GET', '/zwz/teacher/getAntvVoList', 'admin', 4, 'CHART-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883470083690496, NULL, '2022-06-15 09:29:08', 0, NULL, '2022-06-15 09:29:08', 46, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883482377195520, NULL, '2022-06-15 09:29:11', 0, NULL, '2022-06-15 09:29:11', 41, '127.0.0.1', '本地测试', '查询日志', '{"logType":"1","pageNumber":"1","endDate":"","pageSize":"15","sort":"createTime","ipInfo":"","startDate":"","key":"","order":"desc"}', 'GET', '/zwz/log/getAllByPage', 'admin', 2, 'LOG-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883484109443072, NULL, '2022-06-15 09:29:11', 0, NULL, '2022-06-15 09:29:11', 50, '127.0.0.1', '本地测试', '查询日志', '{"logType":"2","pageNumber":"1","endDate":"","pageSize":"15","sort":"createTime","ipInfo":"","startDate":"","key":"","order":"desc"}', 'GET', '/zwz/log/getAllByPage', 'admin', 2, 'LOG-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883506003709952, NULL, '2022-06-15 09:29:16', 0, NULL, '2022-06-15 09:29:16', 86, '127.0.0.1', '本地测试', '查询日志', '{"logType":"3","pageNumber":"1","endDate":"","pageSize":"15","sort":"createTime","ipInfo":"","startDate":"","key":"","order":"desc"}', 'GET', '/zwz/log/getAllByPage', 'admin', 2, 'LOG-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883509954744320, NULL, '2022-06-15 09:29:17', 0, NULL, '2022-06-15 09:29:17', 38, '127.0.0.1', '本地测试', '查询日志', '{"logType":"4","pageNumber":"1","endDate":"","pageSize":"15","sort":"createTime","ipInfo":"","startDate":"","key":"","order":"desc"}', 'GET', '/zwz/log/getAllByPage', 'admin', 2, 'LOG-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1536883517961670656, NULL, '2022-06-15 09:29:19', 0, NULL, '2022-06-15 09:29:19', 39, '127.0.0.1', '本地测试', '查询日志', '{"logType":"1","pageNumber":"1","endDate":"","pageSize":"15","sort":"createTime","ipInfo":"","startDate":"","key":"","order":"desc"}', 'GET', '/zwz/log/getAllByPage', 'admin', 2, 'LOG-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174260671221760, NULL, '2022-06-24 11:25:34', 0, NULL, '2022-06-24 11:25:34', 64, '127.0.0.1', '本地测试', '登录系统', '{"password":"密码隐藏","code":"3427","saveLogin":"true","captchaId":"3224a8d4cf0f4121924a6bff1e70ba98","username":"admin"}', 'POST', '/zwz/login', 'admin', 1, '', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174260763496448, NULL, '2022-06-24 11:25:34', 0, NULL, '2022-06-24 11:25:34', 108, '127.0.0.1', '本地测试', '获取当前登录用户', '{}', 'GET', '/zwz/user/info', 'admin', 2, 'USER-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174261602357248, NULL, '2022-06-24 11:25:34', 0, NULL, '2022-06-24 11:25:34', 58, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174261619134464, NULL, '2022-06-24 11:25:34', 0, NULL, '2022-06-24 11:25:34', 136, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174298461900800, NULL, '2022-06-24 11:25:43', 0, NULL, '2022-06-24 11:25:43', 75, '127.0.0.1', '本地测试', '登录系统', '{"password":"密码隐藏","code":"1497","saveLogin":"true","captchaId":"d8aad010de0b442694ce41a0584d1fac","username":"admin"}', 'POST', '/zwz/login', 'admin', 1, '', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174298503843840, NULL, '2022-06-24 11:25:43', 0, NULL, '2022-06-24 11:25:43', 65, '127.0.0.1', '本地测试', '获取当前登录用户', '{}', 'GET', '/zwz/user/info', 'admin', 2, 'USER-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174299170738176, NULL, '2022-06-24 11:25:43', 0, NULL, '2022-06-24 11:25:43', 114, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174299304955904, NULL, '2022-06-24 11:25:43', 0, NULL, '2022-06-24 11:25:43', 46, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174310008819712, NULL, '2022-06-24 11:25:45', 0, NULL, '2022-06-24 11:25:45', 67, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174311279693824, NULL, '2022-06-24 11:25:46', 0, NULL, '2022-06-24 11:25:46', 46, '127.0.0.1', '本地测试', '查询全部角色', '{}', 'GET', '/zwz/role/getAllList', 'admin', 2, 'ROLE-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174311325831168, NULL, '2022-06-24 11:25:46', 0, NULL, '2022-06-24 11:25:46', 55, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/sex', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174311485214720, NULL, '2022-06-24 11:25:46', 0, NULL, '2022-06-24 11:25:46', 37, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174311548129280, NULL, '2022-06-24 11:25:46', 0, NULL, '2022-06-24 11:25:46', 85, '127.0.0.1', '本地测试', '查询用户', '{"pageNumber":"1","departmentId":"","nickname":"","pageSize":"20","sort":"createTime","order":"desc"}', 'GET', '/zwz/user/getUserList', 'admin', 2, 'USER-07', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174319722827776, NULL, '2022-06-24 11:25:48', 0, NULL, '2022-06-24 11:25:48', 50, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174319903182848, NULL, '2022-06-24 11:25:48', 0, NULL, '2022-06-24 11:25:48', 92, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174320838512640, NULL, '2022-06-24 11:25:48', 0, NULL, '2022-06-24 11:25:48', 40, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174373091151872, NULL, '2022-06-24 11:26:00', 0, NULL, '2022-06-24 11:26:00', 94, '127.0.0.1', '本地测试', '修改菜单权限', '{"permIds":"125909152017944576,1464484663442673664,5129710648430593,1464485105081913345,40238597734928384,1464485485316542465,56309618086776832,5129710648430592,5129710648430594,5129710648430595,1530689520276738048,1530689602321518592,39915540965232640,41363147411427328,1535166254703316992,1535166438371889152","roleId":"496138616573952"}', 'POST', '/zwz/role/editRolePerm', 'admin', 2, 'ROLE-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174374815010816, NULL, '2022-06-24 11:26:01', 0, NULL, '2022-06-24 11:26:01', 41, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174374882119680, NULL, '2022-06-24 11:26:01', 0, NULL, '2022-06-24 11:26:01', 97, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174379848175616, NULL, '2022-06-24 11:26:02', 0, NULL, '2022-06-24 11:26:02', 47, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174393769070592, NULL, '2022-06-24 11:26:05', 0, NULL, '2022-06-24 11:26:05', 77, '127.0.0.1', '本地测试', '删除菜单', '{"ids":"1536599942410407936,1536600125332393984,1536600268379131904,1536604417711804416,1536606273959759872,1536606372668510208,1536606464712511488,1536606550951596032,1536606637815631872,1536875505901506560"}', 'POST', '/zwz/permission/delByIds', 'admin', 2, 'PERMISSION-05', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174394679234560, NULL, '2022-06-24 11:26:05', 0, NULL, '2022-06-24 11:26:05', 50, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174395396460545, NULL, '2022-06-24 11:26:06', 0, NULL, '2022-06-24 11:26:06', 42, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174395484540928, NULL, '2022-06-24 11:26:06', 0, NULL, '2022-06-24 11:26:06', 68, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174430179823616, NULL, '2022-06-24 11:26:14', 0, NULL, '2022-06-24 11:26:14', 415, '127.0.0.1', '本地测试', '查询所有数据字典', '{}', 'GET', '/zwz/dict/getAll', 'admin', 2, 'DICT-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174431496835072, NULL, '2022-06-24 11:26:14', 0, NULL, '2022-06-24 11:26:14', 105, '127.0.0.1', '本地测试', '查询数据字典值', '{"pageNumber":"1","name":"","pageSize":"10","sort":"sortOrder","status":"","order":"asc"}', 'GET', '/zwz/dictData/getByCondition', 'admin', 2, 'DICT_DATA-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174438018977792, NULL, '2022-06-24 11:26:16', 0, NULL, '2022-06-24 11:26:16', 43, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174440506200064, NULL, '2022-06-24 11:26:16', 0, NULL, '2022-06-24 11:26:16', 45, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174445493227520, NULL, '2022-06-24 11:26:18', 0, NULL, '2022-06-24 11:26:18', 38, '127.0.0.1', '本地测试', '查看单个配置', '{"id":"FILE_HTTP"}', 'GET', '/zwz/setting/getOne', 'admin', 2, 'SETTING-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174445493227521, NULL, '2022-06-24 11:26:18', 0, NULL, '2022-06-24 11:26:18', 38, '127.0.0.1', '本地测试', '查看单个配置', '{"id":"FILE_PATH"}', 'GET', '/zwz/setting/getOne', 'admin', 2, 'SETTING-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174445493227522, NULL, '2022-06-24 11:26:18', 0, NULL, '2022-06-24 11:26:18', 75, '127.0.0.1', '本地测试', '查看单个配置', '{"id":"FILE_VIEW"}', 'GET', '/zwz/setting/getOne', 'admin', 2, 'SETTING-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174445585502208, NULL, '2022-06-24 11:26:18', 0, NULL, '2022-06-24 11:26:18', 90, '127.0.0.1', '本地测试', '查询系统文件', '{"pageNumber":"1","endDate":"","fkey":"","name":"","pageSize":"15","sort":"createTime","type":"","startDate":"","order":"desc"}', 'GET', '/zwz/file/getByCondition', 'admin', 2, 'FILE-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174448907390976, NULL, '2022-06-24 11:26:18', 0, NULL, '2022-06-24 11:26:18', 38, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174448940945408, NULL, '2022-06-24 11:26:18', 0, NULL, '2022-06-24 11:26:18', 39, '127.0.0.1', '本地测试', '查询用户', '{"pageNumber":"1","departmentId":"","pageSize":"10","sort":"createTime","order":"desc"}', 'GET', '/zwz/myUser/getByPage', 'admin', 2, 'USER-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174450371203072, NULL, '2022-06-24 11:26:19', 0, NULL, '2022-06-24 11:26:19', 33, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174457522491393, NULL, '2022-06-24 11:26:20', 0, NULL, '2022-06-24 11:26:20', 35, '127.0.0.1', '本地测试', '查询全部角色', '{}', 'GET', '/zwz/role/getAllList', 'admin', 2, 'ROLE-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174457526685698, NULL, '2022-06-24 11:26:20', 0, NULL, '2022-06-24 11:26:20', 36, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174457530880000, NULL, '2022-06-24 11:26:20', 0, NULL, '2022-06-24 11:26:20', 41, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/sex', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174457577017344, NULL, '2022-06-24 11:26:20', 0, NULL, '2022-06-24 11:26:20', 46, '127.0.0.1', '本地测试', '查询用户', '{"pageNumber":"1","departmentId":"","nickname":"","pageSize":"20","sort":"createTime","order":"desc"}', 'GET', '/zwz/user/getUserList', 'admin', 2, 'USER-07', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174458659147776, NULL, '2022-06-24 11:26:21', 0, NULL, '2022-06-24 11:26:21', 36, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174472332578816, NULL, '2022-06-24 11:26:24', 0, NULL, '2022-06-24 11:26:24', 36, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174678281293824, NULL, '2022-06-24 11:27:13', 0, NULL, '2022-06-24 11:27:13', 79, '127.0.0.1', '本地测试', '添加菜单', '{"level":"0","sortOrder":"1","name":"topMenu2","icon":"ios-apps","type":"-1","title":"大病人员模块","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174679405367296, NULL, '2022-06-24 11:27:13', 0, NULL, '2022-06-24 11:27:13', 39, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174679975792640, NULL, '2022-06-24 11:27:13', 0, NULL, '2022-06-24 11:27:13', 41, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174680084844544, NULL, '2022-06-24 11:27:14', 0, NULL, '2022-06-24 11:27:14', 115, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174736024276992, NULL, '2022-06-24 11:27:27', 0, NULL, '2022-06-24 11:27:27', 76, '127.0.0.1', '本地测试', '添加菜单', '{"level":"0","sortOrder":"3","name":"topMenu3","icon":"ios-apps","type":"-1","title":"大病保险模块","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174737731358722, NULL, '2022-06-24 11:27:27', 0, NULL, '2022-06-24 11:27:27', 32, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174737802661888, NULL, '2022-06-24 11:27:27', 0, NULL, '2022-06-24 11:27:27', 77, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174737861382144, NULL, '2022-06-24 11:27:27', 0, NULL, '2022-06-24 11:27:27', 62, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174781310177280, NULL, '2022-06-24 11:27:38', 0, NULL, '2022-06-24 11:27:38', 74, '127.0.0.1', '本地测试', '添加菜单', '{"level":"0","sortOrder":"4","name":"topMenu4","icon":"ios-apps","type":"-1","title":"大病登记模块","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174782979510274, NULL, '2022-06-24 11:27:38', 0, NULL, '2022-06-24 11:27:38', 31, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174782992093185, NULL, '2022-06-24 11:27:38', 0, NULL, '2022-06-24 11:27:38', 81, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174783059202048, NULL, '2022-06-24 11:27:38', 0, NULL, '2022-06-24 11:27:38', 96, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174828387045376, NULL, '2022-06-24 11:27:49', 0, NULL, '2022-06-24 11:27:49', 84, '127.0.0.1', '本地测试', '添加菜单', '{"level":"0","sortOrder":"5","name":"topMenu5","icon":"ios-apps","type":"-1","title":"保险审核模块","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174830098321410, NULL, '2022-06-24 11:27:49', 0, NULL, '2022-06-24 11:27:49', 34, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174830110904321, NULL, '2022-06-24 11:27:49', 0, NULL, '2022-06-24 11:27:49', 70, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174830173818880, NULL, '2022-06-24 11:27:49', 0, NULL, '2022-06-24 11:27:49', 81, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174836431720448, NULL, '2022-06-24 11:27:51', 0, NULL, '2022-06-24 11:27:51', 27, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1540174678230962176"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174840621830144, NULL, '2022-06-24 11:27:52', 0, NULL, '2022-06-24 11:27:52', 28, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174841611685888, NULL, '2022-06-24 11:27:52', 0, NULL, '2022-06-24 11:27:52', 36, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540174844358955008, NULL, '2022-06-24 11:27:53', 0, NULL, '2022-06-24 11:27:53', 28, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1540174678230962176"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175110563041280, NULL, '2022-06-24 11:28:56', 0, NULL, '2022-06-24 11:28:56', 66, '127.0.0.1', '本地测试', '添加菜单', '{"path":"/rosterMenu","component":"Main","buttonType":"","level":"1","sortOrder":"1","icon":"md-contacts","name":"rosterMenu","type":"0","title":"参保人员档案","parentId":"1540174678230962176","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175111657754624, NULL, '2022-06-24 11:28:56', 0, NULL, '2022-06-24 11:28:56', 30, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175112270123008, NULL, '2022-06-24 11:28:57', 0, NULL, '2022-06-24 11:28:57', 34, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175112358203392, NULL, '2022-06-24 11:28:57', 0, NULL, '2022-06-24 11:28:57', 93, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175115768172544, NULL, '2022-06-24 11:28:57', 0, NULL, '2022-06-24 11:28:57', 33, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1540175110533681152"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175220101484544, NULL, '2022-06-24 11:29:22', 0, NULL, '2022-06-24 11:29:22', 90, '127.0.0.1', '本地测试', '添加菜单', '{"path":"roster","component":"roster/roster/index","buttonType":"","level":"2","sortOrder":"1","icon":"ios-disc","name":"roster","type":"0","title":"参保人员档案","parentId":"1540175110533681152","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175221166837760, NULL, '2022-06-24 11:29:22', 0, NULL, '2022-06-24 11:29:22', 37, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175221988921344, NULL, '2022-06-24 11:29:23', 0, NULL, '2022-06-24 11:29:23', 38, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175222139916288, NULL, '2022-06-24 11:29:23', 0, NULL, '2022-06-24 11:29:23', 74, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175248463368192, NULL, '2022-06-24 11:29:29', 0, NULL, '2022-06-24 11:29:29', 87, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1540174678230962176"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175326494199808, NULL, '2022-06-24 11:29:48', 0, NULL, '2022-06-24 11:29:48', 84, '127.0.0.1', '本地测试', '添加菜单', '{"path":"/rechangeMenu","component":"Main","buttonType":"","level":"1","sortOrder":"2","icon":"md-cube","name":"rechangeMenu","type":"0","title":"医保充值","parentId":"1540174678230962176","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175327656022016, NULL, '2022-06-24 11:29:48', 0, NULL, '2022-06-24 11:29:48', 57, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175328348082176, NULL, '2022-06-24 11:29:48', 0, NULL, '2022-06-24 11:29:48', 40, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175328436162560, NULL, '2022-06-24 11:29:48', 0, NULL, '2022-06-24 11:29:48', 91, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175331930017792, NULL, '2022-06-24 11:29:49', 0, NULL, '2022-06-24 11:29:49', 31, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1540175326473228288"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175469343805440, NULL, '2022-06-24 11:30:22', 0, NULL, '2022-06-24 11:30:22', 78, '127.0.0.1', '本地测试', '添加菜单', '{"path":"recharge","component":"roster/recharge/index","buttonType":"","level":"2","sortOrder":"2","icon":"md-football","name":"recharge","type":"0","title":"医保充值","parentId":"1540175326473228288","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175470455296000, NULL, '2022-06-24 11:30:22', 0, NULL, '2022-06-24 11:30:22', 23, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175471084441601, NULL, '2022-06-24 11:30:22', 0, NULL, '2022-06-24 11:30:22', 29, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175471172521984, NULL, '2022-06-24 11:30:22', 0, NULL, '2022-06-24 11:30:22', 82, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175475714953216, NULL, '2022-06-24 11:30:23', 0, NULL, '2022-06-24 11:30:23', 21, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1540174735994916864"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175589825187840, NULL, '2022-06-24 11:30:50', 0, NULL, '2022-06-24 11:30:50', 128, '127.0.0.1', '本地测试', '添加菜单', '{"path":"/insuranceMenu","component":"Main","buttonType":"","level":"1","sortOrder":"1","icon":"ios-folder","name":"insuranceMenu","type":"0","title":"医疗保险档案","parentId":"1540174735994916864","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175590995398656, NULL, '2022-06-24 11:30:51', 0, NULL, '2022-06-24 11:30:51', 41, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175591750373376, NULL, '2022-06-24 11:30:51', 0, NULL, '2022-06-24 11:30:51', 40, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175591859425280, NULL, '2022-06-24 11:30:51', 0, NULL, '2022-06-24 11:30:51', 96, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175596280221696, NULL, '2022-06-24 11:30:52', 0, NULL, '2022-06-24 11:30:52', 21, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1540175589804216320"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175693835538432, NULL, '2022-06-24 11:31:15', 0, NULL, '2022-06-24 11:31:15', 65, '127.0.0.1', '本地测试', '添加菜单', '{"path":"insurance","component":"insurance/insurance/index","buttonType":"","level":"2","sortOrder":"1","icon":"ios-images","name":"insurance","type":"0","title":"医疗保险","parentId":"1540175589804216320","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175694917668864, NULL, '2022-06-24 11:31:15', 0, NULL, '2022-06-24 11:31:15', 24, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175695525842944, NULL, '2022-06-24 11:31:16', 0, NULL, '2022-06-24 11:31:16', 24, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175695643283456, NULL, '2022-06-24 11:31:16', 0, NULL, '2022-06-24 11:31:16', 53, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175701624360960, NULL, '2022-06-24 11:31:17', 0, NULL, '2022-06-24 11:31:17', 31, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1540175589804216320"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175797464207360, NULL, '2022-06-24 11:31:40', 0, NULL, '2022-06-24 11:31:40', 55, '127.0.0.1', '本地测试', '添加菜单', '{"path":"operation","component":"insurance/operation/index","buttonType":"","level":"2","sortOrder":"2","icon":"ios-medal","name":"operation","type":"0","title":"手术档案","parentId":"1540175589804216320","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175798584086528, NULL, '2022-06-24 11:31:40', 0, NULL, '2022-06-24 11:31:40', 21, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175799062237185, NULL, '2022-06-24 11:31:40', 0, NULL, '2022-06-24 11:31:40', 24, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175799158706176, NULL, '2022-06-24 11:31:40', 0, NULL, '2022-06-24 11:31:40', 45, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175808696553472, NULL, '2022-06-24 11:31:43', 0, NULL, '2022-06-24 11:31:43', 22, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1540174735994916864"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175953932718080, NULL, '2022-06-24 11:32:17', 0, NULL, '2022-06-24 11:32:17', 67, '127.0.0.1', '本地测试', '添加菜单', '{"path":"/medicalAssetsMenu","component":"Main","buttonType":"","level":"1","sortOrder":"2","icon":"md-move","name":"medicalAssetsMenu","type":"0","title":"医疗资产","parentId":"1540174735994916864","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175955031625728, NULL, '2022-06-24 11:32:17', 0, NULL, '2022-06-24 11:32:17', 26, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175955753046016, NULL, '2022-06-24 11:32:18', 0, NULL, '2022-06-24 11:32:18', 47, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175955962761216, NULL, '2022-06-24 11:32:18', 0, NULL, '2022-06-24 11:32:18', 92, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540175962770116608, NULL, '2022-06-24 11:32:19', 0, NULL, '2022-06-24 11:32:19', 23, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1540175953890775040"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176111718240256, NULL, '2022-06-24 11:32:55', 0, NULL, '2022-06-24 11:32:55', 60, '127.0.0.1', '本地测试', '添加菜单', '{"path":"medicalAssets","component":"medicalAssets/medicalAssets/index","buttonType":"","level":"2","sortOrder":"1","icon":"md-options","name":"medicalAssets","type":"0","title":"医疗资产品类","parentId":"1540175953890775040","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176112821342208, NULL, '2022-06-24 11:32:55', 0, NULL, '2022-06-24 11:32:55', 24, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176113370796032, NULL, '2022-06-24 11:32:55', 0, NULL, '2022-06-24 11:32:55', 25, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176113492430848, NULL, '2022-06-24 11:32:55', 0, NULL, '2022-06-24 11:32:55', 53, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176238239420416, NULL, '2022-06-24 11:33:25', 0, NULL, '2022-06-24 11:33:25', 48, '127.0.0.1', '本地测试', '添加菜单', '{"path":"MedicalAssetsWarehousingOrder","component":"medicalAssets/MedicalAssetsWarehousingOrder/index","buttonType":"","level":"2","sortOrder":"2","icon":"md-pause","name":"MedicalAssetsWarehousingOrder","type":"0","title":"医疗资产入库","parentId":"1540175953890775040","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176239824867331, NULL, '2022-06-24 11:33:25', 0, NULL, '2022-06-24 11:33:25', 16, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176239841644544, NULL, '2022-06-24 11:33:25', 0, NULL, '2022-06-24 11:33:25', 57, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176239980056576, NULL, '2022-06-24 11:33:25', 0, NULL, '2022-06-24 11:33:25', 54, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176306728210432, NULL, '2022-06-24 11:33:41', 0, NULL, '2022-06-24 11:33:41', 63, '127.0.0.1', '本地测试', '添加菜单', '{"path":"MedicalAssetsOutboundOrder","component":"medicalAssets/MedicalAssetsOutboundOrder/index","buttonType":"","level":"2","sortOrder":"3","icon":"md-phone-landscape","name":"MedicalAssetsOutboundOrder","type":"0","title":"医疗资产出库","parentId":"1540175953890775040","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176308380766210, NULL, '2022-06-24 11:33:42', 0, NULL, '2022-06-24 11:33:42', 20, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176308397543424, NULL, '2022-06-24 11:33:42', 0, NULL, '2022-06-24 11:33:42', 59, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176308498206720, NULL, '2022-06-24 11:33:42', 0, NULL, '2022-06-24 11:33:42', 47, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176557765693440, NULL, '2022-06-24 11:34:41', 0, NULL, '2022-06-24 11:34:41', 60, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1540174781276622848"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176637688156160, NULL, '2022-06-24 11:35:00', 0, NULL, '2022-06-24 11:35:00', 64, '127.0.0.1', '本地测试', '添加菜单', '{"path":"/seeDoctorMenu","component":"Main","buttonType":"","level":"1","sortOrder":"1","icon":"md-people","name":"seeDoctorMenu","type":"0","title":"看病","parentId":"1540174781276622848","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176638761897984, NULL, '2022-06-24 11:35:00', 0, NULL, '2022-06-24 11:35:00', 30, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176639357489155, NULL, '2022-06-24 11:35:01', 0, NULL, '2022-06-24 11:35:01', 26, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176639449763840, NULL, '2022-06-24 11:35:01', 0, NULL, '2022-06-24 11:35:01', 48, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176645783162880, NULL, '2022-06-24 11:35:02', 0, NULL, '2022-06-24 11:35:02', 22, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1540176637650407424"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176750162612224, NULL, '2022-06-24 11:35:27', 0, NULL, '2022-06-24 11:35:27', 99, '127.0.0.1', '本地测试', '添加菜单', '{"path":"seeDoctor","component":"seeDoctor/seeDoctor/index","buttonType":"","level":"2","sortOrder":"1","icon":"md-paper","name":"seeDoctor","type":"0","title":"看病登记","parentId":"1540176637650407424","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176751311851520, NULL, '2022-06-24 11:35:27', 0, NULL, '2022-06-24 11:35:27', 41, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176752045854720, NULL, '2022-06-24 11:35:27', 0, NULL, '2022-06-24 11:35:27', 45, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176752150712320, NULL, '2022-06-24 11:35:28', 0, NULL, '2022-06-24 11:35:28', 107, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176758307950592, NULL, '2022-06-24 11:35:29', 0, NULL, '2022-06-24 11:35:29', 34, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1540174828353490944"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176865786990592, NULL, '2022-06-24 11:35:55', 0, NULL, '2022-06-24 11:35:55', 92, '127.0.0.1', '本地测试', '添加菜单', '{"path":"/examineMenu","component":"Main","buttonType":"","level":"1","sortOrder":"1","icon":"md-planet","name":"examineMenu","type":"0","title":"保险审核","parentId":"1540174828353490944","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176866885898240, NULL, '2022-06-24 11:35:55', 0, NULL, '2022-06-24 11:35:55', 36, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176867666038784, NULL, '2022-06-24 11:35:55', 0, NULL, '2022-06-24 11:35:55', 55, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176867871559680, NULL, '2022-06-24 11:35:55', 0, NULL, '2022-06-24 11:35:55', 96, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176874326593536, NULL, '2022-06-24 11:35:57', 0, NULL, '2022-06-24 11:35:57', 33, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1540176865736658944"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176977745547264, NULL, '2022-06-24 11:36:21', 0, NULL, '2022-06-24 11:36:21', 86, '127.0.0.1', '本地测试', '添加菜单', '{"path":"examine","component":"examine/examine/index","buttonType":"","level":"2","sortOrder":"1","icon":"md-power","name":"examine","type":"0","title":"保险审核","parentId":"1540176865736658944","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176978798317568, NULL, '2022-06-24 11:36:22', 0, NULL, '2022-06-24 11:36:22', 31, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176979616206850, NULL, '2022-06-24 11:36:22', 0, NULL, '2022-06-24 11:36:22', 35, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176979796561920, NULL, '2022-06-24 11:36:22', 0, NULL, '2022-06-24 11:36:22', 80, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176996758327296, NULL, '2022-06-24 11:36:26', 0, NULL, '2022-06-24 11:36:26', 29, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540176997655908352, NULL, '2022-06-24 11:36:26', 0, NULL, '2022-06-24 11:36:26', 37, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540177000801636352, NULL, '2022-06-24 11:36:27', 0, NULL, '2022-06-24 11:36:27', 40, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540177077079248896, NULL, '2022-06-24 11:36:45', 0, NULL, '2022-06-24 11:36:45', 102, '127.0.0.1', '本地测试', '修改菜单权限', '{"permIds":"125909152017944576,1464484663442673664,5129710648430593,1464485105081913345,40238597734928384,1464485485316542465,56309618086776832,5129710648430592,5129710648430594,5129710648430595,1530689520276738048,1530689602321518592,39915540965232640,41363147411427328,1535166254703316992,1535166438371889152,1540174678230962176,1540175110533681152,1540175220046958592,1540175326473228288,1540175469318639616,1540174735994916864,1540175589804216320,1540175693793595392,1540175797447430144,1540175953890775040,1540176111701463040,1540176238210060288,1540176306698850304,1540174781276622848,1540176637650407424,1540176750137446400,1540174828353490944,1540176865736658944,1540176977724575744","roleId":"496138616573952"}', 'POST', '/zwz/role/editRolePerm', 'admin', 2, 'ROLE-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540177078798913538, NULL, '2022-06-24 11:36:45', 0, NULL, '2022-06-24 11:36:45', 46, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540177078907965440, NULL, '2022-06-24 11:36:45', 0, NULL, '2022-06-24 11:36:45', 102, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540177087149772800, NULL, '2022-06-24 11:36:47', 0, NULL, '2022-06-24 11:36:47', 30, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540177087846027264, NULL, '2022-06-24 11:36:48', 0, NULL, '2022-06-24 11:36:48', 48, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540177092065497090, NULL, '2022-06-24 11:36:49', 0, NULL, '2022-06-24 11:36:49', 43, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540177226551660544, NULL, '2022-06-24 11:37:21', 0, NULL, '2022-06-24 11:37:21', 91, '127.0.0.1', '本地测试', '登录系统', '{"password":"密码隐藏","code":"3913","saveLogin":"true","captchaId":"e9d1b97b63c94e558267d166927c422b","username":"admin"}', 'POST', '/zwz/login', 'admin', 1, '', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540177226585214976, NULL, '2022-06-24 11:37:21', 0, NULL, '2022-06-24 11:37:21', 67, '127.0.0.1', '本地测试', '获取当前登录用户', '{}', 'GET', '/zwz/user/info', 'admin', 2, 'USER-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540177227025616896, NULL, '2022-06-24 11:37:21', 0, NULL, '2022-06-24 11:37:21', 77, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540177228577509376, NULL, '2022-06-24 11:37:21', 0, NULL, '2022-06-24 11:37:21', 37, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540177235049320448, NULL, '2022-06-24 11:37:23', 0, NULL, '2022-06-24 11:37:23', 42, '127.0.0.1', '本地测试', '查询全部角色', '{}', 'GET', '/zwz/role/getAllList', 'admin', 2, 'ROLE-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540177235061903361, NULL, '2022-06-24 11:37:23', 0, NULL, '2022-06-24 11:37:23', 42, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/sex', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540177235112235008, NULL, '2022-06-24 11:37:23', 0, NULL, '2022-06-24 11:37:23', 92, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540177236404080640, NULL, '2022-06-24 11:37:23', 0, NULL, '2022-06-24 11:37:23', 41, '127.0.0.1', '本地测试', '查询用户', '{"pageNumber":"1","departmentId":"","nickname":"","pageSize":"20","sort":"createTime","order":"desc"}', 'GET', '/zwz/user/getUserList', 'admin', 2, 'USER-07', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540177236785762304, NULL, '2022-06-24 11:37:23', 0, NULL, '2022-06-24 11:37:23', 34, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540177257547567106, NULL, '2022-06-24 11:37:28', 0, NULL, '2022-06-24 11:37:28', 76, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178046798139393, NULL, '2022-06-24 11:40:36', 0, NULL, '2022-06-24 11:40:36', 62, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178064162557953, NULL, '2022-06-24 11:40:40', 0, NULL, '2022-06-24 11:40:40', 103, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178159104823297, NULL, '2022-06-24 11:41:03', 0, NULL, '2022-06-24 11:41:03', 87, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178167027863555, NULL, '2022-06-24 11:41:05', 0, NULL, '2022-06-24 11:41:05', 41, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178167132721152, NULL, '2022-06-24 11:41:05', 0, NULL, '2022-06-24 11:41:05', 98, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178175814930433, NULL, '2022-06-24 11:41:07', 0, NULL, '2022-06-24 11:41:07', 46, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1540176111701463040"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178185939980288, NULL, '2022-06-24 11:41:09', 0, NULL, '2022-06-24 11:41:09', 32, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1540176238210060288"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178188305567744, NULL, '2022-06-24 11:41:10', 0, NULL, '2022-06-24 11:41:10', 36, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1540176306698850304"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178205560934400, NULL, '2022-06-24 11:41:14', 0, NULL, '2022-06-24 11:41:14', 46, '127.0.0.1', '本地测试', '编辑菜单', '{"level":"2","icon":"md-phone-landscape","description":"","delFlag":"0","title":"医疗资产出库","type":"0","parentId":"1540175953890775040","permTypes":"","path":"MedicalAssetsOutboundOrder","createBy":"admin","component":"medicalAssets/medicalAssetsOutboundOrder/index","expand":"true","buttonType":"","updateBy":"","createTime":"2022-06-24 11:33:41","sortOrder":"3","name":"MedicalAssetsOutboundOrder","checked":"false","nodeKey":"28","id":"1540176306698850304","selected":"true","status":"0"}', 'POST', '/zwz/permission/edit', 'admin', 2, 'PERMISSION-07', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178206856974336, NULL, '2022-06-24 11:41:14', 0, NULL, '2022-06-24 11:41:14', 95, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178207205101568, NULL, '2022-06-24 11:41:14', 0, NULL, '2022-06-24 11:41:14', 54, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178207335124992, NULL, '2022-06-24 11:41:15', 0, NULL, '2022-06-24 11:41:15', 121, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178211697201152, NULL, '2022-06-24 11:41:15', 0, NULL, '2022-06-24 11:41:15', 38, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1540176238210060288"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178226100441088, NULL, '2022-06-24 11:41:19', 0, NULL, '2022-06-24 11:41:19', 49, '127.0.0.1', '本地测试', '编辑菜单', '{"level":"2","icon":"md-pause","description":"","delFlag":"0","title":"医疗资产入库","type":"0","parentId":"1540175953890775040","permTypes":"","path":"MedicalAssetsWarehousingOrder","createBy":"admin","component":"medicalAssets/medicalAssetsWarehousingOrder/index","expand":"true","buttonType":"","updateBy":"","createTime":"2022-06-24 11:33:25","sortOrder":"2","name":"MedicalAssetsWarehousingOrder","checked":"false","nodeKey":"27","id":"1540176238210060288","selected":"true","status":"0"}', 'POST', '/zwz/permission/edit', 'admin', 2, 'PERMISSION-07', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178227383898112, NULL, '2022-06-24 11:41:19', 0, NULL, '2022-06-24 11:41:19', 84, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178227673305092, NULL, '2022-06-24 11:41:19', 0, NULL, '2022-06-24 11:41:19', 39, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178227794939904, NULL, '2022-06-24 11:41:19', 0, NULL, '2022-06-24 11:41:19', 91, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178232790355968, NULL, '2022-06-24 11:41:21', 0, NULL, '2022-06-24 11:41:21', 38, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178233998315520, NULL, '2022-06-24 11:41:21', 0, NULL, '2022-06-24 11:41:21', 42, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178236032552960, NULL, '2022-06-24 11:41:21', 0, NULL, '2022-06-24 11:41:21', 45, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178260619563008, NULL, '2022-06-24 11:41:27', 0, NULL, '2022-06-24 11:41:27', 71, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178367737892864, NULL, '2022-06-24 11:41:53', 0, NULL, '2022-06-24 11:41:53', 81, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178380639571968, NULL, '2022-06-24 11:41:56', 0, NULL, '2022-06-24 11:41:56', 38, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178387459510272, NULL, '2022-06-24 11:41:57', 0, NULL, '2022-06-24 11:41:57', 32, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178498059112448, NULL, '2022-06-24 11:42:24', 0, NULL, '2022-06-24 11:42:24', 73, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178569244839936, NULL, '2022-06-24 11:42:41', 0, NULL, '2022-06-24 11:42:41', 79, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178573535612928, NULL, '2022-06-24 11:42:42', 0, NULL, '2022-06-24 11:42:42', 32, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178600865697792, NULL, '2022-06-24 11:42:48', 0, NULL, '2022-06-24 11:42:48', 76, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178759007735809, NULL, '2022-06-24 11:43:26', 0, NULL, '2022-06-24 11:43:26', 93, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540178762686140440, NULL, '2022-06-24 11:43:27', 0, NULL, '2022-06-24 11:43:27', 93, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540181227619880960, NULL, '2022-06-24 11:53:15', 0, NULL, '2022-06-24 11:53:15', 365, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540181246003515392, NULL, '2022-06-24 11:53:19', 0, NULL, '2022-06-24 11:53:19', 54, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540181263321796608, NULL, '2022-06-24 11:53:23', 0, NULL, '2022-06-24 11:53:23', 38, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540181275808239616, NULL, '2022-06-24 11:53:26', 0, NULL, '2022-06-24 11:53:26', 80, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540181281852231680, NULL, '2022-06-24 11:53:27', 0, NULL, '2022-06-24 11:53:27', 33, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540181298197434368, NULL, '2022-06-24 11:53:31', 0, NULL, '2022-06-24 11:53:31', 26, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540181301775175680, NULL, '2022-06-24 11:53:32', 0, NULL, '2022-06-24 11:53:32', 35, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540198212655255553, NULL, '2022-06-24 13:00:44', 0, NULL, '2022-06-24 13:00:44', 80, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540198590088089600, NULL, '2022-06-24 13:02:14', 0, NULL, '2022-06-24 13:02:14', 74, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540198811505397761, NULL, '2022-06-24 13:03:07', 0, NULL, '2022-06-24 13:03:07', 63, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540199677008416768, NULL, '2022-06-24 13:06:33', 0, NULL, '2022-06-24 13:06:33', 255, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540202268886962176, NULL, '2022-06-24 13:16:51', 0, NULL, '2022-06-24 13:16:51', 129, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540202284980506624, NULL, '2022-06-24 13:16:55', 0, NULL, '2022-06-24 13:16:55', 32, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540203775858446336, NULL, '2022-06-24 13:22:51', 0, NULL, '2022-06-24 13:22:51', 70, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540203796708331520, NULL, '2022-06-24 13:22:55', 0, NULL, '2022-06-24 13:22:55', 84, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540204181015629824, NULL, '2022-06-24 13:24:27', 0, NULL, '2022-06-24 13:24:27', 336, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540204465972449280, NULL, '2022-06-24 13:25:35', 0, NULL, '2022-06-24 13:25:35', 329, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540204582335025153, NULL, '2022-06-24 13:26:03', 0, NULL, '2022-06-24 13:26:03', 63, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540207739085656064, NULL, '2022-06-24 13:38:36', 0, NULL, '2022-06-24 13:38:36', 343, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540208635605553152, NULL, '2022-06-24 13:42:09', 0, NULL, '2022-06-24 13:42:09', 101, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540208855806513152, NULL, '2022-06-24 13:43:02', 0, NULL, '2022-06-24 13:43:02', 72, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540209153509822464, NULL, '2022-06-24 13:44:13', 0, NULL, '2022-06-24 13:44:13', 84, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540209171323031552, NULL, '2022-06-24 13:44:17', 0, NULL, '2022-06-24 13:44:17', 36, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540209202692231168, NULL, '2022-06-24 13:44:24', 0, NULL, '2022-06-24 13:44:24', 90, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540209211668041728, NULL, '2022-06-24 13:44:26', 0, NULL, '2022-06-24 13:44:26', 40, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540209226545238016, NULL, '2022-06-24 13:44:30', 0, NULL, '2022-06-24 13:44:30', 39, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540209683711791104, NULL, '2022-06-24 13:46:19', 0, NULL, '2022-06-24 13:46:19', 63, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540209697418776576, NULL, '2022-06-24 13:46:22', 0, NULL, '2022-06-24 13:46:22', 78, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540210203696435200, NULL, '2022-06-24 13:48:23', 0, NULL, '2022-06-24 13:48:23', 64, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540210410236547072, NULL, '2022-06-24 13:49:12', 0, NULL, '2022-06-24 13:49:12', 67, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540210468730310656, NULL, '2022-06-24 13:49:26', 0, NULL, '2022-06-24 13:49:26', 75, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540210526095806464, NULL, '2022-06-24 13:49:40', 0, NULL, '2022-06-24 13:49:40', 66, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540210577140486144, NULL, '2022-06-24 13:49:52', 0, NULL, '2022-06-24 13:49:52', 78, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540210632366886912, NULL, '2022-06-24 13:50:05', 0, NULL, '2022-06-24 13:50:05', 66, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540210683860357120, NULL, '2022-06-24 13:50:17', 0, NULL, '2022-06-24 13:50:17', 61, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540210694450974720, NULL, '2022-06-24 13:50:20', 0, NULL, '2022-06-24 13:50:20', 30, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540211496452231168, NULL, '2022-06-24 13:53:31', 0, NULL, '2022-06-24 13:53:31', 71, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540211594552807424, NULL, '2022-06-24 13:53:55', 0, NULL, '2022-06-24 13:53:55', 68, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540211600445804544, NULL, '2022-06-24 13:53:56', 0, NULL, '2022-06-24 13:53:56', 43, '127.0.0.1', '本地测试', '查询用户', '{"pageNumber":"1","nickname":"","pageSize":"10","id":"","sort":"createTime","type":"","status":"","order":"desc"}', 'GET', '/zwz/myUser/getByPage', 'admin', 2, 'USER-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540211681412648960, NULL, '2022-06-24 13:54:15', 0, NULL, '2022-06-24 13:54:15', 72, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540211771711819776, NULL, '2022-06-24 13:54:37', 0, NULL, '2022-06-24 13:54:37', 56, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540211804293173248, NULL, '2022-06-24 13:54:45', 0, NULL, '2022-06-24 13:54:45', 66, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540211812698558464, NULL, '2022-06-24 13:54:47', 0, NULL, '2022-06-24 13:54:47', 30, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540213533227225088, NULL, '2022-06-24 14:01:37', 0, NULL, '2022-06-24 14:01:37', 58, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540213676475289600, NULL, '2022-06-24 14:02:11', 0, NULL, '2022-06-24 14:02:11', 71, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540213826631372800, NULL, '2022-06-24 14:02:47', 0, NULL, '2022-06-24 14:02:47', 72, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540214117707681792, NULL, '2022-06-24 14:03:56', 0, NULL, '2022-06-24 14:03:56', 76, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540214125613944832, NULL, '2022-06-24 14:03:58', 0, NULL, '2022-06-24 14:03:58', 75, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540214326034567168, NULL, '2022-06-24 14:04:46', 0, NULL, '2022-06-24 14:04:46', 93, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540214326982479872, NULL, '2022-06-24 14:04:46', 0, NULL, '2022-06-24 14:04:46', 74, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540214641903407104, NULL, '2022-06-24 14:06:01', 0, NULL, '2022-06-24 14:06:01', 77, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540214642872291328, NULL, '2022-06-24 14:06:01', 0, NULL, '2022-06-24 14:06:01', 74, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540214707712036864, NULL, '2022-06-24 14:06:17', 0, NULL, '2022-06-24 14:06:17', 63, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540214708496371712, NULL, '2022-06-24 14:06:17', 0, NULL, '2022-06-24 14:06:17', 66, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540215067335856128, NULL, '2022-06-24 14:07:43', 0, NULL, '2022-06-24 14:07:43', 73, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540215068195688448, NULL, '2022-06-24 14:07:43', 0, NULL, '2022-06-24 14:07:43', 76, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540215075162427392, NULL, '2022-06-24 14:07:44', 0, NULL, '2022-06-24 14:07:44', 34, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540215076022259712, NULL, '2022-06-24 14:07:45', 0, NULL, '2022-06-24 14:07:45', 44, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540215106179305472, NULL, '2022-06-24 14:07:52', 0, NULL, '2022-06-24 14:07:52', 74, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540215106959446016, NULL, '2022-06-24 14:07:52', 0, NULL, '2022-06-24 14:07:52', 81, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540215581935013888, NULL, '2022-06-24 14:09:45', 0, NULL, '2022-06-24 14:09:45', 72, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540215582794846208, NULL, '2022-06-24 14:09:45', 0, NULL, '2022-06-24 14:09:45', 75, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540216157456437248, NULL, '2022-06-24 14:12:03', 0, NULL, '2022-06-24 14:12:03', 79, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540216158446292992, NULL, '2022-06-24 14:12:03', 0, NULL, '2022-06-24 14:12:03', 59, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217054253158400, NULL, '2022-06-24 14:15:36', 0, NULL, '2022-06-24 14:15:36', 70, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217072120893440, NULL, '2022-06-24 14:15:41', 0, NULL, '2022-06-24 14:15:41', 31, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217072129282048, NULL, '2022-06-24 14:15:41', 0, NULL, '2022-06-24 14:15:41', 54, '127.0.0.1', '本地测试', '查询全部角色', '{}', 'GET', '/zwz/role/getAllList', 'admin', 2, 'ROLE-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217072179613696, NULL, '2022-06-24 14:15:41', 0, NULL, '2022-06-24 14:15:41', 79, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/sex', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217072183808001, NULL, '2022-06-24 14:15:41', 0, NULL, '2022-06-24 14:15:41', 77, '127.0.0.1', '本地测试', '查询用户', '{"pageNumber":"1","departmentId":"","nickname":"","pageSize":"20","sort":"createTime","order":"desc"}', 'GET', '/zwz/user/getUserList', 'admin', 2, 'USER-07', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217073165275136, NULL, '2022-06-24 14:15:41', 0, NULL, '2022-06-24 14:15:41', 25, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217093402791936, NULL, '2022-06-24 14:15:46', 0, NULL, '2022-06-24 14:15:46', 30, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217138172792832, NULL, '2022-06-24 14:15:56', 0, NULL, '2022-06-24 14:15:56', 71, '127.0.0.1', '本地测试', '查询所有数据字典', '{}', 'GET', '/zwz/dict/getAll', 'admin', 2, 'DICT-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217138239901696, NULL, '2022-06-24 14:15:56', 0, NULL, '2022-06-24 14:15:56', 77, '127.0.0.1', '本地测试', '查询数据字典值', '{"pageNumber":"1","name":"","pageSize":"10","sort":"sortOrder","status":"","order":"asc"}', 'GET', '/zwz/dictData/getByCondition', 'admin', 2, 'DICT_DATA-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217144338419712, NULL, '2022-06-24 14:15:58', 0, NULL, '2022-06-24 14:15:58', 38, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217148834713600, NULL, '2022-06-24 14:15:59', 0, NULL, '2022-06-24 14:15:59', 28, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217153972736000, NULL, '2022-06-24 14:16:00', 0, NULL, '2022-06-24 14:16:00', 41, '127.0.0.1', '本地测试', '查询系统文件', '{"pageNumber":"1","endDate":"","fkey":"","name":"","pageSize":"15","sort":"createTime","type":"","startDate":"","order":"desc"}', 'GET', '/zwz/file/getByCondition', 'admin', 2, 'FILE-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217155193278464, NULL, '2022-06-24 14:16:00', 0, NULL, '2022-06-24 14:16:00', 24, '127.0.0.1', '本地测试', '查看单个配置', '{"id":"FILE_PATH"}', 'GET', '/zwz/setting/getOne', 'admin', 2, 'SETTING-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217155193278465, NULL, '2022-06-24 14:16:00', 0, NULL, '2022-06-24 14:16:00', 49, '127.0.0.1', '本地测试', '查看单个配置', '{"id":"FILE_VIEW"}', 'GET', '/zwz/setting/getOne', 'admin', 2, 'SETTING-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217155193278466, NULL, '2022-06-24 14:16:00', 0, NULL, '2022-06-24 14:16:00', 24, '127.0.0.1', '本地测试', '查看单个配置', '{"id":"FILE_HTTP"}', 'GET', '/zwz/setting/getOne', 'admin', 2, 'SETTING-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217160952057856, NULL, '2022-06-24 14:16:02', 0, NULL, '2022-06-24 14:16:02', 20, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217162269069312, NULL, '2022-06-24 14:16:02', 0, NULL, '2022-06-24 14:16:02', 23, '127.0.0.1', '本地测试', '查询全部角色', '{}', 'GET', '/zwz/role/getAllList', 'admin', 2, 'ROLE-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217162277457925, NULL, '2022-06-24 14:16:02', 0, NULL, '2022-06-24 14:16:02', 27, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/sex', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217162285846529, NULL, '2022-06-24 14:16:02', 0, NULL, '2022-06-24 14:16:02', 27, '127.0.0.1', '本地测试', '查询用户', '{"pageNumber":"1","departmentId":"","nickname":"","pageSize":"20","sort":"createTime","order":"desc"}', 'GET', '/zwz/user/getUserList', 'admin', 2, 'USER-07', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217162399092736, NULL, '2022-06-24 14:16:02', 0, NULL, '2022-06-24 14:16:02', 26, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217180833058816, NULL, '2022-06-24 14:16:06', 0, NULL, '2022-06-24 14:16:06', 30, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217196872077312, NULL, '2022-06-24 14:16:10', 0, NULL, '2022-06-24 14:16:10', 32, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217468583284737, NULL, '2022-06-24 14:17:15', 0, NULL, '2022-06-24 14:17:15', 69, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217498627084288, NULL, '2022-06-24 14:17:22', 0, NULL, '2022-06-24 14:17:22', 74, '127.0.0.1', '本地测试', '查询菜单权限拥有者', '{"permissionId":"1464485485316542465"}', 'GET', '/zwz/permission/getUserByPermission', 'admin', 2, 'PERMISSION-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217595557449728, NULL, '2022-06-24 14:17:45', 0, NULL, '2022-06-24 14:17:45', 59, '127.0.0.1', '本地测试', '添加菜单', '{"path":"oldHome","component":"oldHome/home","buttonType":"","level":"2","sortOrder":"2","icon":"ios-basket","name":"oldHome","type":"0","title":"原首页","parentId":"1464485485316542465","status":"0"}', 'POST', '/zwz/permission/add', 'admin', 2, 'PERMISSION-06', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217597222588416, NULL, '2022-06-24 14:17:46', 0, NULL, '2022-06-24 14:17:46', 26, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217597235171336, NULL, '2022-06-24 14:17:46', 0, NULL, '2022-06-24 14:17:46', 56, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/permission_type', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217597369389056, NULL, '2022-06-24 14:17:46', 0, NULL, '2022-06-24 14:17:46', 55, '127.0.0.1', '本地测试', '查询全部菜单', '{}', 'GET', '/zwz/permission/getAllList', 'admin', 2, 'PERMISSION-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217599349100544, NULL, '2022-06-24 14:17:46', 0, NULL, '2022-06-24 14:17:46', 29, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217643154411520, NULL, '2022-06-24 14:17:57', 0, NULL, '2022-06-24 14:17:57', 108, '127.0.0.1', '本地测试', '修改菜单权限', '{"permIds":"125909152017944576,1464484663442673664,5129710648430593,1464485105081913345,40238597734928384,1464485485316542465,56309618086776832,1540217595502923776,5129710648430592,5129710648430594,5129710648430595,1530689520276738048,1530689602321518592,39915540965232640,41363147411427328,1535166254703316992,1535166438371889152,1540174678230962176,1540175110533681152,1540175220046958592,1540175326473228288,1540175469318639616,1540174735994916864,1540175589804216320,1540175693793595392,1540175797447430144,1540175953890775040,1540176111701463040,1540176238210060288,1540176306698850304,1540174781276622848,1540176637650407424,1540176750137446400,1540174828353490944,1540176865736658944,1540176977724575744","roleId":"496138616573952"}', 'POST', '/zwz/role/editRolePerm', 'admin', 2, 'ROLE-04', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217644806967296, NULL, '2022-06-24 14:17:57', 0, NULL, '2022-06-24 14:17:57', 187, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217644957962240, NULL, '2022-06-24 14:17:57', 0, NULL, '2022-06-24 14:17:57', 29, '127.0.0.1', '本地测试', '查询角色', '{"pageNumber":"1","pageSize":"15","sort":"createTime","order":"desc"}', 'GET', '/zwz/role/getAllByPage', 'admin', 2, 'ROLE-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217648892219393, NULL, '2022-06-24 14:17:58', 0, NULL, '2022-06-24 14:17:58', 27, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217708241620992, NULL, '2022-06-24 14:18:12', 0, NULL, '2022-06-24 14:18:12', 59, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217708669440003, NULL, '2022-06-24 14:18:12', 0, NULL, '2022-06-24 14:18:12', 72, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217717250985984, NULL, '2022-06-24 14:18:14', 0, NULL, '2022-06-24 14:18:14', 23, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217717607501824, NULL, '2022-06-24 14:18:14', 0, NULL, '2022-06-24 14:18:14', 31, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217744593653760, NULL, '2022-06-24 14:18:21', 0, NULL, '2022-06-24 14:18:21', 23, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217960650641408, NULL, '2022-06-24 14:19:12', 0, NULL, '2022-06-24 14:19:12', 40, '127.0.0.1', '本地测试', '查看单个配置', '{"id":"FILE_VIEW"}', 'GET', '/zwz/setting/getOne', 'admin', 2, 'SETTING-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217960650641409, NULL, '2022-06-24 14:19:12', 0, NULL, '2022-06-24 14:19:12', 58, '127.0.0.1', '本地测试', '查看单个配置', '{"id":"FILE_HTTP"}', 'GET', '/zwz/setting/getOne', 'admin', 2, 'SETTING-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217960650641410, NULL, '2022-06-24 14:19:12', 0, NULL, '2022-06-24 14:19:12', 59, '127.0.0.1', '本地测试', '查看单个配置', '{"id":"FILE_PATH"}', 'GET', '/zwz/setting/getOne', 'admin', 2, 'SETTING-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217960675807232, NULL, '2022-06-24 14:19:12', 0, NULL, '2022-06-24 14:19:12', 57, '127.0.0.1', '本地测试', '查询系统文件', '{"pageNumber":"1","endDate":"","fkey":"","name":"","pageSize":"15","sort":"createTime","type":"","startDate":"","order":"desc"}', 'GET', '/zwz/file/getByCondition', 'admin', 2, 'FILE-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217964803002369, NULL, '2022-06-24 14:19:13', 0, NULL, '2022-06-24 14:19:13', 22, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217964811390976, NULL, '2022-06-24 14:19:13', 0, NULL, '2022-06-24 14:19:13', 23, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/sex', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217966086459392, NULL, '2022-06-24 14:19:14', 0, NULL, '2022-06-24 14:19:14', 23, '127.0.0.1', '本地测试', '查询全部角色', '{}', 'GET', '/zwz/role/getAllList', 'admin', 2, 'ROLE-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217966124208128, NULL, '2022-06-24 14:19:14', 0, NULL, '2022-06-24 14:19:14', 32, '127.0.0.1', '本地测试', '查询用户', '{"pageNumber":"1","departmentId":"","nickname":"","pageSize":"20","sort":"createTime","order":"desc"}', 'GET', '/zwz/user/getUserList', 'admin', 2, 'USER-07', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217966203899904, NULL, '2022-06-24 14:19:14', 0, NULL, '2022-06-24 14:19:14', 23, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217985141182466, NULL, '2022-06-24 14:19:18', 0, NULL, '2022-06-24 14:19:18', 24, '127.0.0.1', '本地测试', '查询全部角色', '{}', 'GET', '/zwz/role/getAllList', 'admin', 2, 'ROLE-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217985141182467, NULL, '2022-06-24 14:19:18', 0, NULL, '2022-06-24 14:19:18', 24, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217985145376772, NULL, '2022-06-24 14:19:18', 0, NULL, '2022-06-24 14:19:18', 52, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/sex', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217985157959680, NULL, '2022-06-24 14:19:18', 0, NULL, '2022-06-24 14:19:18', 53, '127.0.0.1', '本地测试', '查询用户', '{"pageNumber":"1","departmentId":"","nickname":"","pageSize":"20","sort":"createTime","order":"desc"}', 'GET', '/zwz/user/getUserList', 'admin', 2, 'USER-07', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217986185564160, NULL, '2022-06-24 14:19:18', 0, NULL, '2022-06-24 14:19:18', 20, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540217989142548482, NULL, '2022-06-24 14:19:19', 0, NULL, '2022-06-24 14:19:19', 26, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540218002224582662, NULL, '2022-06-24 14:19:22', 0, NULL, '2022-06-24 14:19:22', 22, '127.0.0.1', '本地测试', '查询全部角色', '{}', 'GET', '/zwz/role/getAllList', 'admin', 2, 'ROLE-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540218002228776960, NULL, '2022-06-24 14:19:22', 0, NULL, '2022-06-24 14:19:22', 19, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540218002237165568, NULL, '2022-06-24 14:19:22', 0, NULL, '2022-06-24 14:19:22', 26, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/sex', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540218002245554176, NULL, '2022-06-24 14:19:22', 0, NULL, '2022-06-24 14:19:22', 27, '127.0.0.1', '本地测试', '查询用户', '{"pageNumber":"1","departmentId":"","nickname":"","pageSize":"20","sort":"createTime","order":"desc"}', 'GET', '/zwz/user/getUserList', 'admin', 2, 'USER-07', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540218003352850432, NULL, '2022-06-24 14:19:23', 0, NULL, '2022-06-24 14:19:23', 23, '127.0.0.1', '本地测试', '查询子部门', '{}', 'GET', '/zwz/department/getByParentId', 'admin', 2, 'DEP-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540218007043837953, NULL, '2022-06-24 14:19:23', 0, NULL, '2022-06-24 14:19:23', 31, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540218013733752832, NULL, '2022-06-24 14:19:25', 0, NULL, '2022-06-24 14:19:25', 23, '127.0.0.1', '本地测试', '查询单个数据字典的值', '{}', 'GET', '/zwz/dictData/getByType/sex', 'admin', 2, 'DICT_DATA-01', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540218070629486592, NULL, '2022-06-24 14:19:39', 0, NULL, '2022-06-24 14:19:39', 55, '127.0.0.1', '本地测试', '修改个人门户菜单', '{"str":"rosterZWZ666rechargeZWZ666insuranceZWZ666operationZWZ666seeDoctorZWZ666examine"}', 'POST', '/zwz/myDoor/setMyDoorList', 'admin', 2, 'MY-DOOR-03', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540218078820962304, NULL, '2022-06-24 14:19:41', 0, NULL, '2022-06-24 14:19:41', 67, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540218083766046720, NULL, '2022-06-24 14:19:42', 0, NULL, '2022-06-24 14:19:42', 24, '127.0.0.1', '本地测试', '查询菜单', '{}', 'GET', '/zwz/permission/getMenuList', 'admin', 2, 'PERMISSION-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016'),
	(1540218084130951168, NULL, '2022-06-24 14:19:42', 0, NULL, '2022-06-24 14:19:42', 25, '127.0.0.1', '本地测试', '查询个人门户菜单B', '{}', 'POST', '/zwz/myDoor/getMyDoorList6', 'admin', 2, 'MY-DOOR-02', 'PC端 | Chrome 101.0.0.0 | Windows Windows 10 or Windows Server 2016');

-- 导出  表 insurance.a_medical_assets 结构
DROP TABLE IF EXISTS `a_medical_assets`;
CREATE TABLE IF NOT EXISTS `a_medical_assets` (
  `id` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `create_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int NOT NULL,
  `update_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `asset_name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `existing_number` decimal(19,2) DEFAULT NULL,
  `model` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `nature` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `number` decimal(19,2) DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `total_price` decimal(19,2) DEFAULT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

-- 正在导出表  insurance.a_medical_assets 的数据：~0 rows (大约)
DELETE FROM `a_medical_assets`;
INSERT INTO `a_medical_assets` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `asset_name`, `existing_number`, `model`, `nature`, `number`, `remarks`, `total_price`, `unit_price`) VALUES
	('1540210814823305216', 'admin', '2022-06-24 13:50:48.652000', 0, 'admin', '2022-06-24 13:52:46.126000', '血压检测仪', 10.00, 'L', '固定资产', 10.00, '测量血压所用', 23600.00, 2360.00),
	('1540210928539275264', 'admin', '2022-06-24 13:51:15.758000', 0, 'admin', '2022-06-24 13:54:08.298000', '超声波洗牙器', 19.00, 'M', '固定资产', 20.00, '口腔科', 318000.00, 15900.00),
	('1540211048559284224', 'admin', '2022-06-24 13:51:44.372000', 0, NULL, NULL, '压舌板', 0.00, 'N', '耗材', 0.00, '诊断所用', 0.00, 0.80),
	('1540211121250766848', 'admin', '2022-06-24 13:52:01.704000', 0, NULL, NULL, '口罩', 0.00, 'N95', '耗材', 0.00, '防疫用品', 0.00, 2.10),
	('1540211202548961280', 'admin', '2022-06-24 13:52:21.087000', 0, NULL, NULL, '医用手套', 0.00, 'L', '耗材', 0.00, '医用', 0.00, 1.80);

-- 导出  表 insurance.a_operation 结构
DROP TABLE IF EXISTS `a_operation`;
CREATE TABLE IF NOT EXISTS `a_operation` (
  `id` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `create_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int NOT NULL,
  `update_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `efficacy` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

-- 正在导出表  insurance.a_operation 的数据：~0 rows (大约)
DELETE FROM `a_operation`;
INSERT INTO `a_operation` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `efficacy`, `price`, `title`, `type`) VALUES
	('1540202123415916544', 'admin', '2022-06-24 13:16:16.000000', 0, 'admin', '2022-06-24 13:17:05.609000', '对人体的关键骨节进行复位穿刺', 6750.00, '关节穿刺术', '一级手术'),
	('1540202123415916545', 'admin', '2022-06-24 13:16:16.000000', 0, 'admin', '2022-06-24 13:17:05.609000', '治疗胸腔的胸腔穿刺术', 5600.00, '胸腔穿刺术', '二级手术'),
	('1540202123415916546', 'admin', '2022-06-24 13:16:16.000000', 0, 'admin', '2022-06-24 13:17:05.609000', '治疗腰间盘突出', 4800.00, '腰椎穿刺', '三级手术'),
	('1540202123415916547', 'admin', '2022-06-24 13:16:16.000000', 0, 'admin', '2022-06-24 13:17:05.609000', '治疗皮肤异常的经皮腹腔穿刺术', 3600.00, '经皮腹腔穿刺术', '一级手术'),
	('1540202123415916548', 'admin', '2022-06-24 13:16:16.000000', 0, 'admin', '2022-06-24 13:17:05.609000', '用于治疗严重的硬膜外阻滞术', 4100.00, '连续硬膜外阻滞术', '二级手术'),
	('1540202123415916549', 'admin', '2022-06-24 13:16:16.000000', 0, 'admin', '2022-06-24 13:17:05.609000', '治疗人体的椎管内异常', 8888.00, '椎管内注射封闭', '三级手术'),
	('1540202123415916550', 'admin', '2022-06-24 13:16:16.000000', 0, 'admin', '2022-06-24 13:17:05.609000', '治疗人体静脉异常', 7710.00, '静脉穿刺术', '一级手术'),
	('1540202123415916551', 'admin', '2022-06-24 13:16:16.000000', 0, 'admin', '2022-06-24 13:17:05.609000', '治疗人体出血过多的问题', 6780.00, '伤口止血术', '二级手术'),
	('1540202123415916552', 'admin', '2022-06-24 13:16:16.000000', 0, 'admin', '2022-06-24 13:17:05.609000', '治疗人体阑尾的手术', 2500.00, '阑尾切除术', '三级手术'),
	('1540202123415916553', 'admin', '2022-06-24 13:16:16.000000', 0, 'admin', '2022-06-24 13:17:05.609000', '治疗人体腹部的异常手术', 4670.00, '腹股沟疝修补术', '一级手术'),
	('1540202123415916554', 'admin', '2022-06-24 13:16:16.000000', 0, 'admin', '2022-06-24 13:17:05.609000', '治疗人体鞘膜异常的手术', 6310.00, '鞘膜翻转术', '二级手术'),
	('1540202123415916555', 'admin', '2022-06-24 13:16:16.000000', 0, 'admin', '2022-06-24 13:17:05.609000', '对人体的直肠指进行检查', 1800.00, '直肠指检', '三级手术'),
	('1540202123415916556', 'admin', '2022-06-24 13:16:16.000000', 0, 'admin', '2022-06-24 13:17:05.609000', '对人体骨折闭合进行复位', 3900.00, '骨折闭合复位术', '一级手术'),
	('1540202123415916557', 'admin', '2022-06-24 13:16:16.000000', 0, 'admin', '2022-06-24 13:17:05.609000', '对人体的关键组织进行穿刺', 5800.00, '组织穿刺术', '二级手术');

-- 导出  表 insurance.a_outbound_order 结构
DROP TABLE IF EXISTS `a_outbound_order`;
CREATE TABLE IF NOT EXISTS `a_outbound_order` (
  `id` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `create_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int NOT NULL,
  `update_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `asset_id` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `asset_name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `exist_number` decimal(19,2) DEFAULT NULL,
  `model` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `nature` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `number` decimal(19,2) DEFAULT NULL,
  `recipients` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `recipients_id` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

-- 正在导出表  insurance.a_outbound_order 的数据：~0 rows (大约)
DELETE FROM `a_outbound_order`;
INSERT INTO `a_outbound_order` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `asset_id`, `asset_name`, `exist_number`, `model`, `nature`, `number`, `recipients`, `recipients_id`, `remarks`, `unit_price`) VALUES
	('1540211652211904512', 'admin', '2022-06-24 13:54:08.304000', 0, NULL, NULL, '1540210928539275264', '超声波洗牙器', NULL, 'M', '固定资产', 1.00, '管理员', '682265633886208', '口腔科领取', 15900.00);

-- 导出  表 insurance.a_permission 结构
DROP TABLE IF EXISTS `a_permission`;
CREATE TABLE IF NOT EXISTS `a_permission` (
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
  `show_always` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  insurance.a_permission 的数据：~35 rows (大约)
DELETE FROM `a_permission`;
INSERT INTO `a_permission` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `description`, `name`, `parent_id`, `type`, `sort_order`, `component`, `path`, `title`, `icon`, `level`, `button_type`, `status`, `show_always`) VALUES
	(5129710648430592, '', '2022-03-20 09:46:20', 0, 'admin', '2022-05-29 13:05:28', '', 'roleMenu', 125909152017944576, 0, 4.00, 'Main', '/roleMenu', '权限管理', 'md-desktop', 1, '', 0, b'1'),
	(5129710648430593, '', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 'user-admin', 1464484663442673664, 0, 1.10, 'roster/user/user', 'user', '用户管理', 'md-person', 2, '', 0, b'1'),
	(5129710648430594, '', '2022-03-20 09:46:20', 0, 'admin', '2022-06-14 11:23:18', '', 'role-manage', 5129710648430592, 0, 1.00, 'role/role/index', 'role', '角色支持', 'md-contacts', 2, '', 0, b'1'),
	(5129710648430595, '', '2022-03-20 09:46:20', 0, 'admin', '2022-06-14 11:23:13', '', 'menu-manage', 5129710648430592, 0, 2.00, 'menu/menu/index', 'menu', '菜单支持', 'md-menu', 2, '', 0, b'1'),
	(39915540965232640, '', '2022-03-20 09:46:20', 0, 'admin', '2022-06-10 15:45:37', '', 'monitor', 125909152017944576, 0, 6.00, 'Main', '/monitor', '日志管理', 'ios-analytics', 1, '', 0, b'1'),
	(40238597734928384, '', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 'department-admin', 1464485105081913345, 0, 1.20, 'roster/department/department', 'department-admin', '部门管理', 'md-git-branch', 2, '', 0, b'1'),
	(41363147411427328, '', '2022-03-20 09:46:20', 0, 'admin', '2022-05-21 14:15:44', '', 'log-manage', 39915540965232640, 0, 2.20, 'log/log/index', 'log', '日志管理', 'md-list-box', 2, '', 0, b'1'),
	(56309618086776832, '', '2022-03-20 09:46:20', 0, 'admin', '2022-05-29 07:18:02', '', 'file-admin', 1464485485316542465, 0, 1.00, 'file/file/index', 'file', '云盘', 'ios-folder', 2, '', 0, b'1'),
	(125909152017944576, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 'zwz', 0, -1, 1.00, '', '', '数据中心', 'md-home', 0, '', 0, b'1'),
	(1464484663442673664, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '', 'userTwoMenu', 125909152017944576, 0, 1.00, 'Main', '/userTwoMenu', '用户管理', 'md-analytics', 1, '', 0, b'1'),
	(1464485105081913345, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', NULL, 'depTwoMenu', 125909152017944576, 0, 2.00, 'Main', '/depTwoMenu', '部门管理', 'ios-apps', 1, '', 0, b'1'),
	(1464485485316542465, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-05-21 14:13:42', '', 'fileAdmin', 125909152017944576, 0, 3.00, 'Main', '/fileAdmin', '文件管理', 'md-basketball', 1, '', 0, b'1'),
	(1530689520276738048, 'admin', '2022-05-29 07:16:35', 0, NULL, NULL, NULL, 'dictMenu', 125909152017944576, 0, 5.00, 'Main', '/dictMenu', '数据字典', 'ios-apps', 1, '', 0, b'1'),
	(1530689602321518592, 'admin', '2022-05-29 07:16:55', 0, NULL, NULL, NULL, 'dict', 1530689520276738048, 0, 1.00, 'dict/dict/index', 'dict', '数据字典', 'ios-apps', 2, '', 0, b'1'),
	(1535166254703316992, 'admin', '2022-06-10 15:45:32', 0, NULL, NULL, NULL, 'codeCreate', 125909152017944576, 0, 7.00, 'Main', '/codeCreate', '代码生成', 'ios-brush', 1, '', 0, b'1'),
	(1535166438371889152, 'admin', '2022-06-10 15:46:16', 0, NULL, NULL, NULL, 'vue', 1535166254703316992, 0, 1.00, 'code/vue/index', 'vue', '前端表格', 'md-bug', 2, '', 0, b'1'),
	(1540174678230962176, 'admin', '2022-06-24 11:27:13', 0, NULL, NULL, NULL, 'topMenu2', NULL, -1, 1.00, NULL, NULL, '大病人员模块', 'ios-apps', 0, NULL, 0, NULL),
	(1540174735994916864, 'admin', '2022-06-24 11:27:27', 0, NULL, NULL, NULL, 'topMenu3', NULL, -1, 3.00, NULL, NULL, '大病保险模块', 'ios-apps', 0, NULL, 0, NULL),
	(1540174781276622848, 'admin', '2022-06-24 11:27:38', 0, NULL, NULL, NULL, 'topMenu4', NULL, -1, 4.00, NULL, NULL, '大病登记模块', 'ios-apps', 0, NULL, 0, NULL),
	(1540174828353490944, 'admin', '2022-06-24 11:27:49', 0, NULL, NULL, NULL, 'topMenu5', NULL, -1, 5.00, NULL, NULL, '保险审核模块', 'ios-apps', 0, NULL, 0, NULL),
	(1540175110533681152, 'admin', '2022-06-24 11:28:56', 0, NULL, NULL, NULL, 'rosterMenu', 1540174678230962176, 0, 1.00, 'Main', '/rosterMenu', '参保人员档案', 'md-contacts', 1, '', 0, NULL),
	(1540175220046958592, 'admin', '2022-06-24 11:29:22', 0, NULL, NULL, NULL, 'roster', 1540175110533681152, 0, 1.00, 'roster/roster/index', 'roster', '参保人员档案', 'ios-disc', 2, '', 0, NULL),
	(1540175326473228288, 'admin', '2022-06-24 11:29:48', 0, NULL, NULL, NULL, 'rechangeMenu', 1540174678230962176, 0, 2.00, 'Main', '/rechangeMenu', '医保充值', 'md-cube', 1, '', 0, NULL),
	(1540175469318639616, 'admin', '2022-06-24 11:30:22', 0, NULL, NULL, NULL, 'recharge', 1540175326473228288, 0, 2.00, 'roster/recharge/index', 'recharge', '医保充值', 'md-football', 2, '', 0, NULL),
	(1540175589804216320, 'admin', '2022-06-24 11:30:50', 0, NULL, NULL, NULL, 'insuranceMenu', 1540174735994916864, 0, 1.00, 'Main', '/insuranceMenu', '医疗保险档案', 'ios-folder', 1, '', 0, NULL),
	(1540175693793595392, 'admin', '2022-06-24 11:31:15', 0, NULL, NULL, NULL, 'insurance', 1540175589804216320, 0, 1.00, 'insurance/insurance/index', 'insurance', '医疗保险', 'ios-images', 2, '', 0, NULL),
	(1540175797447430144, 'admin', '2022-06-24 11:31:40', 0, NULL, NULL, NULL, 'operation', 1540175589804216320, 0, 2.00, 'insurance/operation/index', 'operation', '手术档案', 'ios-medal', 2, '', 0, NULL),
	(1540175953890775040, 'admin', '2022-06-24 11:32:17', 0, NULL, NULL, NULL, 'medicalAssetsMenu', 1540174735994916864, 0, 2.00, 'Main', '/medicalAssetsMenu', '医疗资产', 'md-move', 1, '', 0, NULL),
	(1540176111701463040, 'admin', '2022-06-24 11:32:55', 0, NULL, NULL, NULL, 'medicalAssets', 1540175953890775040, 0, 1.00, 'medicalAssets/medicalAssets/index', 'medicalAssets', '医疗资产品类', 'md-options', 2, '', 0, NULL),
	(1540176238210060288, 'admin', '2022-06-24 11:33:25', 0, 'admin', '2022-06-24 11:41:19', '', 'MedicalAssetsWarehousingOrder', 1540175953890775040, 0, 2.00, 'medicalAssets/medicalAssetsWarehousingOrder/index', 'MedicalAssetsWarehousingOrder', '医疗资产入库', 'md-pause', 2, '', 0, NULL),
	(1540176306698850304, 'admin', '2022-06-24 11:33:41', 0, 'admin', '2022-06-24 11:41:14', '', 'MedicalAssetsOutboundOrder', 1540175953890775040, 0, 3.00, 'medicalAssets/medicalAssetsOutboundOrder/index', 'MedicalAssetsOutboundOrder', '医疗资产出库', 'md-phone-landscape', 2, '', 0, NULL),
	(1540176637650407424, 'admin', '2022-06-24 11:35:00', 0, NULL, NULL, NULL, 'seeDoctorMenu', 1540174781276622848, 0, 1.00, 'Main', '/seeDoctorMenu', '看病', 'md-people', 1, '', 0, NULL),
	(1540176750137446400, 'admin', '2022-06-24 11:35:27', 0, NULL, NULL, NULL, 'seeDoctor', 1540176637650407424, 0, 1.00, 'seeDoctor/seeDoctor/index', 'seeDoctor', '看病登记', 'md-paper', 2, '', 0, NULL),
	(1540176865736658944, 'admin', '2022-06-24 11:35:55', 0, NULL, NULL, NULL, 'examineMenu', 1540174828353490944, 0, 1.00, 'Main', '/examineMenu', '保险审核', 'md-planet', 1, '', 0, NULL),
	(1540176977724575744, 'admin', '2022-06-24 11:36:21', 0, NULL, NULL, NULL, 'examine', 1540176865736658944, 0, 1.00, 'examine/examine/index', 'examine', '保险审核', 'md-power', 2, '', 0, NULL),
	(1540217595502923776, 'admin', '2022-06-24 14:17:45', 0, NULL, NULL, NULL, 'oldHome', 1464485485316542465, 0, 2.00, 'oldHome/home', 'oldHome', '原首页', 'ios-basket', 2, '', 0, NULL);

-- 导出  表 insurance.a_role 结构
DROP TABLE IF EXISTS `a_role`;
CREATE TABLE IF NOT EXISTS `a_role` (
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

-- 正在导出表  insurance.a_role 的数据：~2 rows (大约)
DELETE FROM `a_role`;
INSERT INTO `a_role` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `del_flag`, `default_role`, `description`, `data_type`) VALUES
	(496138616573952, '', '2022-03-20 09:46:20', 'admin', '2022-03-20 09:46:20', 'ROLE_ADMIN', 0, NULL, '超级管理员', 0),
	(496138616573953, '', '2022-03-20 09:46:20', 'admin', '2022-03-20 09:46:20', 'ROLE_USER', 0, b'1', '普通用户', 0);

-- 导出  表 insurance.a_role_permission 结构
DROP TABLE IF EXISTS `a_role_permission`;
CREATE TABLE IF NOT EXISTS `a_role_permission` (
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

-- 正在导出表  insurance.a_role_permission 的数据：~35 rows (大约)
DELETE FROM `a_role_permission`;
INSERT INTO `a_role_permission` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `permission_id`, `role_id`) VALUES
	(1464514325862551552, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 125909152017944576, 496138616573952),
	(1464514325862551553, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464484663442673664, 496138616573952),
	(1464514325862551554, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 5129710648430593, 496138616573952),
	(1464514325862551563, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464485105081913345, 496138616573952),
	(1464514325862551564, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 40238597734928384, 496138616573952),
	(1464514325862551568, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 1464485485316542465, 496138616573952),
	(1464514325862551569, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 56309618086776832, 496138616573952),
	(1464514325862551583, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 5129710648430592, 496138616573952),
	(1464514325862551584, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 5129710648430594, 496138616573952),
	(1464514325862551590, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 5129710648430595, 496138616573952),
	(1464514325862551594, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 39915540965232640, 496138616573952),
	(1464514325862551595, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 41363147411427328, 496138616573952),
	(1530689746903371801, 'admin', '2022-05-29 07:17:29', 0, NULL, NULL, 1530689520276738048, 496138616573952),
	(1530689747004035072, 'admin', '2022-05-29 07:17:29', 0, NULL, NULL, 1530689602321518592, 496138616573952),
	(1535166468671541252, 'admin', '2022-06-10 15:46:23', 0, NULL, NULL, 1535166254703316992, 496138616573952),
	(1535166468684124160, 'admin', '2022-06-10 15:46:23', 0, NULL, NULL, 1535166438371889152, 496138616573952),
	(1540177076978585608, 'admin', '2022-06-24 11:36:45', 0, NULL, NULL, 1540174678230962176, 496138616573952),
	(1540177076995362816, 'admin', '2022-06-24 11:36:45', 0, NULL, NULL, 1540175110533681152, 496138616573952),
	(1540177076999557120, 'admin', '2022-06-24 11:36:45', 0, NULL, NULL, 1540175220046958592, 496138616573952),
	(1540177077003751424, 'admin', '2022-06-24 11:36:45', 0, NULL, NULL, 1540175326473228288, 496138616573952),
	(1540177077007945728, 'admin', '2022-06-24 11:36:45', 0, NULL, NULL, 1540175469318639616, 496138616573952),
	(1540177077016334336, 'admin', '2022-06-24 11:36:45', 0, NULL, NULL, 1540174735994916864, 496138616573952),
	(1540177077016334337, 'admin', '2022-06-24 11:36:45', 0, NULL, NULL, 1540175589804216320, 496138616573952),
	(1540177077020528640, 'admin', '2022-06-24 11:36:45', 0, NULL, NULL, 1540175693793595392, 496138616573952),
	(1540177077024722944, 'admin', '2022-06-24 11:36:45', 0, NULL, NULL, 1540175797447430144, 496138616573952),
	(1540177077028917248, 'admin', '2022-06-24 11:36:45', 0, NULL, NULL, 1540175953890775040, 496138616573952),
	(1540177077033111552, 'admin', '2022-06-24 11:36:45', 0, NULL, NULL, 1540176111701463040, 496138616573952),
	(1540177077037305856, 'admin', '2022-06-24 11:36:45', 0, NULL, NULL, 1540176238210060288, 496138616573952),
	(1540177077041500160, 'admin', '2022-06-24 11:36:45', 0, NULL, NULL, 1540176306698850304, 496138616573952),
	(1540177077049888768, 'admin', '2022-06-24 11:36:45', 0, NULL, NULL, 1540174781276622848, 496138616573952),
	(1540177077054083072, 'admin', '2022-06-24 11:36:45', 0, NULL, NULL, 1540176637650407424, 496138616573952),
	(1540177077058277376, 'admin', '2022-06-24 11:36:45', 0, NULL, NULL, 1540176750137446400, 496138616573952),
	(1540177077062471680, 'admin', '2022-06-24 11:36:45', 0, NULL, NULL, 1540174828353490944, 496138616573952),
	(1540177077066665984, 'admin', '2022-06-24 11:36:45', 0, NULL, NULL, 1540176865736658944, 496138616573952),
	(1540177077070860288, 'admin', '2022-06-24 11:36:45', 0, NULL, NULL, 1540176977724575744, 496138616573952),
	(1540217643125051401, 'admin', '2022-06-24 14:17:57', 0, NULL, NULL, 1540217595502923776, 496138616573952);

-- 导出  表 insurance.a_roster 结构
DROP TABLE IF EXISTS `a_roster`;
CREATE TABLE IF NOT EXISTS `a_roster` (
  `id` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `create_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int NOT NULL,
  `update_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `card_status` int DEFAULT NULL,
  `id_card` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `insurance_name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `insurance_type` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `money` decimal(19,2) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `sex` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `card_number` varchar(50) COLLATE utf8_croatian_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `birthplace` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

-- 正在导出表  insurance.a_roster 的数据：~1 rows (大约)
DELETE FROM `a_roster`;
INSERT INTO `a_roster` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `age`, `card_status`, `id_card`, `insurance_name`, `insurance_type`, `money`, `name`, `sex`, `status`, `address`, `card_number`, `mobile`, `birthplace`) VALUES
	('1540199119237287936', 'admin', '2022-06-24 13:04:20.000000', 0, 'admin', '2022-06-24 13:54:33.041000', 18, 0, '33060019991201000X', '高等医疗保险', '1540199988687147008', 79130.00, '薛之谦', '男', 0, '浙江省绍兴市XXXXX', 'C0001', '17857050001', '浙江省绍兴市'),
	('1540199119237287937', 'admin', '2022-06-24 13:04:20.000000', 0, 'admin', '2022-06-24 13:38:42.279000', 18, 0, '33060019991201000X', '高等医疗保险', '1540199988687147008', 80000.00, '王一博', '男', 0, '浙江省绍兴市XXXXX', 'C0002', '17857050002', '浙江省绍兴市'),
	('1540199119237287938', 'admin', '2022-06-24 13:04:20.000000', 0, 'admin', '2022-06-24 13:45:57.074000', 18, 0, '33060019991201000X', '高等医疗保险', '1540199988687147008', 80000.00, '肖战', '男', 0, '浙江省绍兴市XXXXX', 'C0003', '17857050003', '浙江省绍兴市'),
	('1540199119237287939', 'admin', '2022-06-24 13:04:20.000000', 0, 'admin', '2022-06-24 13:42:22.874000', 18, 0, '33060019991201000X', '中等医疗保险', '1540199885104615424', 80000.00, '陈奕迅', '男', 0, '浙江省绍兴市XXXXX', 'C0004', '17857050004', '浙江省绍兴市'),
	('1540199119237287940', 'admin', '2022-06-24 13:04:20.000000', 0, 'admin', '2022-06-24 13:38:42.279000', 18, 0, '33060019991201000X', '高等医疗保险', '1540199988687147008', 80000.00, '周杰伦', '男', 0, '浙江省绍兴市XXXXX', 'C0005', '17857050005', '浙江省绍兴市'),
	('1540199119237287941', 'admin', '2022-06-24 13:04:20.000000', 0, 'admin', '2022-06-24 13:38:42.279000', 18, 0, '33060019991201000X', '低档医疗保险', '1540199783464046592', 80000.00, '那英', '男', 0, '浙江省绍兴市XXXXX', 'C0006', '17857050006', '浙江省绍兴市'),
	('1540199119237287942', 'admin', '2022-06-24 13:04:20.000000', 0, 'admin', '2022-06-24 13:38:42.279000', 18, 0, '33060019991201000X', '中等医疗保险', '1540199885104615424', 80000.00, '谢娜', '男', 0, '浙江省绍兴市XXXXX', 'C0007', '17857050007', '浙江省绍兴市'),
	('1540199119237287943', 'admin', '2022-06-24 13:04:20.000000', 0, 'admin', '2022-06-24 13:38:42.279000', 18, 0, '33060019991201000X', '高等医疗保险', '1540199988687147008', 80000.00, '李维嘉', '男', 0, '浙江省绍兴市XXXXX', 'C0008', '17857050008', '浙江省绍兴市'),
	('1540199119237287944', 'admin', '2022-06-24 13:04:20.000000', 0, 'admin', '2022-06-24 13:38:42.279000', 18, 0, '33060019991201000X', '高等医疗保险', '1540199988687147008', 80000.00, '杜海涛', '男', 0, '浙江省绍兴市XXXXX', 'C0009', '17857050009', '浙江省绍兴市'),
	('1540199119237287945', 'admin', '2022-06-24 13:04:20.000000', 0, 'admin', '2022-06-24 13:38:42.279000', 18, 0, '33060019991201000X', '高等医疗保险', '1540199988687147008', 80000.00, '吴昕', '男', 0, '浙江省绍兴市XXXXX', 'C0010', '17857050010', '浙江省绍兴市'),
	('1540199119237287946', 'admin', '2022-06-24 13:04:20.000000', 0, 'admin', '2022-06-24 13:42:51.249000', 18, 0, '33060019991201000X', '低档医疗保险', '1540199783464046592', 80000.00, '鞠婧祎', '男', 0, '浙江省绍兴市XXXXX', 'C0011', '17857050011', '浙江省绍兴市'),
	('1540199119237287947', 'admin', '2022-06-24 13:04:20.000000', 0, 'admin', '2022-06-24 13:38:42.279000', 18, 0, '33060019991201000X', '高等医疗保险', '1540199988687147008', 80000.00, '吴宣仪', '男', 0, '浙江省绍兴市XXXXX', 'C0012', '17857050012', '浙江省绍兴市'),
	('1540199119237287948', 'admin', '2022-06-24 13:04:20.000000', 0, 'admin', '2022-06-24 13:38:42.279000', 18, 0, '33060019991201000X', '高等医疗保险', '1540199988687147008', 80000.00, '撒贝宁', '男', 0, '浙江省绍兴市XXXXX', 'C0013', '17857050013', '浙江省绍兴市'),
	('1540199119237287949', 'admin', '2022-06-24 13:04:20.000000', 0, 'admin', '2022-06-24 13:38:42.279000', 18, 0, '33060019991201000X', '中等医疗保险', '1540199885104615424', 80000.00, '康辉', '男', 0, '浙江省绍兴市XXXXX', 'C0014', '17857050014', '浙江省绍兴市'),
	('1540199119237287950', 'admin', '2022-06-24 13:04:20.000000', 0, 'admin', '2022-06-24 13:38:42.279000', 18, 0, '33060019991201000X', '高等医疗保险', '1540199988687147008', 80000.00, '杨超越', '男', 0, '浙江省绍兴市XXXXX', 'C0015', '17857050015', '浙江省绍兴市'),
	('1540199119237287951', 'admin', '2022-06-24 13:04:20.000000', 0, 'admin', '2022-06-24 13:38:42.279000', 18, 0, '33060019991201000X', '高等医疗保险', '1540199988687147008', 80000.00, '秦霄贤', '男', 0, '浙江省绍兴市XXXXX', 'C0016', '17857050016', '浙江省绍兴市');

-- 导出  表 insurance.a_see_doctor 结构
DROP TABLE IF EXISTS `a_see_doctor`;
CREATE TABLE IF NOT EXISTS `a_see_doctor` (
  `id` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `create_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int NOT NULL,
  `update_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `balance` decimal(19,2) DEFAULT NULL,
  `balance_new` decimal(19,2) DEFAULT NULL,
  `date` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `medicine_name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `medicine_old` decimal(19,2) DEFAULT NULL,
  `medicine_price` decimal(19,2) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `price_discount` decimal(19,2) DEFAULT NULL,
  `price_old` decimal(19,2) DEFAULT NULL,
  `price_sum` decimal(19,2) DEFAULT NULL,
  `price_you` decimal(19,2) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

-- 正在导出表  insurance.a_see_doctor 的数据：~0 rows (大约)
DELETE FROM `a_see_doctor`;
INSERT INTO `a_see_doctor` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `balance`, `balance_new`, `date`, `medicine_name`, `medicine_old`, `medicine_price`, `name`, `price`, `price_discount`, `price_old`, `price_sum`, `price_you`, `type`, `user_id`, `user_name`) VALUES
	('1540211755991568384', 'admin', '2022-06-24 13:54:33.109000', 0, NULL, NULL, 80000.00, 79130.00, '2022-06-24 13:54:33', '(连续硬膜外阻滞术)=1次*4100', 4100.00, 820.00, '高等医疗保险', 50.00, 3280.00, 500.00, 870.00, 450.00, 'A类大病门诊', '1540199119237287936', '薛之谦');

-- 导出  表 insurance.a_setting 结构
DROP TABLE IF EXISTS `a_setting`;
CREATE TABLE IF NOT EXISTS `a_setting` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  insurance.a_setting 的数据：~5 rows (大约)
DELETE FROM `a_setting`;
INSERT INTO `a_setting` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `value`) VALUES
	('FILE_HTTP', NULL, NULL, 0, 'admin', '2022-05-28 15:57:20', 'http://'),
	('FILE_PATH', NULL, NULL, 0, 'admin', '2022-05-28 15:57:19', 'C:\\\\oa-file'),
	('FILE_VIEW', NULL, NULL, 0, 'admin', '2022-05-28 15:57:20', '127.0.0.1:8080/zwz/file/view'),
	('LOCAL_OSS', 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', '{"serviceName":"LOCAL_OSS","endpoint":"127.0.0.1:8080/zwz/file/view","http":"http://","filePath":"C:\\\\oa-file"}'),
	('OSS_USED', 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 'LOCAL_OSS');

-- 导出  表 insurance.a_user 结构
DROP TABLE IF EXISTS `a_user`;
CREATE TABLE IF NOT EXISTS `a_user` (
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
  `my_door` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 正在导出表  insurance.a_user 的数据：~4 rows (大约)
DELETE FROM `a_user`;
INSERT INTO `a_user` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `address`, `avatar`, `description`, `email`, `mobile`, `nickname`, `password`, `sex`, `status`, `type`, `username`, `del_flag`, `department_id`, `street`, `pass_strength`, `department_title`, `birth`, `my_door`) VALUES
	(682265633886208, '', '2022-03-20 09:46:20', 'admin', '2022-06-24 14:19:39', '["330000","330600","330602"]', 'https://wx.qlogo.cn/mmhead/PiajxSqBRaEKjc639z2lRF4DqweNw2aDRLbAL7yLlSgrdZeKBCwLHDQ/0', '北大', '916077357@qq.com', '17857054388', '管理员', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '男', 0, 1, 'admin', 0, 1464487379074158593, '东西街道2', '弱', '设计研发部', '2000-01-08 00:00:00.000000', 'rosterZWZ666rechargeZWZ666insuranceZWZ666operationZWZ666seeDoctorZWZ666examine'),
	(1464764315201572865, '', '2022-03-20 09:46:20', 'admin', '2022-05-21 09:11:48', '', 'https://wx.qlogo.cn/mmhead/PiajxSqBRaEKjc639z2lRF4DqweNw2aDRLbAL7yLlSgrdZeKBCwLHDQ/0', '', '17859654125@qq.com', '17859654125', '测试', '$2a$10$E59nactOiILAzQvfcs0JFOYuZp06d4bLhugEadyQuygpmiLc0W.ha', '', -1, 0, '17859654125', 0, 1464487332064399361, '', '', '行政综合部', NULL, NULL),
	(1464772465946398721, '', '2022-03-20 09:46:20', 'admin', '2022-05-21 09:53:33', '["110000","110100","110105"]', 'https://wx.qlogo.cn/mmhead/PiajxSqBRaEKjc639z2lRF4DqweNw2aDRLbAL7yLlSgrdZeKBCwLHDQ/0', '', '17859654121@qq.com', '17859654121', '测试2', '$2a$10$vJyLo1RhFORH/SAu3sc9aeb37I5JRy5UugaN7fIt/e2vvsz6JWJCm', '', 0, 0, '17859654121', 0, 1464487432169852929, '', '', '综合发展部', NULL, ''),
	(1527830053524738048, 'admin', '2022-05-21 09:54:05', NULL, NULL, '["110000","110100","110106"]', 'https://wx.qlogo.cn/mmhead/PiajxSqBRaEKjc639z2lRF4DqweNw2aDRLbAL7yLlSgrdZeKBCwLHDQ/0', NULL, 'user4@qq.com', '17896525487', 'user4', '$2a$10$oeP4aplYnswfQ44pK6lAO.Np9BuPYJGRwo17THO7CUNlIQoVGsPmy', '男', 0, 0, 'user4', 0, 1464487332064399361, NULL, '弱', '行政综合部', NULL, NULL);

-- 导出  表 insurance.a_user_role 结构
DROP TABLE IF EXISTS `a_user_role`;
CREATE TABLE IF NOT EXISTS `a_user_role` (
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

-- 正在导出表  insurance.a_user_role 的数据：~6 rows (大约)
DELETE FROM `a_user_role`;
INSERT INTO `a_user_role` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `role_id`, `user_id`) VALUES
	(1464487931975700480, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 496138616573952, 682265633886208),
	(1486220872917323776, 'admin', '2022-03-20 09:46:20', 0, 'admin', '2022-03-20 09:46:20', 496138616573953, 1464764315201572865),
	(1526802492967489537, NULL, '2022-05-18 13:50:56', 0, NULL, NULL, 496138616573953, 1526802492443201536),
	(1526819095553642497, NULL, '2022-05-18 14:56:54', 0, NULL, NULL, 496138616573953, 1526819095159377920),
	(1527829917801254912, 'admin', '2022-05-21 09:53:33', 0, NULL, NULL, 496138616573953, 1464772465946398721),
	(1527830053889642496, 'admin', '2022-05-21 09:54:05', 0, NULL, NULL, 496138616573952, 1527830053524738048);

-- 导出  表 insurance.a_warehousing_order 结构
DROP TABLE IF EXISTS `a_warehousing_order`;
CREATE TABLE IF NOT EXISTS `a_warehousing_order` (
  `id` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `create_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `del_flag` int NOT NULL,
  `update_by` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `asset_id` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `asset_name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `invoice` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `nature` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `number` decimal(19,2) DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

-- 正在导出表  insurance.a_warehousing_order 的数据：~0 rows (大约)
DELETE FROM `a_warehousing_order`;
INSERT INTO `a_warehousing_order` (`id`, `create_by`, `create_time`, `del_flag`, `update_by`, `update_time`, `asset_id`, `asset_name`, `invoice`, `model`, `nature`, `number`, `remarks`, `unit_price`) VALUES
	('1540211266637926400', 'admin', '2022-06-24 13:52:36.377000', 0, NULL, NULL, '1540210928539275264', '超声波洗牙器', 'FP001', 'M', '固定资产', 20.00, '测试', 15900.00),
	('1540211307565944832', 'admin', '2022-06-24 13:52:46.129000', 0, NULL, NULL, '1540210814823305216', '血压检测仪', 'FP002', 'L', '固定资产', 10.00, '测试', 2360.00);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
