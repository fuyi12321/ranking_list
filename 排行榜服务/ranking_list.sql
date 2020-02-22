/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : ranking_list

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 22/02/2020 21:24:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add user model', 7, 'add_usermodel');
INSERT INTO `auth_permission` VALUES (26, 'Can change user model', 7, 'change_usermodel');
INSERT INTO `auth_permission` VALUES (27, 'Can delete user model', 7, 'delete_usermodel');
INSERT INTO `auth_permission` VALUES (28, 'Can view user model', 7, 'view_usermodel');
INSERT INTO `auth_permission` VALUES (29, 'Can add score model', 8, 'add_scoremodel');
INSERT INTO `auth_permission` VALUES (30, 'Can change score model', 8, 'change_scoremodel');
INSERT INTO `auth_permission` VALUES (31, 'Can delete score model', 8, 'delete_scoremodel');
INSERT INTO `auth_permission` VALUES (32, 'Can view score model', 8, 'view_scoremodel');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$180000$g01Kc2NTMDy7$HI1v/02747M4zZOS8jCxC6o+68Rwtz/O5Vt3tG+32xo=', '2020-02-21 15:40:29.036724', 0, '111111', '', '', '', 0, 1, '2020-02-21 15:33:44.885732');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$180000$hK75jl37JCwp$TXosdho0xoPoR0j5PW+z57ryMLf2NcBHTV9u9zWkw1o=', '2020-02-21 19:29:57.085624', 0, '222222', '', '', '', 0, 1, '2020-02-21 19:27:48.563327');
INSERT INTO `auth_user` VALUES (4, 'pbkdf2_sha256$180000$kvaj7XoaltRM$Q8XAOe5+p9VF3P0v73mfotPLQhv1SKDChHGnjtoLGgY=', '2020-02-21 19:51:07.789013', 0, '333333', '', '', '', 0, 1, '2020-02-21 19:29:48.117573');
INSERT INTO `auth_user` VALUES (6, 'pbkdf2_sha256$180000$ThYVD0rhvQVB$Y2Hq3VTVkfhPFCawl4zXREeCqERtpQkFr6DNieQqSZM=', '2020-02-21 19:52:31.551872', 0, 'yonghu4', '', '', '', 0, 1, '2020-02-21 19:51:59.270880');
INSERT INTO `auth_user` VALUES (7, 'pbkdf2_sha256$180000$w9UvQU4T3sA2$CzAtlsVdCpbQBD+MzFkgJQXHspahL1C7xuP15Ou91kI=', '2020-02-21 19:56:11.606283', 0, 'yonghu5', '', '', '', 0, 1, '2020-02-21 19:56:00.700980');
INSERT INTO `auth_user` VALUES (8, 'pbkdf2_sha256$180000$7REenQ7rkWiR$Euqg88AegUEMa+fSwsZRH8cVn/nidC2n8k9M0UBNbU4=', '2020-02-21 19:56:42.250304', 0, 'yonghu6', '', '', '', 0, 1, '2020-02-21 19:56:33.284806');
INSERT INTO `auth_user` VALUES (9, 'pbkdf2_sha256$180000$f0F4dPiBwdf1$UIN6W/+pKaPeW29pKxrE96vu4gQQkLbQU2QSAsmCEh4=', '2020-02-21 19:57:36.314927', 0, 'yonghu7', '', '', '', 0, 1, '2020-02-21 19:57:27.676053');
INSERT INTO `auth_user` VALUES (10, 'pbkdf2_sha256$180000$Y2SbeXCyhlJp$ZSdnM8VrYayYC748X0A7oS3qFxDyj6wJ3YlBE293Mmc=', '2020-02-21 19:58:09.197354', 0, 'yonghu8', '', '', '', 0, 1, '2020-02-21 19:58:01.642100');
INSERT INTO `auth_user` VALUES (11, 'pbkdf2_sha256$180000$JAWUcbKcf2xd$BonuN4VAqtjkJ9Hx/imRV3gxU/PmL77e69+GeswSXuc=', '2020-02-21 19:58:34.159979', 0, 'yonghu9', '', '', '', 0, 1, '2020-02-21 19:58:28.984136');
INSERT INTO `auth_user` VALUES (12, 'pbkdf2_sha256$180000$GtBbPTnu3Llr$YdtbWdyD9IlayK1HDdqP8bCcw1vq9IKEpFXSYeUQqTE=', '2020-02-21 19:59:00.904768', 0, 'yonghu10', '', '', '', 0, 1, '2020-02-21 19:58:49.137897');
INSERT INTO `auth_user` VALUES (13, 'pbkdf2_sha256$180000$rgJcdS9TBBEE$WpUJrT0E5EbLB/Yw2yNhtpD9gvIKChIbXGDwYXKnEEc=', '2020-02-21 19:59:20.148862', 0, 'yonghu11', '', '', '', 0, 1, '2020-02-21 19:59:13.433339');
INSERT INTO `auth_user` VALUES (14, 'pbkdf2_sha256$180000$2lJOOKc4dn97$C3oQlajjybOLWzCa50fZH8OROfaa2i3OJG3x5uttYFw=', '2020-02-21 19:59:43.642739', 0, 'yonghu12', '', '', '', 0, 1, '2020-02-21 19:59:38.436976');
INSERT INTO `auth_user` VALUES (15, 'pbkdf2_sha256$180000$9iUiSmn7bGGd$pkJ9E1WM6lerttxegMDyZ1LQA5fl/2qvh7ZDvntgnyA=', '2020-02-21 20:00:02.604319', 0, 'yonghu13', '', '', '', 0, 1, '2020-02-21 19:59:56.571217');
INSERT INTO `auth_user` VALUES (16, 'pbkdf2_sha256$180000$eq31tSLAagXw$qY6eB1pfpvYJywD9cW9qyF0fyIJJV+qTXywc8fn4BRc=', '2020-02-21 20:00:28.184285', 0, 'yonghu14', '', '', '', 0, 1, '2020-02-21 20:00:19.171123');
INSERT INTO `auth_user` VALUES (17, 'pbkdf2_sha256$180000$tRvtjALWQMNI$X6hwJLDglddP4pQhNEn7fmPbkBIixB25V+NmICC5Cxw=', '2020-02-21 20:00:48.027968', 0, 'yonghu15', '', '', '', 0, 1, '2020-02-21 20:00:39.512745');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (8, 'test1', 'scoremodel');
INSERT INTO `django_content_type` VALUES (7, 'test1', 'usermodel');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-02-21 10:15:44.265833');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2020-02-21 10:15:44.457321');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2020-02-21 10:15:44.927065');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-02-21 10:15:45.017822');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2020-02-21 10:15:45.026798');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2020-02-21 10:15:45.135508');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2020-02-21 10:15:45.194351');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2020-02-21 10:15:45.259209');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2020-02-21 10:15:45.271144');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2020-02-21 10:15:45.392819');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2020-02-21 10:15:45.397807');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2020-02-21 10:15:45.407779');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2020-02-21 10:15:45.461704');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2020-02-21 10:15:45.540463');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2020-02-21 10:15:45.593322');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2020-02-21 10:15:45.603330');
INSERT INTO `django_migrations` VALUES (17, 'sessions', '0001_initial', '2020-02-21 10:15:45.633216');
INSERT INTO `django_migrations` VALUES (18, 'test1', '0001_initial', '2020-02-21 10:50:57.221349');
INSERT INTO `django_migrations` VALUES (19, 'test1', '0002_auto_20200221_2325', '2020-02-21 15:25:19.596741');
INSERT INTO `django_migrations` VALUES (20, 'test1', '0003_scoremodel_user', '2020-02-21 15:53:54.773229');
INSERT INTO `django_migrations` VALUES (21, 'test1', '0004_auto_20200222_0059', '2020-02-21 17:00:44.276008');
INSERT INTO `django_migrations` VALUES (22, 'test1', '0005_auto_20200222_0100', '2020-02-21 17:00:44.344860');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0lw7b6de94odmmgd28nw00uq16buhhkm', 'ZmVjYThlYjAzZGZjOTg1ODc1NWVlZGI0ZjY2N2U3ODg3ODc2MWFhNjp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWU3OTdmZjI3ZTEzMTEyN2ZkZDQ0M2RjYmE4YWI2ZjJjN2YzOTI0NiJ9', '2020-03-06 20:00:48.031952');

-- ----------------------------
-- Table structure for test1_scoremodel
-- ----------------------------
DROP TABLE IF EXISTS `test1_scoremodel`;
CREATE TABLE `test1_scoremodel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL,
  `datetime` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `test1_scoremodel_user_id_e36ef5fe_uniq`(`user_id`) USING BTREE,
  CONSTRAINT `test1_scoremodel_user_id_e36ef5fe_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test1_scoremodel
-- ----------------------------
INSERT INTO `test1_scoremodel` VALUES (1, 1111, '2020-02-21 18:51:45.709270', 1);
INSERT INTO `test1_scoremodel` VALUES (2, 3333, '2020-02-21 19:40:36.816564', 2);
INSERT INTO `test1_scoremodel` VALUES (3, 111111, '2020-02-21 19:51:17.585980', 4);
INSERT INTO `test1_scoremodel` VALUES (4, 555555, '2020-02-21 19:55:48.128294', 6);
INSERT INTO `test1_scoremodel` VALUES (5, 432584, '2020-02-21 19:56:21.794243', 7);
INSERT INTO `test1_scoremodel` VALUES (6, 2541586, '2020-02-21 19:56:51.291469', 8);
INSERT INTO `test1_scoremodel` VALUES (7, 1547566, '2020-02-21 19:57:50.142726', 9);
INSERT INTO `test1_scoremodel` VALUES (8, 2147885, '2020-02-21 19:58:19.296068', 10);
INSERT INTO `test1_scoremodel` VALUES (9, 843154, '2020-02-21 19:58:38.685821', 11);
INSERT INTO `test1_scoremodel` VALUES (10, 354321, '2020-02-21 19:59:04.738582', 12);
INSERT INTO `test1_scoremodel` VALUES (11, 3245, '2020-02-21 19:59:25.143136', 13);
INSERT INTO `test1_scoremodel` VALUES (12, 56312, '2020-02-21 19:59:48.601608', 14);
INSERT INTO `test1_scoremodel` VALUES (13, 68741, '2020-02-21 20:00:06.157475', 15);
INSERT INTO `test1_scoremodel` VALUES (14, 354321, '2020-02-21 20:00:32.282149', 16);
INSERT INTO `test1_scoremodel` VALUES (15, 321, '2020-02-21 20:00:52.294595', 17);

SET FOREIGN_KEY_CHECKS = 1;
