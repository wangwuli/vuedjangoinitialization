-- --------------------------------------------------------
-- 主机:                           172.16.10.243
-- 服务器版本:                        5.6.44-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 xlauto 的数据库结构
DROP DATABASE IF EXISTS `xlauto`;
CREATE DATABASE IF NOT EXISTS `xlauto` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `xlauto`;

-- 导出  表 xlauto.auth_group 结构
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  xlauto.auth_group 的数据：~0 rows (大约)
DELETE FROM `auth_group`;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- 导出  表 xlauto.auth_group_permissions 结构
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  xlauto.auth_group_permissions 的数据：~0 rows (大约)
DELETE FROM `auth_group_permissions`;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- 导出  表 xlauto.auth_permission 结构
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- 正在导出表  xlauto.auth_permission 的数据：~15 rows (大约)
DELETE FROM `auth_permission`;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add group', 1, 'add_group'),
	(2, 'Can change group', 1, 'change_group'),
	(3, 'Can delete group', 1, 'delete_group'),
	(4, 'Can add permission', 2, 'add_permission'),
	(5, 'Can change permission', 2, 'change_permission'),
	(6, 'Can delete permission', 2, 'delete_permission'),
	(7, 'Can add content type', 3, 'add_contenttype'),
	(8, 'Can change content type', 3, 'change_contenttype'),
	(9, 'Can delete content type', 3, 'delete_contenttype'),
	(10, 'Can add session', 4, 'add_session'),
	(11, 'Can change session', 4, 'change_session'),
	(12, 'Can delete session', 4, 'delete_session'),
	(13, 'Can add user', 5, 'add_userinfo'),
	(14, 'Can change user', 5, 'change_userinfo'),
	(15, 'Can delete user', 5, 'delete_userinfo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- 导出  表 xlauto.django_content_type 结构
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 正在导出表  xlauto.django_content_type 的数据：~4 rows (大约)
DELETE FROM `django_content_type`;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(3, 'contenttypes', 'contenttype'),
	(4, 'sessions', 'session'),
	(5, 'user_account', 'userinfo');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- 导出  表 xlauto.django_migrations 结构
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- 正在导出表  xlauto.django_migrations 的数据：~14 rows (大约)
DELETE FROM `django_migrations`;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2021-03-25 07:28:22'),
	(2, 'contenttypes', '0002_remove_content_type_name', '2021-03-25 07:28:23'),
	(3, 'auth', '0001_initial', '2021-03-25 07:28:24'),
	(4, 'auth', '0002_alter_permission_name_max_length', '2021-03-25 07:28:24'),
	(5, 'auth', '0003_alter_user_email_max_length', '2021-03-25 07:28:24'),
	(6, 'auth', '0004_alter_user_username_opts', '2021-03-25 07:28:24'),
	(7, 'auth', '0005_alter_user_last_login_null', '2021-03-25 07:28:24'),
	(8, 'auth', '0006_require_contenttypes_0002', '2021-03-25 07:28:24'),
	(9, 'auth', '0007_alter_validators_add_error_messages', '2021-03-25 07:28:24'),
	(10, 'auth', '0008_alter_user_username_max_length', '2021-03-25 07:28:24'),
	(11, 'sessions', '0001_initial', '2021-03-25 07:28:24'),
	(12, 'user_account', '0001_initial', '2021-03-25 07:41:06'),
	(13, 'user_account', '0002_auto_20210325_1538', '2021-03-25 07:41:06'),
	(14, 'user_account', '0003_auto_20210325_1550', '2021-03-25 07:51:05'),
	(15, 'user_account', '0004_remove_userinfo_user_pass', '2021-03-25 07:53:00');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- 导出  表 xlauto.django_session 结构
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  xlauto.django_session 的数据：~0 rows (大约)
DELETE FROM `django_session`;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- 导出  表 xlauto.elink_env 结构
DROP TABLE IF EXISTS `elink_env`;
CREATE TABLE IF NOT EXISTS `elink_env` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `env_name` varchar(50) DEFAULT NULL COMMENT '环境名',
  `env_type_code` varchar(50) DEFAULT NULL COMMENT 'sys_code.env_type',
  `env_code` varchar(50) DEFAULT NULL COMMENT '环境编码',
  `env_ops_manage` varchar(50) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `env_code` (`env_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  xlauto.elink_env 的数据：~1 rows (大约)
DELETE FROM `elink_env`;
/*!40000 ALTER TABLE `elink_env` DISABLE KEYS */;
INSERT INTO `elink_env` (`id`, `env_name`, `env_type_code`, `env_code`, `env_ops_manage`, `comment`) VALUES
	(1, '菲寓阿里云', 'production', 'FYALI', NULL, NULL);
/*!40000 ALTER TABLE `elink_env` ENABLE KEYS */;

-- 导出  表 xlauto.elink_project 结构
DROP TABLE IF EXISTS `elink_project`;
CREATE TABLE IF NOT EXISTS `elink_project` (
  `project_id` int(11) NOT NULL,
  `project_code` varchar(50) NOT NULL,
  `project_name` varchar(50) DEFAULT NULL,
  `project_management` varchar(50) DEFAULT NULL COMMENT '项目联络人',
  `project_management_call` varchar(50) DEFAULT NULL COMMENT '项目联络人联系方式',
  `comment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  xlauto.elink_project 的数据：~0 rows (大约)
DELETE FROM `elink_project`;
/*!40000 ALTER TABLE `elink_project` DISABLE KEYS */;
INSERT INTO `elink_project` (`project_id`, `project_code`, `project_name`, `project_management`, `project_management_call`, `comment`) VALUES
	(0, 'FY', '菲寓', NULL, NULL, NULL);
/*!40000 ALTER TABLE `elink_project` ENABLE KEYS */;

-- 导出  表 xlauto.hosts_management 结构
DROP TABLE IF EXISTS `hosts_management`;
CREATE TABLE IF NOT EXISTS `hosts_management` (
  `host_id` int(11) NOT NULL AUTO_INCREMENT,
  `host_ip` varchar(50) DEFAULT NULL,
  `host_connection_code` varchar(50) DEFAULT NULL COMMENT 'sys_code.host_connection_type',
  `host_connection_port` int(11) DEFAULT NULL,
  `host_users_id` int(11) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`host_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  xlauto.hosts_management 的数据：~1 rows (大约)
DELETE FROM `hosts_management`;
/*!40000 ALTER TABLE `hosts_management` DISABLE KEYS */;
INSERT INTO `hosts_management` (`host_id`, `host_ip`, `host_connection_code`, `host_connection_port`, `host_users_id`, `comment`) VALUES
	(1, '192.168.1.1', 'ssh', 22, 0, NULL);
/*!40000 ALTER TABLE `hosts_management` ENABLE KEYS */;

-- 导出  表 xlauto.hosts_users 结构
DROP TABLE IF EXISTS `hosts_users`;
CREATE TABLE IF NOT EXISTS `hosts_users` (
  `host_users_id` int(11) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_password` varchar(50) DEFAULT NULL,
  `host_user_code` varchar(50) DEFAULT NULL COMMENT 'sys_code.host_user_type',
  `comment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`host_users_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  xlauto.hosts_users 的数据：~0 rows (大约)
DELETE FROM `hosts_users`;
/*!40000 ALTER TABLE `hosts_users` DISABLE KEYS */;
INSERT INTO `hosts_users` (`host_users_id`, `user_id`, `user_name`, `user_password`, `host_user_code`, `comment`) VALUES
	(0, '45d547bc-9cc6-11eb-b7f9-02420aff000a', 'root', '123456', 'admin', NULL);
/*!40000 ALTER TABLE `hosts_users` ENABLE KEYS */;

-- 导出  表 xlauto.package_management 结构
DROP TABLE IF EXISTS `package_management`;
CREATE TABLE IF NOT EXISTS `package_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(50) DEFAULT '0',
  `project_id` int(20) DEFAULT '0',
  `package_git_url` varchar(200) DEFAULT '0',
  `branch` varchar(200) DEFAULT NULL,
  `package_versions` varchar(200) DEFAULT '0',
  `package_repository_url` varchar(200) DEFAULT '0',
  `package_repository_code` varchar(50) DEFAULT '0',
  `package_nick` varchar(50) DEFAULT '0',
  `package_type_code` varchar(50) DEFAULT '0',
  `comment` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- 正在导出表  xlauto.package_management 的数据：~5 rows (大约)
DELETE FROM `package_management`;
/*!40000 ALTER TABLE `package_management` DISABLE KEYS */;
INSERT INTO `package_management` (`id`, `package_name`, `project_id`, `package_git_url`, `branch`, `package_versions`, `package_repository_url`, `package_repository_code`, `package_nick`, `package_type_code`, `comment`) VALUES
	(7, 'xx35', 35, 'xx3', 'xx3', 'xx3', 'xx3', 'xx3', NULL, 'ftp', 'xx3'),
	(8, 'xx4', 4, 'xx4', 'xx4', 'xx4', 'xx4', 'xx4', NULL, 'nexus', 'xx4'),
	(9, 'xx5', 5, 'xx5', 'xx5', 'xx5', 'xx5', 'xx5', NULL, 'war', 'xx5'),
	(10, 'xx6', 6, 'xx6', 'xx6', 'xx6', 'xx6', 'xx6', NULL, 'jar', 'xx6'),
	(13, 'xx7', 7, 'xx7', 'xx7', 'xx7', 'xx7', 'xx7', NULL, 'war', 'xx7');
/*!40000 ALTER TABLE `package_management` ENABLE KEYS */;

-- 导出  表 xlauto.sys_code 结构
DROP TABLE IF EXISTS `sys_code`;
CREATE TABLE IF NOT EXISTS `sys_code` (
  `sys_code_id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_code` varchar(50) DEFAULT NULL,
  `sys_code_name` varchar(50) DEFAULT NULL,
  `sys_code_type` varchar(50) DEFAULT NULL,
  `sys_code_father` varchar(50) DEFAULT NULL,
  `sys_code_sort` varchar(50) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sys_code_id`),
  UNIQUE KEY `sys_code` (`sys_code`,`sys_code_type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- 正在导出表  xlauto.sys_code 的数据：~11 rows (大约)
DELETE FROM `sys_code`;
/*!40000 ALTER TABLE `sys_code` DISABLE KEYS */;
INSERT INTO `sys_code` (`sys_code_id`, `sys_code`, `sys_code_name`, `sys_code_type`, `sys_code_father`, `sys_code_sort`, `comment`) VALUES
	(1, 'ftp', 'FTP', 'package_repository', NULL, NULL, NULL),
	(2, 'nexus', 'Nexus', 'package_repository', NULL, NULL, NULL),
	(3, 'jar', 'Jar', 'package_type', NULL, NULL, NULL),
	(4, 'war', 'War', 'package_type', NULL, NULL, NULL),
	(5, 'production', '生产', 'env_type', NULL, NULL, NULL),
	(6, 'develop', '开发', 'env_type', NULL, NULL, NULL),
	(7, 'ssh', 'SSH', 'host_connection_type', NULL, NULL, '主机连接类型'),
	(8, 'telnet', 'Telnet', 'host_connection_type', NULL, NULL, '主机连接类型'),
	(9, 'root_user', '管理员', 'host_user_type', NULL, NULL, '主机用户类型'),
	(10, 'soft_user', '软件用户', 'host_user_type', NULL, NULL, '主机用户类型'),
	(11, 'normal_user', '普通用户', 'host_user_type', NULL, NULL, '主机用户类型');
/*!40000 ALTER TABLE `sys_code` ENABLE KEYS */;

-- 导出  表 xlauto.sys_menu 结构
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `path` varchar(50) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `statu` int(11) DEFAULT NULL,
  `comments` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- 正在导出表  xlauto.sys_menu 的数据：~14 rows (大约)
DELETE FROM `sys_menu`;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` (`id`, `parent_id`, `title`, `name`, `path`, `icon`, `statu`, `comments`) VALUES
	(1, NULL, '主页', 'home', NULL, 'el-icon-s-home', NULL, NULL),
	(2, NULL, '工具', 'instrument', NULL, 'el-icon-s-cooperation', 0, NULL),
	(3, 2, '网络', 'network', '/network', 'el-icon-place', 0, NULL),
	(4, 2, '主机', 'host_m', '/host_m', 'el-icon-place', 0, NULL),
	(5, NULL, '部署', 'deploy', NULL, 'el-icon-s-claim', NULL, NULL),
	(7, 5, '软件部署', 'soft_deploy', '/soft_deploy', 'el-icon-s-claim', NULL, NULL),
	(8, NULL, '管理', 'manage', NULL, 'el-icon-s-claim', NULL, NULL),
	(9, 8, 'Zabbix', 'zabbix', '/zabbix', 'el-icon-s-claim', 0, NULL),
	(10, 8, '应用配置', 'app_conf', '/app_conf', 'el-icon-s-claim', NULL, NULL),
	(11, 8, '资源管理', 'resource_management', '/resource_management', 'el-icon-place', NULL, NULL),
	(12, 5, '应用部署', 'app_deploy', '/app_deploy', 'el-icon-s-claim', NULL, NULL),
	(13, 8, '包管理', 'package_manage', '/package_manage', 'el-icon-goods', NULL, NULL),
	(100, NULL, '维护', 'info_record', NULL, 'el-icon-s-custom', 1, NULL),
	(101, 100, '平台配置', 'setting', '/setting', 'el-icon-s-custom', NULL, NULL);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;

-- 导出  表 xlauto.user_account_userinfo 结构
DROP TABLE IF EXISTS `user_account_userinfo`;
CREATE TABLE IF NOT EXISTS `user_account_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `user_name` varchar(20) NOT NULL,
  `gender` varchar(2) NOT NULL,
  `job_number` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `user_post` varchar(50) NOT NULL,
  `user_department` varchar(50) NOT NULL,
  `nick` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  xlauto.user_account_userinfo 的数据：~0 rows (大约)
DELETE FROM `user_account_userinfo`;
/*!40000 ALTER TABLE `user_account_userinfo` DISABLE KEYS */;
INSERT INTO `user_account_userinfo` (`id`, `password`, `last_login`, `user_name`, `gender`, `job_number`, `mail`, `user_post`, `user_department`, `nick`, `status`) VALUES
	(1, 'pbkdf2_sha256$216000$v7BI5xpGNAKS$Er1s2FomNX8gkHtyi7YThGqF6RcCfme5NF4g84BXjnM=', NULL, 'liww', '', '0', '', '', '', '', '');
/*!40000 ALTER TABLE `user_account_userinfo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
