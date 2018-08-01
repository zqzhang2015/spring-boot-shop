/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 24/07/2018 21:31:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
BEGIN;
INSERT INTO `auth_group` VALUES (1, '测试权', 1, 1, 0, '2018-07-09 11:50:24', 7, '2018-07-18 10:30:16');
INSERT INTO `auth_group` VALUES (2, 'hello', 1, 1, 0, '2018-07-13 10:39:13', 7, '2018-07-18 10:30:27');
INSERT INTO `auth_group` VALUES (3, 'hell', 1, 1, 0, '2018-07-13 10:39:35', 7, '2018-07-18 10:30:37');
INSERT INTO `auth_group` VALUES (4, 'world', 0, 1, 0, '2018-07-13 10:40:35', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (5, '测试', 0, 1, 0, '2018-07-13 10:42:24', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (6, '又是一个测试', 0, 1, 0, '2018-07-13 10:44:26', 7, '2018-07-16 14:13:10');
INSERT INTO `auth_group` VALUES (7, 'a', 0, 1, 0, '2018-07-13 10:46:08', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (8, '权限组', 0, 1, 0, '2018-07-13 10:51:18', 7, '2018-07-18 16:47:09');
INSERT INTO `auth_group` VALUES (9, '开发', 0, 1, 0, '2018-07-13 10:52:28', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (10, '啊实打实', 0, 1, 0, '2018-07-13 10:54:25', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (11, '1231', 0, 1, 0, '2018-07-13 10:56:05', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (12, '开发', 0, 1, 0, '2018-07-13 10:57:24', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (13, '阿达', 0, 1, 0, '2018-07-13 10:58:11', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (14, '啊实打实', 0, 1, 0, '2018-07-13 11:01:43', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (15, '啊实打实', 0, 1, 0, '2018-07-13 11:02:38', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (16, '开发', 0, 1, 0, '2018-07-13 11:04:11', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (17, '阿达', 0, 1, 0, '2018-07-13 11:05:23', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (18, '开发', 0, 1, 0, '2018-07-13 11:08:00', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (19, '开发', 0, 1, 0, '2018-07-13 11:10:07', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (20, 'a', 0, 1, 0, '2018-07-13 11:10:46', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (21, 'a', 0, 1, 0, '2018-07-13 11:11:11', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (22, 'a', 0, 1, 0, '2018-07-13 11:11:36', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (23, 'a', 0, 1, 0, '2018-07-13 11:15:16', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (24, 'a嗯嗯', 0, 1, 0, '2018-07-13 11:27:15', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (25, '噢123456', 0, 1, 0, '2018-07-13 11:28:35', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (26, '的', 0, 1, 0, '2018-07-13 11:30:01', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (27, '阿萨德', 0, 1, 0, '2018-07-13 11:31:49', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (28, '不为空的情况 ', 0, 1, 0, '2018-07-13 11:32:31', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (29, '333', 0, 1, 0, '2018-07-13 11:33:28', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (30, '玩', 0, 1, 0, '2018-07-13 11:33:45', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (31, '开发组', 0, 1, 0, '2018-07-13 11:35:58', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (32, '啊啊啊', 0, 1, 0, '2018-07-13 11:37:30', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (33, '测试', 0, 1, 0, '2018-07-13 12:04:56', 7, '2018-07-13 12:04:56');
INSERT INTO `auth_group` VALUES (34, '另一个测', 0, 1, 0, '2018-07-13 14:33:39', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (35, '权限组100', 1, 1, NULL, '2018-07-13 14:34:51', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (36, '权限组101', 0, 1, 0, '2018-07-13 14:35:31', 7, '2018-07-13 14:35:31');
INSERT INTO `auth_group` VALUES (37, '0', 0, 1, 0, '2018-07-13 14:51:18', 7, '2018-07-13 14:51:18');
INSERT INTO `auth_group` VALUES (38, '0', 0, 1, NULL, '2018-07-13 14:51:35', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (39, '禁用组1', 0, 1, 0, '2018-07-13 15:48:38', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (40, '', 0, 1, 0, '2018-07-13 16:00:03', 7, '2018-07-13 16:00:03');
INSERT INTO `auth_group` VALUES (41, 'b', 0, 1, 0, '2018-07-13 16:01:42', 7, '2018-07-13 16:01:42');
INSERT INTO `auth_group` VALUES (42, 'q1', 0, 1, 0, '2018-07-13 16:02:33', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (43, 'q', 1, 1, 0, '2018-07-13 16:03:43', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (44, '添加又又又一个测试', 0, 1, 0, '2018-07-13 16:14:20', 7, '2018-07-13 16:14:20');
INSERT INTO `auth_group` VALUES (45, '禁用100', 1, 1, 0, '2018-07-13 16:23:08', 7, '2018-07-13 16:23:08');
INSERT INTO `auth_group` VALUES (46, '禁用101', 1, 1, 0, '2018-07-13 16:25:22', 7, '2018-07-13 16:25:22');
INSERT INTO `auth_group` VALUES (47, '禁用组102', 1, 1, 0, '2018-07-13 16:39:17', 7, '2018-07-13 16:39:17');
INSERT INTO `auth_group` VALUES (48, 'text2018', 0, 1, NULL, '2018-07-13 16:52:19', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (49, '能不能成功', 0, 1, NULL, '2018-07-13 16:59:05', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (50, '123456789', 0, 1, 0, '2018-07-13 16:59:56', 7, '2018-07-13 16:59:56');
INSERT INTO `auth_group` VALUES (51, '123', 0, 1, NULL, '2018-07-13 17:00:32', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (52, 'a', 0, 1, NULL, '2018-07-13 17:01:04', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (53, '阿道夫', 0, 1, NULL, '2018-07-13 17:02:53', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (54, '你好', 0, 1, NULL, '2018-07-13 17:04:59', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (55, '测试组', 0, 1, 0, '2018-07-13 17:08:56', 7, '2018-07-13 17:08:56');
INSERT INTO `auth_group` VALUES (56, '测试组0', 0, 1, NULL, '2018-07-13 17:10:42', 7, '2018-07-16 14:05:19');
INSERT INTO `auth_group` VALUES (57, '测试组1', 0, 1, NULL, '2018-07-13 17:11:40', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (58, '测试组1111122222', 0, 1, 0, '2018-07-13 17:13:22', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (59, '222', 0, 1, 0, '2018-07-13 17:18:16', 7, '2018-07-13 17:18:43');
INSERT INTO `auth_group` VALUES (60, 'okklk12111', 1, 1, 0, '2018-07-13 17:30:28', 7, '2018-07-13 17:31:49');
INSERT INTO `auth_group` VALUES (61, '321test', 0, 1, 0, '2018-07-13 17:33:48', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (62, '123test', 0, 1, 0, '2018-07-13 17:34:27', 7, '2018-07-13 17:34:27');
INSERT INTO `auth_group` VALUES (63, '这是一个新的测试组', 0, 1, 0, '2018-07-16 09:48:53', 7, '2018-07-16 09:48:53');
INSERT INTO `auth_group` VALUES (64, '这是一个新的测试组2', 0, 1, 0, '2018-07-16 09:49:12', 7, '2018-07-16 09:49:12');
INSERT INTO `auth_group` VALUES (65, '这是一个新的测试组3', 0, 1, 0, '2018-07-16 09:49:31', 7, '2018-07-16 09:49:31');
INSERT INTO `auth_group` VALUES (66, '新4', 0, 1, NULL, '2018-07-16 09:54:09', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (67, '新', 0, 1, NULL, '2018-07-16 09:54:47', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (68, '鑫', 0, 1, 0, '2018-07-16 09:55:14', 7, '2018-07-16 10:24:44');
INSERT INTO `auth_group` VALUES (69, '新4', 0, 1, 0, '2018-07-16 10:01:52', 7, '2018-07-16 10:01:52');
INSERT INTO `auth_group` VALUES (70, '新5', 0, 1, 0, '2018-07-16 10:02:02', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (71, '新6新', 0, 1, 0, '2018-07-16 10:03:00', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (72, '新7，新', 0, 1, 0, '2018-07-16 10:04:20', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (73, '新7（新）', 0, 1, 0, '2018-07-16 10:07:43', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (74, '新71', 0, 1, 0, '2018-07-16 10:12:19', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (75, '新10', 0, 1, 0, '2018-07-16 10:18:20', 7, '2018-07-16 11:36:25');
INSERT INTO `auth_group` VALUES (76, 'xin2', 0, 1, 0, '2018-07-16 10:34:06', 7, '2018-07-16 10:34:06');
INSERT INTO `auth_group` VALUES (77, 'xin3', 0, 1, 0, '2018-07-16 10:48:59', 7, '2018-07-16 10:48:59');
INSERT INTO `auth_group` VALUES (78, '新', 0, 1, 0, '2018-07-16 10:57:41', 7, '2018-07-16 10:57:41');
INSERT INTO `auth_group` VALUES (79, '新新', 0, 1, 0, '2018-07-16 10:59:19', 7, '2018-07-16 10:59:19');
INSERT INTO `auth_group` VALUES (80, '测试组别', 1, 1, 0, '2018-07-16 11:12:32', 7, '2018-07-18 14:28:04');
INSERT INTO `auth_group` VALUES (81, '12', 0, 1, 0, '2018-07-16 11:12:47', 7, '2018-07-16 11:12:47');
INSERT INTO `auth_group` VALUES (82, '123456', 0, 1, 0, '2018-07-16 11:15:09', 7, '2018-07-16 11:15:09');
INSERT INTO `auth_group` VALUES (83, '12345', 0, 1, 0, '2018-07-16 11:15:17', 7, '2018-07-16 11:15:17');
INSERT INTO `auth_group` VALUES (84, '1234564', 0, 1, 0, '2018-07-16 11:15:27', 7, '2018-07-16 11:15:27');
INSERT INTO `auth_group` VALUES (85, '新123', 0, 1, 0, '2018-07-16 11:16:26', 7, '2018-07-16 11:16:26');
INSERT INTO `auth_group` VALUES (86, '新321', 0, 1, 0, '2018-07-16 11:17:15', 7, '2018-07-16 11:17:15');
INSERT INTO `auth_group` VALUES (87, '新32112', 0, 1, 0, '2018-07-16 11:17:25', 7, '2018-07-16 14:06:49');
INSERT INTO `auth_group` VALUES (88, '新32111', 0, 1, 0, '2018-07-16 11:17:42', 7, '2018-07-16 11:17:42');
INSERT INTO `auth_group` VALUES (89, '一', 0, 1, 0, '2018-07-16 11:17:56', 7, '2018-07-16 11:17:56');
INSERT INTO `auth_group` VALUES (90, '一二', 1, 1, 0, '2018-07-16 11:18:41', 7, '2018-07-18 14:25:50');
INSERT INTO `auth_group` VALUES (91, '新的', 0, 1, 0, '2018-07-16 11:43:16', 7, '2018-07-16 14:06:57');
INSERT INTO `auth_group` VALUES (92, '新', 1, 1, 0, '2018-07-16 11:43:29', 7, '2018-07-18 15:39:26');
INSERT INTO `auth_group` VALUES (93, '禁用项1', 1, 1, 0, '2018-07-16 14:09:14', 7, '2018-07-18 10:39:47');
INSERT INTO `auth_group` VALUES (94, '禁用项1', 1, 1, 0, '2018-07-16 14:09:34', 7, '2018-07-16 14:09:34');
INSERT INTO `auth_group` VALUES (95, '禁用项', 1, 1, 0, '2018-07-16 14:12:11', 7, '2018-07-16 14:12:11');
INSERT INTO `auth_group` VALUES (96, '下午的测试', 0, 1, 0, '2018-07-16 14:52:24', 7, '2018-07-16 14:52:24');
INSERT INTO `auth_group` VALUES (97, '更改权限', 0, 1, 0, '2018-07-16 14:56:09', 7, '2018-07-18 15:39:54');
INSERT INTO `auth_group` VALUES (98, '下午测试6', 0, 1, 0, '2018-07-16 16:18:11', 7, '2018-07-16 16:18:11');
INSERT INTO `auth_group` VALUES (99, '砼鑫', 0, 1, 0, '2018-07-17 18:06:59', 39, '2018-07-17 18:06:59');
INSERT INTO `auth_group` VALUES (100, '权限组', 0, 1, 0, '2018-07-17 18:46:32', 7, '2018-07-18 09:17:11');
INSERT INTO `auth_group` VALUES (101, '权限组2', 0, 1, 0, '2018-07-18 09:19:39', 7, '2018-07-18 09:19:39');
INSERT INTO `auth_group` VALUES (102, '权限组3', 0, 1, 0, '2018-07-18 09:21:27', 7, '2018-07-18 09:21:27');
INSERT INTO `auth_group` VALUES (103, '新添加的权限组', 0, 2, 0, '2018-07-18 15:40:27', 101, '2018-07-18 15:40:27');
INSERT INTO `auth_group` VALUES (104, '新测试', 0, 1, 0, '2018-07-18 15:41:22', 101, '2018-07-23 10:41:48');
INSERT INTO `auth_group` VALUES (105, '权限组名称鑫', 0, 1, 0, '2018-07-18 17:39:58', 101, '2018-07-18 17:39:58');
INSERT INTO `auth_group` VALUES (106, '权限组200', 0, 1, 0, '2018-07-18 18:19:36', 101, '2018-07-18 18:19:36');
INSERT INTO `auth_group` VALUES (107, '先权限组', 0, 1, 0, '2018-07-18 18:22:24', 101, '2018-07-18 18:22:24');
INSERT INTO `auth_group` VALUES (108, '鑫权限组', 0, 1, 0, '2018-07-18 18:23:09', 101, '2018-07-18 18:23:09');
COMMIT;

-- ----------------------------
-- Table structure for auth_value
-- ----------------------------
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

-- ----------------------------
-- Records of auth_value
-- ----------------------------
BEGIN;
INSERT INTO `auth_value` VALUES (1, 1, 1, '2018-07-17 11:19:01', '2018-07-17 15:41:30', 1);
INSERT INTO `auth_value` VALUES (1, 2, 1, '2018-07-17 15:49:23', '2018-07-17 15:50:48', 1);
INSERT INTO `auth_value` VALUES (1, 3, 1, '2018-07-17 15:51:29', '2018-07-17 18:08:01', 39);
INSERT INTO `auth_value` VALUES (1, 4, 0, '2018-07-17 16:19:22', '2018-07-17 16:19:22', 1);
INSERT INTO `auth_value` VALUES (1, 5, 1, '2018-07-17 16:01:28', '2018-07-17 16:10:33', 1);
INSERT INTO `auth_value` VALUES (1, 6, 0, '2018-07-17 16:04:31', '2018-07-17 16:18:56', 1);
INSERT INTO `auth_value` VALUES (1, 7, 0, '2018-07-17 16:29:37', '2018-07-17 16:29:37', 1);
INSERT INTO `auth_value` VALUES (1, 8, 0, '2018-07-17 16:29:48', '2018-07-17 16:29:48', 1);
INSERT INTO `auth_value` VALUES (1, 9, 0, '2018-07-17 16:29:59', '2018-07-17 16:29:59', 1);
INSERT INTO `auth_value` VALUES (2, 1, 1, '2018-07-17 11:19:01', '2018-07-17 15:41:30', 1);
INSERT INTO `auth_value` VALUES (2, 3, 1, '2018-07-17 18:07:53', '2018-07-17 18:08:01', 39);
INSERT INTO `auth_value` VALUES (2, 4, 0, '2018-07-17 16:19:22', '2018-07-17 16:19:22', 1);
INSERT INTO `auth_value` VALUES (2, 5, 1, '2018-07-17 16:01:28', '2018-07-17 16:10:33', 1);
INSERT INTO `auth_value` VALUES (2, 6, 0, '2018-07-17 16:04:31', '2018-07-17 16:19:08', 1);
INSERT INTO `auth_value` VALUES (2, 7, 0, '2018-07-17 16:29:37', '2018-07-17 16:29:37', 1);
INSERT INTO `auth_value` VALUES (2, 8, 0, '2018-07-17 16:29:48', '2018-07-17 16:29:48', 1);
INSERT INTO `auth_value` VALUES (2, 9, 0, '2018-07-17 16:29:59', '2018-07-17 16:29:59', 1);
INSERT INTO `auth_value` VALUES (3, 1, 1, '2018-07-17 11:19:01', '2018-07-17 15:41:30', 1);
INSERT INTO `auth_value` VALUES (3, 2, 1, '2018-07-17 15:49:23', '2018-07-17 15:50:48', 1);
INSERT INTO `auth_value` VALUES (3, 3, 1, '2018-07-17 15:51:29', '2018-07-17 18:08:01', 39);
INSERT INTO `auth_value` VALUES (3, 4, 0, '2018-07-17 16:19:22', '2018-07-17 16:19:22', 1);
INSERT INTO `auth_value` VALUES (3, 5, 1, '2018-07-17 16:01:28', '2018-07-17 16:10:33', 1);
INSERT INTO `auth_value` VALUES (3, 6, 1, '2018-07-17 16:04:31', '2018-07-17 16:19:08', 1);
INSERT INTO `auth_value` VALUES (3, 7, 0, '2018-07-17 16:29:37', '2018-07-17 16:29:37', 1);
INSERT INTO `auth_value` VALUES (3, 8, 0, '2018-07-17 16:29:48', '2018-07-17 16:29:48', 1);
INSERT INTO `auth_value` VALUES (3, 9, 0, '2018-07-17 16:29:59', '2018-07-17 16:29:59', 1);
INSERT INTO `auth_value` VALUES (4, 1, 1, '2018-07-17 11:19:01', '2018-07-17 15:41:30', 1);
INSERT INTO `auth_value` VALUES (4, 3, 0, '2018-07-17 18:07:53', '2018-07-17 18:07:53', 39);
INSERT INTO `auth_value` VALUES (4, 4, 0, '2018-07-17 16:19:22', '2018-07-17 16:19:22', 1);
INSERT INTO `auth_value` VALUES (4, 5, 1, '2018-07-17 16:01:28', '2018-07-17 16:10:33', 1);
INSERT INTO `auth_value` VALUES (4, 6, 1, '2018-07-17 16:04:31', '2018-07-17 16:19:08', 1);
INSERT INTO `auth_value` VALUES (4, 7, 0, '2018-07-17 16:29:37', '2018-07-17 16:29:37', 1);
INSERT INTO `auth_value` VALUES (4, 8, 0, '2018-07-17 16:29:48', '2018-07-17 16:29:48', 1);
INSERT INTO `auth_value` VALUES (4, 9, 0, '2018-07-17 16:29:59', '2018-07-17 16:29:59', 1);
INSERT INTO `auth_value` VALUES (5, 1, 1, '2018-07-17 11:19:01', '2018-07-17 15:41:30', 1);
INSERT INTO `auth_value` VALUES (5, 3, 1, '2018-07-17 18:07:53', '2018-07-17 18:08:01', 39);
INSERT INTO `auth_value` VALUES (5, 4, 0, '2018-07-17 16:19:22', '2018-07-17 16:19:22', 1);
INSERT INTO `auth_value` VALUES (5, 5, 1, '2018-07-17 16:01:28', '2018-07-17 16:10:33', 1);
INSERT INTO `auth_value` VALUES (5, 6, 1, '2018-07-17 16:04:31', '2018-07-17 16:19:08', 1);
INSERT INTO `auth_value` VALUES (5, 7, 0, '2018-07-17 16:29:37', '2018-07-17 16:29:37', 1);
INSERT INTO `auth_value` VALUES (5, 8, 1, '2018-07-17 16:29:48', '2018-07-17 16:29:48', 1);
INSERT INTO `auth_value` VALUES (5, 9, 1, '2018-07-17 16:29:59', '2018-07-17 16:29:59', 1);
INSERT INTO `auth_value` VALUES (6, 1, 1, '2018-07-17 11:19:01', '2018-07-17 15:41:30', 1);
INSERT INTO `auth_value` VALUES (6, 3, 1, '2018-07-17 18:07:53', '2018-07-17 18:08:01', 39);
INSERT INTO `auth_value` VALUES (6, 4, 0, '2018-07-17 16:19:22', '2018-07-17 16:19:22', 1);
INSERT INTO `auth_value` VALUES (6, 5, 1, '2018-07-17 16:01:28', '2018-07-17 16:10:33', 1);
INSERT INTO `auth_value` VALUES (6, 6, 0, '2018-07-17 16:04:31', '2018-07-17 16:18:56', 1);
INSERT INTO `auth_value` VALUES (6, 7, 1, '2018-07-17 16:29:37', '2018-07-17 16:29:37', 1);
INSERT INTO `auth_value` VALUES (6, 8, 0, '2018-07-17 16:29:48', '2018-07-17 16:29:48', 1);
INSERT INTO `auth_value` VALUES (6, 9, 0, '2018-07-17 16:29:59', '2018-07-17 16:29:59', 1);
INSERT INTO `auth_value` VALUES (7, 1, 1, '2018-07-17 11:19:01', '2018-07-17 15:41:30', 1);
INSERT INTO `auth_value` VALUES (7, 3, 1, '2018-07-17 18:07:53', '2018-07-17 18:08:01', 39);
INSERT INTO `auth_value` VALUES (7, 4, 1, '2018-07-17 16:19:22', '2018-07-17 16:29:29', 1);
INSERT INTO `auth_value` VALUES (7, 5, 1, '2018-07-17 16:01:28', '2018-07-17 16:10:33', 1);
INSERT INTO `auth_value` VALUES (7, 6, 1, '2018-07-17 16:04:31', '2018-07-17 16:19:08', 1);
INSERT INTO `auth_value` VALUES (7, 7, 0, '2018-07-17 16:29:37', '2018-07-17 16:29:37', 1);
INSERT INTO `auth_value` VALUES (7, 8, 0, '2018-07-17 16:29:48', '2018-07-17 16:29:48', 1);
INSERT INTO `auth_value` VALUES (7, 9, 0, '2018-07-17 16:29:59', '2018-07-17 16:29:59', 1);
INSERT INTO `auth_value` VALUES (10, 1, 1, '2018-07-17 11:19:01', '2018-07-17 15:41:30', 1);
INSERT INTO `auth_value` VALUES (10, 3, 0, '2018-07-17 18:07:53', '2018-07-17 18:07:53', 39);
INSERT INTO `auth_value` VALUES (10, 4, 0, '2018-07-17 16:19:22', '2018-07-17 16:19:22', 1);
INSERT INTO `auth_value` VALUES (10, 5, 1, '2018-07-17 16:01:28', '2018-07-17 16:10:33', 1);
INSERT INTO `auth_value` VALUES (10, 6, 1, '2018-07-17 16:04:31', '2018-07-17 16:19:08', 1);
INSERT INTO `auth_value` VALUES (10, 7, 1, '2018-07-17 16:29:37', '2018-07-17 16:29:37', 1);
INSERT INTO `auth_value` VALUES (10, 8, 0, '2018-07-17 16:29:48', '2018-07-17 16:29:48', 1);
INSERT INTO `auth_value` VALUES (10, 9, 0, '2018-07-17 16:29:59', '2018-07-17 16:29:59', 1);
INSERT INTO `auth_value` VALUES (11, 1, 1, '2018-07-17 11:19:01', '2018-07-17 15:41:30', 1);
INSERT INTO `auth_value` VALUES (11, 3, 1, '2018-07-17 18:07:53', '2018-07-17 18:08:01', 39);
INSERT INTO `auth_value` VALUES (11, 4, 1, '2018-07-17 16:19:22', '2018-07-17 16:29:29', 1);
INSERT INTO `auth_value` VALUES (11, 5, 1, '2018-07-17 16:01:28', '2018-07-17 16:10:33', 1);
INSERT INTO `auth_value` VALUES (11, 6, 1, '2018-07-17 16:04:31', '2018-07-17 16:19:08', 1);
INSERT INTO `auth_value` VALUES (11, 7, 0, '2018-07-17 16:29:37', '2018-07-17 16:29:37', 1);
INSERT INTO `auth_value` VALUES (11, 8, 0, '2018-07-17 16:29:48', '2018-07-17 16:29:48', 1);
INSERT INTO `auth_value` VALUES (11, 9, 0, '2018-07-17 16:29:59', '2018-07-17 16:29:59', 1);
INSERT INTO `auth_value` VALUES (12, 1, 1, '2018-07-17 11:19:01', '2018-07-17 15:41:30', 1);
INSERT INTO `auth_value` VALUES (12, 3, 0, '2018-07-17 18:07:53', '2018-07-17 18:07:53', 39);
INSERT INTO `auth_value` VALUES (12, 4, 0, '2018-07-17 16:19:22', '2018-07-17 16:19:22', 1);
INSERT INTO `auth_value` VALUES (12, 5, 1, '2018-07-17 16:01:28', '2018-07-17 16:10:33', 1);
INSERT INTO `auth_value` VALUES (12, 6, 1, '2018-07-17 16:04:31', '2018-07-17 16:19:08', 1);
INSERT INTO `auth_value` VALUES (12, 7, 0, '2018-07-17 16:29:37', '2018-07-17 16:29:37', 1);
INSERT INTO `auth_value` VALUES (12, 8, 0, '2018-07-17 16:29:48', '2018-07-17 16:29:48', 1);
INSERT INTO `auth_value` VALUES (12, 9, 1, '2018-07-17 16:29:59', '2018-07-17 16:29:59', 1);
INSERT INTO `auth_value` VALUES (13, 1, 1, '2018-07-17 11:19:01', '2018-07-17 15:41:30', 1);
INSERT INTO `auth_value` VALUES (13, 3, 0, '2018-07-17 18:07:53', '2018-07-17 18:07:53', 39);
INSERT INTO `auth_value` VALUES (13, 4, 0, '2018-07-17 16:19:22', '2018-07-17 16:19:22', 1);
INSERT INTO `auth_value` VALUES (13, 5, 1, '2018-07-17 16:01:28', '2018-07-17 16:10:33', 1);
INSERT INTO `auth_value` VALUES (13, 6, 1, '2018-07-17 16:04:31', '2018-07-17 16:19:08', 1);
INSERT INTO `auth_value` VALUES (13, 7, 0, '2018-07-17 16:29:37', '2018-07-17 16:29:37', 1);
INSERT INTO `auth_value` VALUES (13, 8, 1, '2018-07-17 16:29:48', '2018-07-17 16:29:48', 1);
INSERT INTO `auth_value` VALUES (13, 9, 0, '2018-07-17 16:29:59', '2018-07-17 16:29:59', 1);
INSERT INTO `auth_value` VALUES (14, 1, 1, '2018-07-17 11:19:01', '2018-07-17 15:41:30', 1);
INSERT INTO `auth_value` VALUES (14, 3, 1, '2018-07-17 18:07:53', '2018-07-17 18:08:01', 39);
INSERT INTO `auth_value` VALUES (14, 4, 1, '2018-07-17 16:19:22', '2018-07-17 16:29:29', 1);
INSERT INTO `auth_value` VALUES (14, 5, 1, '2018-07-17 16:01:28', '2018-07-17 16:10:33', 1);
INSERT INTO `auth_value` VALUES (14, 6, 1, '2018-07-17 16:04:31', '2018-07-17 16:19:08', 1);
INSERT INTO `auth_value` VALUES (14, 7, 0, '2018-07-17 16:29:37', '2018-07-17 16:29:37', 1);
INSERT INTO `auth_value` VALUES (14, 8, 0, '2018-07-17 16:29:48', '2018-07-17 16:29:48', 1);
INSERT INTO `auth_value` VALUES (14, 9, 0, '2018-07-17 16:29:59', '2018-07-17 16:29:59', 1);
INSERT INTO `auth_value` VALUES (15, 1, 1, '2018-07-17 11:19:01', '2018-07-17 15:41:30', 1);
INSERT INTO `auth_value` VALUES (15, 3, 1, '2018-07-17 18:07:53', '2018-07-17 18:08:01', 39);
INSERT INTO `auth_value` VALUES (15, 4, 1, '2018-07-17 16:19:22', '2018-07-17 16:29:29', 1);
INSERT INTO `auth_value` VALUES (15, 5, 1, '2018-07-17 16:01:28', '2018-07-17 16:10:33', 1);
INSERT INTO `auth_value` VALUES (15, 6, 0, '2018-07-17 16:04:31', '2018-07-17 16:19:08', 1);
INSERT INTO `auth_value` VALUES (15, 7, 0, '2018-07-17 16:29:37', '2018-07-17 16:29:37', 1);
INSERT INTO `auth_value` VALUES (15, 8, 0, '2018-07-17 16:29:48', '2018-07-17 16:29:48', 1);
INSERT INTO `auth_value` VALUES (15, 9, 1, '2018-07-17 16:29:59', '2018-07-17 16:29:59', 1);
INSERT INTO `auth_value` VALUES (16, 1, 1, '2018-07-17 11:19:01', '2018-07-17 15:41:30', 1);
INSERT INTO `auth_value` VALUES (16, 3, 1, '2018-07-17 18:07:53', '2018-07-17 18:08:01', 39);
INSERT INTO `auth_value` VALUES (16, 4, 0, '2018-07-17 16:19:22', '2018-07-17 16:19:22', 1);
INSERT INTO `auth_value` VALUES (16, 5, 1, '2018-07-17 16:01:28', '2018-07-17 16:10:33', 1);
INSERT INTO `auth_value` VALUES (16, 6, 0, '2018-07-17 16:04:31', '2018-07-17 16:18:56', 1);
INSERT INTO `auth_value` VALUES (16, 7, 0, '2018-07-17 16:29:37', '2018-07-17 16:29:37', 1);
INSERT INTO `auth_value` VALUES (16, 8, 0, '2018-07-17 16:29:48', '2018-07-17 16:29:48', 1);
INSERT INTO `auth_value` VALUES (16, 9, 0, '2018-07-17 16:29:59', '2018-07-17 16:29:59', 1);
INSERT INTO `auth_value` VALUES (18, 1, 1, '2018-07-17 10:52:16', '2018-07-17 15:41:30', 1);
INSERT INTO `auth_value` VALUES (18, 3, 0, '2018-07-17 18:07:53', '2018-07-17 18:07:53', 39);
INSERT INTO `auth_value` VALUES (18, 4, 0, '2018-07-17 16:19:22', '2018-07-17 16:19:22', 1);
INSERT INTO `auth_value` VALUES (18, 5, 1, '2018-07-17 16:01:28', '2018-07-17 16:10:33', 1);
INSERT INTO `auth_value` VALUES (18, 6, 1, '2018-07-17 16:04:31', '2018-07-17 16:19:08', 1);
INSERT INTO `auth_value` VALUES (18, 7, 0, '2018-07-17 16:29:37', '2018-07-17 16:29:37', 1);
INSERT INTO `auth_value` VALUES (18, 8, 0, '2018-07-17 16:29:48', '2018-07-17 16:29:48', 1);
INSERT INTO `auth_value` VALUES (18, 9, 0, '2018-07-17 16:29:59', '2018-07-17 16:29:59', 1);
INSERT INTO `auth_value` VALUES (19, 1, 1, '2018-07-17 11:19:01', '2018-07-17 15:41:30', 1);
INSERT INTO `auth_value` VALUES (19, 3, 1, '2018-07-17 18:07:53', '2018-07-17 18:08:01', 39);
INSERT INTO `auth_value` VALUES (19, 4, 0, '2018-07-17 16:19:22', '2018-07-17 16:19:22', 1);
INSERT INTO `auth_value` VALUES (19, 5, 1, '2018-07-17 16:01:28', '2018-07-17 16:10:33', 1);
INSERT INTO `auth_value` VALUES (19, 6, 1, '2018-07-17 16:04:31', '2018-07-17 16:19:08', 1);
INSERT INTO `auth_value` VALUES (19, 7, 0, '2018-07-17 16:29:37', '2018-07-17 16:29:37', 1);
INSERT INTO `auth_value` VALUES (19, 8, 0, '2018-07-17 16:29:48', '2018-07-17 16:29:48', 1);
INSERT INTO `auth_value` VALUES (19, 9, 0, '2018-07-17 16:29:59', '2018-07-17 16:29:59', 1);
INSERT INTO `auth_value` VALUES (20, 1, 1, '2018-07-17 11:19:01', '2018-07-17 15:41:30', 1);
INSERT INTO `auth_value` VALUES (20, 3, 1, '2018-07-17 18:07:53', '2018-07-17 18:08:01', 39);
INSERT INTO `auth_value` VALUES (20, 4, 0, '2018-07-17 16:19:22', '2018-07-17 16:19:22', 1);
INSERT INTO `auth_value` VALUES (20, 5, 1, '2018-07-17 16:01:28', '2018-07-17 16:10:33', 1);
INSERT INTO `auth_value` VALUES (20, 6, 1, '2018-07-17 16:04:31', '2018-07-17 16:19:08', 1);
INSERT INTO `auth_value` VALUES (20, 7, 0, '2018-07-17 16:29:37', '2018-07-17 16:29:37', 1);
INSERT INTO `auth_value` VALUES (20, 8, 0, '2018-07-17 16:29:48', '2018-07-17 16:29:48', 1);
INSERT INTO `auth_value` VALUES (20, 9, 0, '2018-07-17 16:29:59', '2018-07-17 16:29:59', 1);
COMMIT;

-- ----------------------------
-- Table structure for enterprise
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of enterprise
-- ----------------------------
BEGIN;
INSERT INTO `enterprise` VALUES (1, '河南砼鑫软件科技有限公司', '砼鑫软件', '0', '0', 0, 1, '2018-07-05 11:01:38', '2018-07-17 12:00:44');
INSERT INTO `enterprise` VALUES (2, '测试企业', '测啊', '0', '0', 0, 0, '2018-07-16 15:38:40', '2018-07-17 18:14:58');
INSERT INTO `enterprise` VALUES (3, '郑州erp', 'rp', '152313啊', '152', 0, 0, '2018-07-17 10:21:27', '2018-07-17 10:21:27');
INSERT INTO `enterprise` VALUES (4, '测试企业ABC', '测试企业ABC', '15225853885241313', '啊', 0, 1, '2018-07-17 10:26:45', '2018-07-17 16:36:03');
INSERT INTO `enterprise` VALUES (5, '重庆市大众产业有限公司', '大众产业', '1522585384萨达说', '1234131阿斯顿啊', 0, 0, '2018-07-17 10:28:01', '2018-07-17 10:28:01');
INSERT INTO `enterprise` VALUES (6, '测试1', '测试1', '1522222221', '1锕收到锕', 0, 1, '2018-07-17 10:28:50', '2018-07-17 10:28:50');
INSERT INTO `enterprise` VALUES (7, '测试2', '测试2', 'sadasdadasdad', '13213131', 1, 0, '2018-07-17 10:30:24', '2018-07-17 17:16:22');
INSERT INTO `enterprise` VALUES (8, '测试3', '测试3', '阿斯顿锕', '123456', 0, 1, '2018-07-17 10:30:42', '2018-07-17 10:30:42');
INSERT INTO `enterprise` VALUES (9, '测试42', '测试42', '123463', '13213', 1, 1, '2018-07-17 10:30:58', '2018-07-17 15:43:08');
INSERT INTO `enterprise` VALUES (10, '测试5', '测试5', '15225853355', '123131', 0, 0, '2018-07-17 10:31:14', '2018-07-17 10:31:14');
INSERT INTO `enterprise` VALUES (11, '测试6', '测试6', '152313', '锕3收到阿1的', 0, 1, '2018-07-17 10:32:19', '2018-07-17 10:32:19');
INSERT INTO `enterprise` VALUES (12, '测试企业', '测ssssss', '0', '0', 0, 1, '2018-07-17 11:59:33', '2018-07-17 14:54:43');
INSERT INTO `enterprise` VALUES (13, 'cs1', 'cs1', '1513213cs1', '1acs1', 0, 1, '2018-07-17 14:58:07', '2018-07-17 14:58:07');
INSERT INTO `enterprise` VALUES (14, '测试机器', '测试机器', '测试机器', '测试机器', 0, 0, '2018-07-17 15:32:00', '2018-07-17 15:32:00');
INSERT INTO `enterprise` VALUES (15, '测法', '测法', '测法', '测法', 0, 1, '2018-07-17 15:33:31', '2018-07-17 15:33:31');
INSERT INTO `enterprise` VALUES (16, '的啊大叔a', '阿斯顿啊', '萨达', '阿斯顿阿斯顿a', 0, 0, '2018-07-17 18:08:46', '2018-07-17 18:08:46');
COMMIT;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
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
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES (1, '菜单列表', '/', '/', 0, 0, 1, 0, 0, 1, '2018-07-24 20:49:29', '2018-07-24 20:49:29');
INSERT INTO `menu` VALUES (22, '用户管理', '/user', '', 1, 0, 2, 0, 0, 1, '2018-07-24 20:50:53', '2018-07-24 20:50:53');
INSERT INTO `menu` VALUES (23, '权限管理', '/auth', '', 1, 0, 2, 0, 0, 1, '2018-07-24 20:51:10', '2018-07-24 20:51:10');
INSERT INTO `menu` VALUES (24, '商品管理', '/goods', '', 1, 0, 2, 0, 0, 1, '2018-07-24 20:51:31', '2018-07-24 20:51:31');
INSERT INTO `menu` VALUES (25, '管理员登录', '/admin/login', '/user/login', 22, 0, 3, 0, 0, 1, '2018-07-24 20:53:36', '2018-07-24 20:53:36');
INSERT INTO `menu` VALUES (26, '用户登录', '/phone/user/login', '/user/login', 22, 0, 3, 0, 0, 1, '2018-07-24 20:55:16', '2018-07-24 20:55:16');
INSERT INTO `menu` VALUES (28, '用户列表', '', '/user/userList', 1, 1, 2, 0, 0, 1, '2018-07-24 20:57:41', '2018-07-24 20:57:41');
COMMIT;

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
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

-- ----------------------------
-- Table structure for order_master
-- ----------------------------
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

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(128) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '密码',
  `phone` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '邮箱',
  `enterprise` int(11) NOT NULL DEFAULT '1' COMMENT '所属企业',
  `header` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '头像',
  `auth_group` int(11) DEFAULT '0' COMMENT '所属权限组',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`uid`),
  KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'lhr', '5ce35f64226f202040a88f260bd0b950', '19937150218', 'liuhaoran@hntxrj.com', 1, '', 1, 0, '2018-06-28 15:43:47', '2018-07-20 09:25:58');
INSERT INTO `user` VALUES (2, 'lhr1AAA', '5ce35f64226f202040a88f260bd0b950', '1aa', 'liuhaoran@hntxrj.com', 1, '', 1, 0, '2018-06-28 15:43:47', '2018-07-16 10:11:51');
INSERT INTO `user` VALUES (3, 'lhr2', '5ce35f64226f202040a88f260bd0b950', '1', 'liuhaoran@hntxrj.com', 1, '', 1, 0, '2018-06-28 15:43:47', '2018-07-16 10:11:51');
INSERT INTO `user` VALUES (6, '张三', '5ce35f64226f202040a88f260bd0b950', '12345678901', 'zs@hntxrj.com', 1, '', 1, 0, '2018-07-05 13:30:13', '2018-07-16 10:11:51');
INSERT INTO `user` VALUES (40, 'aCCC', 'b2f32baa5d7f026585cafcf9f4368d2d', '11111111', '', 1, '', 1, 0, '2018-07-11 14:15:28', '2018-07-16 10:11:51');
INSERT INTO `user` VALUES (41, 'JJ', 'f9e2e6896f81a615f55bae92c7e855be', '1230', '', 1, '', 1, 0, '2018-07-11 14:40:32', '2018-07-16 10:11:51');
INSERT INTO `user` VALUES (42, 'x', '992a86c5830fdd6762aaf2afaa0827f6', '123', '', 1, '', 1, 0, '2018-07-11 14:48:51', '2018-07-16 10:11:51');
INSERT INTO `user` VALUES (43, 'aZZZ', '50300358b72bb92236b0c6af717df9f3', '012', '', 1, '', 1, 0, '2018-07-11 14:50:05', '2018-07-16 10:11:51');
INSERT INTO `user` VALUES (45, 'ADC', '50300358b72bb92236b0c6af717df9f3', '0123', '', 1, '', 1, 0, '2018-07-11 14:55:32', '2018-07-16 10:11:51');
INSERT INTO `user` VALUES (50, 'Jay', 'f2931a01b7cec1d132c7851ac42dda46', '12', '', 1, '', 1, 0, '2018-07-11 15:37:53', '2018-07-16 16:20:54');
INSERT INTO `user` VALUES (56, '55555', '5ce35f64226f202040a88f260bd0b950', '123456999', '', 1, '', 1, 0, '2018-07-12 15:32:29', '2018-07-16 10:11:51');
INSERT INTO `user` VALUES (58, '测试333', 'f2931a01b7cec1d132c7851ac42dda46', '12345678999', '', 1, '', 0, 0, '2018-07-16 15:02:40', '2018-07-16 15:22:12');
INSERT INTO `user` VALUES (63, 'Jay_L2', 'f2931a01b7cec1d132c7851ac42dda46', '123456789', '', 1, '', 0, 0, '2018-07-16 15:58:16', '2018-07-16 16:10:12');
INSERT INTO `user` VALUES (64, '下午测试34', 'f2931a01b7cec1d132c7851ac42dda46', '654123', '', 1, '', 0, 0, '2018-07-16 16:10:41', '2018-07-16 16:13:33');
INSERT INTO `user` VALUES (66, '下午测试7', 'f2931a01b7cec1d132c7851ac42dda46', '123987', '', 1, '', 0, 0, '2018-07-16 16:25:38', '2018-07-16 16:25:38');
INSERT INTO `user` VALUES (71, '测试13', 'f2931a01b7cec1d132c7851ac42dda46', '123646', '', 1, '', 0, 0, '2018-07-16 16:31:59', '2018-07-16 16:31:59');
INSERT INTO `user` VALUES (72, '测试14', 'f2931a01b7cec1d132c7851ac42dda46', '198729', '', 1, '', 0, 0, '2018-07-16 16:33:51', '2018-07-16 16:33:51');
INSERT INTO `user` VALUES (73, '测试15', 'f2931a01b7cec1d132c7851ac42dda46', '54631', '', 1, '', 0, 0, '2018-07-16 16:35:00', '2018-07-16 16:35:00');
INSERT INTO `user` VALUES (74, 'guest1', 'f2931a01b7cec1d132c7851ac42dda46', '152222222', '', 1, '', 0, 0, '2018-07-16 16:42:48', '2018-07-16 16:43:35');
INSERT INTO `user` VALUES (75, '测试2011', 'f2931a01b7cec1d132c7851ac42dda46', '545454', '', 1, '', 0, 0, '2018-07-16 16:45:54', '2018-07-16 17:33:26');
INSERT INTO `user` VALUES (76, '测试', 'f9e2e6896f81a615f55bae92c7e855be', '112356', '', 1, '', 0, 0, '2018-07-16 18:07:21', '2018-07-16 18:09:32');
INSERT INTO `user` VALUES (79, '张飞', 'f2931a01b7cec1d132c7851ac42dda46', '12580', '', 2, '', 0, 0, '2018-07-17 08:51:19', '2018-07-17 08:51:19');
INSERT INTO `user` VALUES (84, '李', '992a86c5830fdd6762aaf2afaa0827f6', '159', '', 1, '', 0, 0, '2018-07-17 10:00:26', '2018-07-17 10:00:26');
INSERT INTO `user` VALUES (86, '晨', '29680d3081c3a1d705fb5d768ac70152', '111111', '100@163.com', 1, '', 0, 0, '2018-07-17 10:23:35', '2018-07-17 10:23:35');
INSERT INTO `user` VALUES (87, '晨2', '29680d3081c3a1d705fb5d768ac70152', '1111111111', '101@163.com', 1, '', 0, 0, '2018-07-17 10:24:41', '2018-07-17 10:24:41');
INSERT INTO `user` VALUES (88, '王府井', '5ce35f64226f202040a88f260bd0b950', '15225853884', '', 16, '', 0, 1, '2018-07-17 18:29:31', '2018-07-17 18:29:31');
INSERT INTO `user` VALUES (89, 'mz135135aa', '5ce35f64226f202040a88f260bd0b950', '15222222222', '', 6, '', 0, 0, '2018-07-17 18:43:27', '2018-07-17 18:43:27');
INSERT INTO `user` VALUES (91, 'mz13513512as', '5ce35f64226f202040a88f260bd0b950', '1522531321', '213asd@aa.ca', 1, '', 0, 0, '2018-07-18 09:42:04', '2018-07-18 09:42:04');
INSERT INTO `user` VALUES (92, 'mzasdad123', '5ce35f64226f202040a88f260bd0b950', '15225853888', '', 6, '', 0, 0, '2018-07-18 09:43:09', '2018-07-18 09:43:09');
INSERT INTO `user` VALUES (93, 'admin', '5ce35f64226f202040a88f260bd0b950', '15225233222', '', 6, '', 0, 0, '2018-07-18 09:44:25', '2018-07-18 09:44:25');
INSERT INTO `user` VALUES (94, '萨测撒多少啊', '5ce35f64226f202040a88f260bd0b950', '123123asd11', '', 13, '', 0, 0, '2018-07-18 09:56:33', '2018-07-18 09:56:33');
INSERT INTO `user` VALUES (95, 'admin11', '0116f12f96d26919ed14f2cfb2f6391f', '151321', '123@163.com', 7, '', 0, 0, '2018-07-18 09:58:01', '2018-07-18 15:52:23');
INSERT INTO `user` VALUES (96, 'asda12313', 'be26f845b8cda1df0fd520e1ad6ea10b', '15222523', '', 6, '', 0, 1, '2018-07-18 10:02:40', '2018-07-18 10:02:40');
INSERT INTO `user` VALUES (97, 'sada123456', 'be26f845b8cda1df0fd520e1ad6ea10b', '12315113', '', 6, '', 0, 0, '2018-07-18 10:03:27', '2018-07-18 10:03:27');
INSERT INTO `user` VALUES (98, 'asdadasd123', '5ce35f64226f202040a88f260bd0b950', '15223123', '', 6, '', 0, 0, '2018-07-18 10:05:03', '2018-07-18 10:05:03');
INSERT INTO `user` VALUES (100, '2018', '1d59b48bacab4d3dd0869117a035c1db', '188', '100@163.com', 1, '', 0, 0, '2018-07-18 11:47:05', '2018-07-18 11:47:05');
INSERT INTO `user` VALUES (101, 'Jay', '1d59b48bacab4d3dd0869117a035c1db', '1008611', '10086@163.com', 1, '', 0, 0, '2018-07-18 11:50:50', '2018-07-18 11:50:50');
INSERT INTO `user` VALUES (102, 'Le', '992a86c5830fdd6762aaf2afaa0827f6', '123456', '123@qq.com', 1, '', 0, 0, '2018-07-18 15:43:37', '2018-07-18 15:43:37');
INSERT INTO `user` VALUES (103, '新账号', '5ce35f64226f202040a88f260bd0b950', '10086', '10086@qq.com', 1, '', 0, 0, '2018-07-18 16:16:49', '2018-07-18 16:16:49');
INSERT INTO `user` VALUES (104, 'Small', 'ba0305781d58d63ee145a8ef5d80ec27', '10010', '102@QQ.com', 1, '', 0, 0, '2018-07-23 10:40:48', '2018-07-23 10:40:48');
COMMIT;

-- ----------------------------
-- Table structure for user_login
-- ----------------------------
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

-- ----------------------------
-- Records of user_login
-- ----------------------------
BEGIN;
INSERT INTO `user_login` VALUES ('0602ec179b88665a48f3d2af1e97df99', 6, 'dd53bae7a8ac99472f9fd20a2a6e899b', '192.168.31.182', '未知', '未知', '2018-07-09 11:50:37', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('06686eec946fdd608515287e4faf14d7', 1, '39a40784a094ee41b0a8fc624c4f1c06', '192.168.31.8', '未知', '未知', '2018-07-24 20:11:25', '2018-08-23 20:11:25');
INSERT INTO `user_login` VALUES ('06838b5954fe75dfbdfa93f2bc3ed1ae', 6, '231309b3ce9ef60d43283c017cb8bba0', '192.168.31.182', '未知', '未知', '2018-07-09 09:51:58', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('069a368b885d246dd8e0016a9f72c6b1', 6, '2a312aa487c93a542bdf05cc54369021', '192.168.31.182', '未知', '未知', '2018-07-06 15:29:22', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('07caa6d31cdd0b6158518cc82f24258b', 6, 'dce820acbb566028c1312914a3f2fbc3', '192.168.31.182', '未知', '未知', '2018-07-06 16:06:36', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('09f3957ca4c3c1cc6262fe043385acf3', 6, 'e997a59db398f720a41db56f05f3ef57', '192.168.31.182', '未知', '未知', '2018-07-06 15:10:04', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('0acfb1e7ae93301df4b82f4b6242a4ea', 6, '0686db7fa4e2f66c331f35365c2b7893', '192.168.31.135', '未知', '未知', '2018-07-05 15:17:20', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('0ae022ced2bf40857d7cbb81d0b31898', 6, '48387aa451bf10efa0850a72358bc534', '192.168.31.182', '未知', '未知', '2018-07-09 10:35:06', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('0bd5aac0c6224b17f07b7c959349add6', 6, 'c6300c5f0cb0adfde2b892837cc017ea', '192.168.31.182', '未知', '未知', '2018-07-06 15:00:48', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('0cec9cac7798f659c53c698e533aa6fd', 6, '96fe651e359eb8135752f098fa982fb2', '192.168.31.184', '未知', '未知', '2018-07-10 14:30:22', '2018-08-09 14:30:22');
INSERT INTO `user_login` VALUES ('0d778cbd0031e63e36acd17d6ee2847a', 6, '2ed160cbbedb593ce321ddf79b9df614', '192.168.31.182', '未知', '未知', '2018-07-06 14:19:35', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('0dd01709f3b5c4750e1377ca130697c7', 6, '9f49c09b25a817cf5e1128847963d532', '192.168.31.182', '未知', '未知', '2018-07-09 09:53:39', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('0e451cf56f527e7e585adc1f1352f3d8', 6, 'a40ff8d6a66a97813b3fc74ce8a8db52', '192.168.31.182', '未知', '未知', '2018-07-09 12:02:39', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('0e859a55f9ff89ad80027fef2576f2a8', 6, '1849f86dec316d07d9af2bb52b5b4a7d', '192.168.31.135', '未知', '未知', '2018-07-05 16:21:46', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('0e97a67efa8193408f05381d572959a6', 6, 'ecb79d318cb0f94adfb4890ad90360a6', '192.168.31.182', '未知', '未知', '2018-07-06 14:50:42', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('0eaf4273e1bb90e9f210fcbed0219c74', 6, 'f2f09d75538c6b1345e0bee6664995e2', '192.168.31.182', '未知', '未知', '2018-07-09 10:17:31', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('0fe5b9d72a68e3e6366feb7f512ecf50', 6, '36561d0e9f5cfea41712ce5f9f1b7e84', '192.168.31.182', '未知', '未知', '2018-07-06 15:38:19', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('1077a86a68099e9684526de4264ad1a4', 6, '33faf3b30a3fe461fd3330f42b2b1eef', '192.168.31.182', '未知', '未知', '2018-07-09 11:51:27', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('10f318a4a94ad1c5ad34e023057323c3', 7, 'e1d2ec949f247e46698f58a74241e867', '192.168.31.187', '未知', '未知', '2018-07-17 15:57:17', '2018-08-16 15:57:17');
INSERT INTO `user_login` VALUES ('1117d121869f334929b8a3b7ff00295b', 7, 'a938a353a1b7a3d3f3707ae79dd7af96', '192.168.31.187', '未知', '未知', '2018-07-17 15:57:17', '2018-08-16 15:57:17');
INSERT INTO `user_login` VALUES ('1181cf1822c98e27fdef83c3e185a6b0', 7, '54e2dc41dcd81571e7b67d53e5ffc203', '192.168.31.184', '未知', '未知', '2018-07-16 18:31:54', '2018-08-15 18:31:55');
INSERT INTO `user_login` VALUES ('12a7f7b3de5f2ea54526da7d4cf4a2c6', 1, '97013f7814a6e43600f7e124fb706a07', '192.168.31.8', '未知', '未知', '2018-07-09 14:15:25', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('13f6d0c57ae9e072a3f90cd738bed7db', 7, 'a4508bcd2073e6526ce67f2768deeed3', '192.168.31.184', '未知', '未知', '2018-07-12 14:31:22', '2018-08-11 14:31:22');
INSERT INTO `user_login` VALUES ('142c905774fb59752fa73fb97b3800f8', 6, '5f628457273c02fd4a02041d1238e3bc', '192.168.31.182', '未知', '未知', '2018-07-09 11:22:06', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('144f005b26a3fa32930a9e9a6f047641', 6, 'bc38fbf15827bba17074ecde3096532c', '192.168.31.182', '未知', '未知', '2018-07-06 16:00:28', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('148b608d6cea7caf0d6761003ab16931', 6, '08e38417ff65417f685ca83a779ef593', '192.168.31.182', '未知', '未知', '2018-07-06 14:39:34', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('186f5163873a49491e176e5fda94775e', 6, '6d6d6511ff8ec71f76cf7e7d86a84d89', '192.168.31.182', '未知', '未知', '2018-07-06 16:36:31', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('1b7c38d5a190482716dad0c47a8bbc4d', 6, '642808ca017a4ad016f34ae489330c04', '192.168.31.135', '未知', '未知', '2018-07-05 16:27:22', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('1d40527d857250be0e6f6264232cea35', 7, 'ad761593e29a94645b63bc4e7c51b1e2', '192.168.31.187', '未知', '未知', '2018-07-17 15:57:17', '2018-08-16 15:57:17');
INSERT INTO `user_login` VALUES ('1eeaf069fcc91a0d5330eada261beab1', 101, '7c9a9be113eb66a97b5b49150db2bcd3', '192.168.31.184', '未知', '未知', '2018-07-18 11:51:42', '2018-08-17 11:51:43');
INSERT INTO `user_login` VALUES ('1f7551226047f569bb3a9318a9d14114', 1, '8df611d4c9628dbf0de5a6a7663336f8', '192.168.31.8', '未知', '未知', '2018-07-20 09:26:08', '2018-08-19 09:26:08');
INSERT INTO `user_login` VALUES ('1f839c09e2217214d75b45a4dd3c9f36', 7, 'e4e5c7cff0e32bc605452431846a4c83', '192.168.31.184', '未知', '未知', '2018-07-16 16:40:40', '2018-08-15 16:40:40');
INSERT INTO `user_login` VALUES ('1ffe22f36518238c69fa9489994dd05c', 6, '42ffffd54831808e3d498d3c10f0b387', '192.168.31.182', '未知', '未知', '2018-07-06 17:07:53', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('203f0e9f4f1a0d43af81ac2313030727', 6, 'ab25b0120f5c8b43c02a0d60ab4904b8', '192.168.31.182', '未知', '未知', '2018-07-09 10:01:34', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('20519e089d0342b103bf91ac61996ab6', 6, '89cde436eb7ee0119d3dac22a6cc8bb4', '192.168.31.135', '未知', '未知', '2018-07-05 15:41:52', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('209d32256a0f72428d4bbaf9c483083b', 6, 'ed4b83d3f5c5e2cca16449045e4b8144', '192.168.31.182', '未知', '未知', '2018-07-06 15:46:00', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('21ef65e9b08e9107cc18df788d544dd4', 6, 'a7d7117e41d120667fa8ae2a8acfef8e', '192.168.31.182', '未知', '未知', '2018-07-06 15:35:03', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('23cb30951199c6ac67e9bc4f8b15e91a', 6, '9a31baa3836f738ffe90771e27588caf', '192.168.31.182', '未知', '未知', '2018-07-06 15:22:34', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('243cffb8f659371076f0c0f24eab925c', 7, '3a2aa504622fc7be4b95d93d8f859880', '192.168.31.187', '未知', '未知', '2018-07-16 14:21:55', '2018-08-15 14:21:55');
INSERT INTO `user_login` VALUES ('24a89472249b0ee07d16e91f8680a127', 7, '06e0902f716360e1bd19e613d0411eb3', '192.168.31.184', '未知', '未知', '2018-07-18 10:01:17', '2018-08-17 10:01:18');
INSERT INTO `user_login` VALUES ('2674bddb30d91d1de84496a734471e8a', 6, '2b57377190672b3e1b96cdbcd171a7c2', '192.168.31.182', '未知', '未知', '2018-07-09 11:02:47', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('276c0462b832554e10879e937eee73f3', 6, '57da016c0428dcaaf1b0ac35c12cc4a5', '192.168.31.182', '未知', '未知', '2018-07-09 11:20:05', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('277aae54378296ad10961b1ae1bd1e65', 7, '83e0b0e2ee0e47af9458ce6d57129896', '192.168.31.187', '未知', '未知', '2018-07-17 15:57:17', '2018-08-16 15:57:17');
INSERT INTO `user_login` VALUES ('2895efc691de3402ba1a305c50dd6605', 6, 'ae3e4cf65cd75a7eeaa1331379fe2e62', '192.168.31.182', '未知', '未知', '2018-07-09 11:37:38', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('2a1601eefbb91712ed0b1ca6b187f4da', 1, '6bf4a7d34d93de0552777f67a2887ef5', '192.168.31.8', '未知', '未知', '2018-07-04 11:00:46', '2018-08-04 11:05:57');
INSERT INTO `user_login` VALUES ('2b91fe8a05fd859e7dabf2ec0a6804fd', 101, '3fcf6871def73257aace1f8e3bc31f58', '192.168.31.184', '未知', '未知', '2018-07-23 08:49:27', '2018-08-22 08:49:27');
INSERT INTO `user_login` VALUES ('2d0fb5398e9588102326f00947cbea0a', 7, 'b8636bc1963aa9c68302d7814786f769', '192.168.31.184', '未知', '未知', '2018-07-12 08:46:12', '2018-08-11 08:46:13');
INSERT INTO `user_login` VALUES ('2d1c55cf8e2d71553f92039b564f43aa', 6, '17950e886698e5a32d27c55327564a87', '192.168.31.182', '未知', '未知', '2018-07-09 11:39:19', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('2dd13ef40512804e2267975c10f5970e', 6, '0819902cc3f2fcf004d92030c9211d40', '192.168.31.135', '未知', '未知', '2018-07-05 16:05:23', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('2e2937a895ef9b7750650d9ac3b929a3', 6, 'c24bb7379ee4f8e455e95e389edda8e8', '192.168.31.182', '未知', '未知', '2018-07-09 11:09:41', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('2f034791e184f5262fe9827bb1df0346', 6, '93a4fd0428497ae5af1ba2a59d20f358', '192.168.31.182', '未知', '未知', '2018-07-09 10:12:18', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('3061f30b1a10b83850c8afa6c272d429', 1, 'e2388bc9382a4b22140c842b1943b250', '192.168.31.8', '未知', '未知', '2018-07-24 21:30:06', '2018-08-23 21:30:06');
INSERT INTO `user_login` VALUES ('31577b9e4c67ce6dc7568006068919a3', 6, '709c9c4f54e500714d186e9e05ccc5fe', '192.168.31.182', '未知', '未知', '2018-07-06 16:01:08', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('316008c2e5aac86eca440ba92dfe12b7', 1, '6b0311dac5164344c3f84fd74c812262', '192.168.31.8', '未知', '未知', '2018-07-04 10:57:13', '2018-08-04 11:05:57');
INSERT INTO `user_login` VALUES ('31650fe45a6161618533fe5f8223dd78', 7, '64467cb3fd3ab66a611ef4228887c98e', '192.168.31.184', '未知', '未知', '2018-07-16 16:27:04', '2018-08-15 16:27:04');
INSERT INTO `user_login` VALUES ('320f7a7ea51fc1f5ba694aa99a47a2b2', 6, '1c51151051bc01cfb304d936b99bde97', '192.168.31.182', '未知', '未知', '2018-07-06 15:22:18', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('32e217b0ba43356ab4560933eab35fce', 6, '07c2fbbb87dbf6a45f8a9caada09690e', '192.168.31.182', '未知', '未知', '2018-07-09 10:19:36', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('33589ca686846445922c733e45176bf5', 1, '6227c6ed4901f1f3cfbdb0b8f16ea5fc', '192.168.31.8', '未知', '未知', '2018-07-04 10:58:25', '2018-08-04 11:05:57');
INSERT INTO `user_login` VALUES ('33b647e4d24e2445f8d62cb37572b799', 6, '6beb0586104ef1b0cb8545d9d2a76064', '192.168.31.182', '未知', '未知', '2018-07-09 09:32:09', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('34268471470296b68e8b5e3fb87d40ee', 7, 'a3c6580ca50ec063c9e2e59d805b1c05', '192.168.31.187', '未知', '未知', '2018-07-17 15:57:17', '2018-08-16 15:57:17');
INSERT INTO `user_login` VALUES ('346561b909c481fec555500349e2f51d', 6, 'e2d79ec6306f3c9a14b20b36e55e1495', '192.168.31.182', '未知', '未知', '2018-07-09 09:43:25', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('354f2ee2a993cecd5bea6a209a1c758c', 7, 'e011762791fdb9edfeb8e579c3a1a020', '192.168.31.187', '未知', '未知', '2018-07-17 15:57:17', '2018-08-16 15:57:17');
INSERT INTO `user_login` VALUES ('359d36084e7b4a7b1ee2dea62379b429', 6, '2bd258b876a3e56818b1841a0fb778cc', '192.168.31.182', '未知', '未知', '2018-07-09 09:15:11', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('3600c3310aa70d2f00d15d5ec950c9ba', 1, 'ae1d45142ce3c4eeb40608ac389cd16f', '192.168.31.8', '未知', '未知', '2018-07-04 10:59:18', '2018-08-04 11:05:57');
INSERT INTO `user_login` VALUES ('365a5ba825998c0115be193f9bbbbc78', 6, 'c8043c910abbd0bdbfc41345b3e2b2a4', '192.168.31.182', '未知', '未知', '2018-07-09 09:29:31', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('36a010b70e18f6035ae865a3095f9f73', 7, 'f9ee23ea8e408c6cb3d02246118218d9', '192.168.31.187', '未知', '未知', '2018-07-17 15:57:17', '2018-08-16 15:57:17');
INSERT INTO `user_login` VALUES ('36fa824136353f4855627a55958df599', 6, '4561360a1abed0e71cfdc702aae647c5', '192.168.31.182', '未知', '未知', '2018-07-06 14:20:54', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('36fe6e9d1c4e943d193c6cdf1a238366', 6, 'f7f3064adf4c1b90401fb043555b06c6', '192.168.31.182', '未知', '未知', '2018-07-06 17:13:21', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('3a53f05605184363aafe7044a58f2371', 6, '554a0ba8b4268936039937ac566bf7a2', '192.168.31.182', '未知', '未知', '2018-07-06 14:32:28', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('3afaace44a45ca3d3e8c59cecd056c96', 6, 'df9dacef12d6a1929a27e10d4c847557', '192.168.31.182', '未知', '未知', '2018-07-06 15:37:13', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('3bf79362a34dbb47a65a0279aa32aa3e', 101, '04f36a57245413627df54647fbfe4ad0', '192.168.31.184', '未知', '未知', '2018-07-18 13:04:07', '2018-08-17 13:04:07');
INSERT INTO `user_login` VALUES ('3e82f153324e7cbd4608c380677660eb', 6, 'aaccb72bd00b0932a7610c65cb2b4b8f', '192.168.31.182', '未知', '未知', '2018-07-06 16:08:27', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('4177e776462258469ce7fee08e4f1c29', 6, 'ee07381ef8a8dd3216f755e1a4695495', '192.168.31.182', '未知', '未知', '2018-07-09 10:43:58', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('43d766f746bc0fc90c114cc16d669d51', 7, 'a1ab6106c89718be19218788c065e262', '192.168.31.187', '未知', '未知', '2018-07-17 15:57:17', '2018-08-16 15:57:17');
INSERT INTO `user_login` VALUES ('45e1fd3f059d3774a5d1dda4adf7bcd2', 7, '1ae0413c6e3e99e09964034b488f1f7a', '192.168.31.187', '未知', '未知', '2018-07-16 14:34:53', '2018-08-15 14:34:53');
INSERT INTO `user_login` VALUES ('49e9bad4a55126f40db59547687dc912', 6, '55089dfaae3087d308427c651adb98b0', '192.168.31.182', '未知', '未知', '2018-07-09 10:40:00', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('4b7caa04ad44bbb355d707107713de1e', 6, 'a87aaff501d665d3f7eadd4fa22f09e6', '192.168.31.135', '未知', '未知', '2018-07-05 16:11:58', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('4c3d36f97cfa5d85b57bb9855c21560c', 6, '0bcfbd194a5db12b6c481726d3496ba4', '192.168.31.182', '未知', '未知', '2018-07-06 15:32:38', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('4d21ca86e06510b40d048c91d1ffb0b2', 7, '13129efe5a120b5ecc74a3426ab544d8', '192.168.31.187', '未知', '未知', '2018-07-17 11:01:08', '2018-08-16 11:01:09');
INSERT INTO `user_login` VALUES ('4d8a0b4eb6bd85a2dd04d9981f196787', 6, '2952dbb4a5c1523871afb7a04a4029ef', '192.168.31.182', '未知', '未知', '2018-07-06 18:22:06', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('4ea7d95c9ab21b1f669df08381351a5b', 6, '94d22b08008f7744ff6c88e147171c78', '192.168.31.182', '未知', '未知', '2018-07-09 14:03:51', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('4f28b0532912c53fe78461e609fd1f02', 1, 'f20d6df72810007e2036cfd33bdb1002', '192.168.31.8', '未知', '未知', '2018-07-04 11:04:54', '2018-08-04 11:05:57');
INSERT INTO `user_login` VALUES ('4fc63b708dfe8425e9376d0d104fa5cd', 7, '98c5a19a3ac373838d73b3803a3d9e59', '192.168.31.187', '未知', '未知', '2018-07-17 15:57:17', '2018-08-16 15:57:17');
INSERT INTO `user_login` VALUES ('56951c750549551f090ad766bedab620', 6, 'a8d864502cf74919f2d0a0ab9b5977c0', '192.168.31.182', '未知', '未知', '2018-07-06 16:37:13', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('57eaed8e6ef098107f6732fb5cd4dc29', 7, 'b035fe76421b825e4a81e364f8aa1001', '192.168.31.187', '未知', '未知', '2018-07-17 15:57:17', '2018-08-16 15:57:17');
INSERT INTO `user_login` VALUES ('59a51b6cb53c0c0aa91033808db3bc23', 1, 'd32e65ae898604255aa69fac0b743bfe', '192.168.31.8', '未知', '未知', '2018-07-04 11:20:41', '2018-08-04 11:05:57');
INSERT INTO `user_login` VALUES ('59b58d1ac508ef9f2efcd40ad8da7b7a', 6, 'eb6c4450502cf052307e8378c234dc84', '192.168.31.182', '未知', '未知', '2018-07-06 15:19:03', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('59d307fae9f8e12f9f96aee7e1f4200a', 6, '4b0addf219fbc07ef0d463b5eedd0fac', '192.168.31.182', '未知', '未知', '2018-07-06 15:48:56', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('5a09fc9f9bdee2231eec5f26c29e29cc', 7, 'a2bd8ba6470eb6d36129f833bdbb3351', '192.168.31.187', '未知', '未知', '2018-07-17 10:52:17', '2018-08-16 10:52:17');
INSERT INTO `user_login` VALUES ('5b28ab4eda56e010e0a9d9cb402539d7', 6, '4540696a059022da821a93a8a17a1fb9', '192.168.31.182', '未知', '未知', '2018-07-09 09:45:41', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('5be8ff3b614d927bcc28ad8e1954ade8', 6, 'ea6774911acc3207cc35c1761704042e', '192.168.31.182', '未知', '未知', '2018-07-09 09:49:28', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('5dbf805577999a0fc1ce6dba0c6b3f65', 1, '55c3e064d7f9c0cfd8429570346788e8', '192.168.31.8', '未知', '未知', '2018-07-12 08:47:13', '2018-08-11 08:47:14');
INSERT INTO `user_login` VALUES ('5e3e16ff428c62bb80aaec2163213c80', 7, '580984939a241c8fdd488802f90b3f83', '192.168.31.184', '未知', '未知', '2018-07-17 10:30:51', '2018-08-16 10:30:51');
INSERT INTO `user_login` VALUES ('5e8a8b5cdde64fea1abc42d4220e37ea', 6, '939e14099fe37730cb6fe940d47f9739', '192.168.31.182', '未知', '未知', '2018-07-09 10:02:24', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('5f66f386d976a4454093ef125b1221bc', 7, '417ed68613cf4b87fbe2b290e2ac5b8b', '192.168.31.184', '未知', '未知', '2018-07-16 15:38:43', '2018-08-15 15:38:44');
INSERT INTO `user_login` VALUES ('614c299644b33adbc85699559f7d5fa9', 6, '2a601ac979cdd2d82facc15a3031a64a', '192.168.31.182', '未知', '未知', '2018-07-09 14:21:36', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('6310d100bbcd864f58416b99ffed9a39', 7, '0ec7fec97894a8054fb0f995f3a12ffc', '192.168.31.184', '未知', '未知', '2018-07-18 11:48:26', '2018-08-17 11:48:26');
INSERT INTO `user_login` VALUES ('63ed4fad6a2381530f7ad3de4d166fc3', 1, '20e2cfb631fb42a0202d2768246e03a7', '192.168.31.8', '未知', '未知', '2018-07-04 10:55:38', '2018-08-04 11:05:57');
INSERT INTO `user_login` VALUES ('64672a434df2879852ecac57ba305837', 6, 'b36e3414894d49af43dcd2c8da8e15f8', '192.168.31.182', '未知', '未知', '2018-07-09 14:20:20', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('652db00908c763696bd3e4eb12cd4fe9', 6, 'b8f9c11de25896a0f72e70a92e5ac1a5', '192.168.31.182', '未知', '未知', '2018-07-06 16:05:05', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('65e43cdc90353d0409e49cc99fac08d5', 6, '976a44aaff1a99376005be1f158791c8', '192.168.31.182', '未知', '未知', '2018-07-06 14:41:01', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('65f27bb80b9871e0140553a5d7866035', 6, '8097658fd55c141c171156e340441229', '192.168.31.182', '未知', '未知', '2018-07-09 10:28:17', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('6621d8eaaba259c283a19b364dea8e56', 7, '54e84c63ba24ed900d583687fe3b1c4e', '192.168.31.187', '未知', '未知', '2018-07-17 15:57:17', '2018-08-16 15:57:17');
INSERT INTO `user_login` VALUES ('6971c4ce793e134bb15718afbc1afb8a', 6, '2d32a3ca792c36cfe2972ff71396543c', '192.168.31.182', '未知', '未知', '2018-07-09 09:25:43', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('6a8deb2d2d3c076afbebba6fc9c21100', 6, '46e540391875366183df2c195972070f', '192.168.31.182', '未知', '未知', '2018-07-06 15:18:43', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('6b3958a34b455ab03250206bb279a768', 6, '2ad12d24bba00f7d9c1f1446685066a0', '192.168.31.182', '未知', '未知', '2018-07-09 11:08:27', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('6bb3237f81685d73450dc7ec4e579599', 6, '85a7efd0f2866c83065c3666f39b589c', '192.168.31.182', '未知', '未知', '2018-07-09 10:25:56', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('6c381173f8436a7fe902dcd37bd7e586', 1, '3586d55f671fa11b395bacd72cbbcd08', '192.168.31.8', '未知', '未知', '2018-07-09 14:22:15', '2018-08-08 14:22:15');
INSERT INTO `user_login` VALUES ('6c6c56d2f8e0686ada73641e38c15ab9', 6, '4ca52189f26d1fe7f0b68a02eb3b42bd', '192.168.31.182', '未知', '未知', '2018-07-09 09:28:03', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('6cdeead8380872d6ce866010e7f2db62', 7, '5826dea77961872db28d99c5b3dea6d3', '192.168.31.187', '未知', '未知', '2018-07-16 17:49:31', '2018-08-15 17:49:31');
INSERT INTO `user_login` VALUES ('6d7b76caa7a6e6bf76df63a1e63014c0', 7, '919edfbc7f73e676443cf99e4ce63463', '192.168.31.187', '未知', '未知', '2018-07-17 15:57:17', '2018-08-16 15:57:17');
INSERT INTO `user_login` VALUES ('6d84734c9534c7de1ae2c05416ef6347', 7, '889389e1d27e47abe08f7c49ea60d99b', '192.168.31.184', '未知', '未知', '2018-07-16 14:04:05', '2018-08-15 14:04:05');
INSERT INTO `user_login` VALUES ('6ebef71dfa0b9c0a5fa8c75e69999306', 6, 'a5879264cd66957572cc9a59a942c8c1', '192.168.31.182', '未知', '未知', '2018-07-09 12:03:21', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('6ef7020530e3427ed337d62f150ff5cb', 6, 'cb553f98e99fa0f3d33b3acd3b6769bb', '192.168.31.182', '未知', '未知', '2018-07-06 15:34:03', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('6f69f42bf9f92553c37d7663abd1ffe8', 6, 'cb520013377a04c0128c9efd7a0f1f98', '192.168.31.182', '未知', '未知', '2018-07-06 15:33:11', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('7029a9306d35da2718321c9626d76f05', 7, '4da6bb48276206c8f384de2fed34c05a', '192.168.31.187', '未知', '未知', '2018-07-17 15:57:17', '2018-08-16 15:57:17');
INSERT INTO `user_login` VALUES ('70bd003325442b5df8785e5eb73bb307', 6, '2d5bf5a4d7cdcd55d56a13887e60ecae', '192.168.31.182', '未知', '未知', '2018-07-06 18:12:42', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('713aa442a5ddc0418444a4bb249b8a5c', 7, 'e33c9f420232f6745708d3c90b862013', '192.168.31.187', '未知', '未知', '2018-07-17 15:57:17', '2018-08-16 15:57:17');
INSERT INTO `user_login` VALUES ('72e85934d70031fcac51b57768e0a38a', 6, '85154c8233f12386b3c732123660ac84', '192.168.31.182', '未知', '未知', '2018-07-06 16:01:48', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('73478fcab1b341d0b0c3c3a37937972c', 7, '19207b3eb30839994f61bdbf58d8a489', '192.168.31.187', '未知', '未知', '2018-07-17 17:59:36', '2018-08-16 17:59:36');
INSERT INTO `user_login` VALUES ('73f577dd14a739a1ab47a334dd18f1fb', 6, 'a1499e16aefd8a33b585ac6276957058', '192.168.31.182', '未知', '未知', '2018-07-06 15:59:39', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('7486e490225e0d92c5f1fb0ad888fe69', 6, '9f596434879141e508f1e1e1c5ee6b10', '192.168.31.182', '未知', '未知', '2018-07-09 10:21:10', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('74b8b03945867950efac63c61014efdf', 7, '34debce4c9f8096f46ea00eda2358abc', '192.168.31.184', '未知', '未知', '2018-07-16 15:37:51', '2018-08-15 15:37:52');
INSERT INTO `user_login` VALUES ('7588bcaa200cd6c0238e86f6221bff0a', 6, '55f365a7e5bedcc24dc5dab7a0cddb02', '192.168.31.182', '未知', '未知', '2018-07-06 18:32:19', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('776408e4ad6028d497efd393af8260a9', 6, 'd185442309ab4f824b4ce9df0e34a68f', '192.168.31.182', '未知', '未知', '2018-07-06 16:06:12', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('776d2b9eb118a43a65c035e10fdfd457', 7, 'c08037dce8acbb368ff98fcf7aae51cd', '192.168.31.187', '未知', '未知', '2018-07-17 11:01:08', '2018-08-16 11:01:08');
INSERT INTO `user_login` VALUES ('79734fe003a113631bf9e364c94b4a4f', 6, 'b74e01910fbf382f7c287a52d6d15559', '192.168.31.182', '未知', '未知', '2018-07-06 15:52:47', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('7cb5c801622dc722353d3182663e29d6', 6, '797f5674550a135196b2d398d1ce959c', '192.168.31.182', '未知', '未知', '2018-07-09 09:13:18', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('7ee2944e4cf7d659244cc5dbee3d7fa7', 6, 'c000c4dc37b2f45087db59adeeb9646f', '192.168.31.182', '未知', '未知', '2018-07-06 14:46:51', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('8261802f9aacca0f4268c804272aa461', 6, 'faa59c92d6f0f6bf306efc97b6765ca9', '192.168.31.182', '未知', '未知', '2018-07-09 11:18:17', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('839550cdbbac984647984326d63d14f5', 6, 'be8724bf9df8fcc12f6cd96f529a98fb', '192.168.31.182', '未知', '未知', '2018-07-09 11:35:07', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('83c83266945e5cbb4455fa46660596b3', 6, 'd59ef1735c5f5e172bf2ab4ac33008fa', '192.168.31.182', '未知', '未知', '2018-07-06 15:30:12', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('83e93d8039422f9bbee4f5c807aab8e7', 7, '0bbacbf4a596c9a88130e208139179f8', '192.168.31.184', '未知', '未知', '2018-07-16 15:37:40', '2018-08-15 15:37:41');
INSERT INTO `user_login` VALUES ('843a6aa3cb3081ea9e9f31805aac22cb', 7, 'bbbb3a6c00407a32e5e899e9e47c610f', '192.168.31.184', '未知', '未知', '2018-07-13 11:21:19', '2018-08-12 11:21:20');
INSERT INTO `user_login` VALUES ('85688d5c6cca1ffddb997fc69c67f670', 7, 'd2a0db9ca9531cf22e19e981caffd747', '192.168.31.187', '未知', '未知', '2018-07-17 11:01:08', '2018-08-16 11:01:09');
INSERT INTO `user_login` VALUES ('85c7eaff1f4307c5510739ccebd20de4', 6, '6f30b8da23c208a001556de1e1e4be78', '192.168.31.182', '未知', '未知', '2018-07-09 09:40:23', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('85d877e559161967f042b484ad3e0443', 1, 'ee77cbf12f512683b20ebdab7d8c9a17', '192.168.31.8', '未知', '未知', '2018-07-04 11:05:57', '2018-08-04 11:05:57');
INSERT INTO `user_login` VALUES ('86adc7b94cb787d056bcd7282eb87d5d', 6, 'c924ee6c7efb18ff815d487cd8062437', '192.168.31.182', '未知', '未知', '2018-07-06 17:17:03', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('8ade62c9d15da41c9924d67317c662fa', 6, 'b33f7d426930c1fd24bdeca57266ffe2', '192.168.31.182', '未知', '未知', '2018-07-06 16:52:34', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('8b8edcca30cf3d8781730a9063d9c61b', 6, '9b6bb9c08049a1ed285f65ab9d5a1248', '192.168.31.182', '未知', '未知', '2018-07-06 15:34:20', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('8c305d9096f9aff8614d74bbca39bc1b', 7, 'e56b5b35df992831c96b57e2e89972fc', '192.168.31.184', '未知', '未知', '2018-07-17 15:57:17', '2018-08-16 15:57:17');
INSERT INTO `user_login` VALUES ('8cfecae8606b917166702e8ca8c85f75', 6, '399491d7a4532933b40c5f4c29bf66a7', '192.168.31.182', '未知', '未知', '2018-07-09 11:22:44', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('90cda02e486f5d7940db7eabd391e8ee', 6, 'c873f349035fadfc756681d8e1ae241f', '192.168.31.182', '未知', '未知', '2018-07-06 13:11:27', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('914252ac877efbd0aa95163374d199a8', 6, 'b884b117ee3b1724dd0230bd92ce5803', '192.168.31.182', '未知', '未知', '2018-07-06 16:21:26', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('92156c6453094f6623a907822470406e', 6, '51cf7f7223580ff6df401d72d63e9051', '192.168.31.182', '未知', '未知', '2018-07-09 09:57:20', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('92b5859d887755a8b179c2a147b6c84c', 6, 'f38404b775a8af317ac55f67ff9cbc16', '192.168.31.182', '未知', '未知', '2018-07-09 10:29:25', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('939ca0e65e924b4d0b55a5654af58aaf', 6, '2d58da42af16b7c890b34f97ad55d089', '192.168.31.182', '未知', '未知', '2018-07-09 14:23:59', '2018-08-08 14:24:00');
INSERT INTO `user_login` VALUES ('93a45d0340ebd84e3459304d326a28ac', 6, '0860c81225dcb21dd5a6f00b6420a282', '192.168.31.182', '未知', '未知', '2018-07-09 10:05:20', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('93af71f72bfada97d56fba7e584d1833', 6, 'cbc908d9f67b89233d681239d3dff782', '192.168.31.182', '未知', '未知', '2018-07-09 10:33:41', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('93d072f77f3fe5ce49da6f8ea556151e', 6, '82b5f29b81bafc74118fdec417ce2336', '192.168.31.182', '未知', '未知', '2018-07-06 16:09:09', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('9453174fab859ab56675ef2225544d66', 7, '9f9e40ec855c62c8dc73f804a2f345c2', '192.168.31.184', '未知', '未知', '2018-07-17 15:57:17', '2018-08-16 15:57:17');
INSERT INTO `user_login` VALUES ('9596f5dcefb3367ccbafbb2bf15f9c9b', 1, 'a18004d28f40f32f9969bef7b8221397', '192.168.31.8', '未知', '未知', '2018-07-04 11:00:02', '2018-08-04 11:05:57');
INSERT INTO `user_login` VALUES ('963f476b96819a5b6a3363910c3e1211', 6, '0e5841e2892fe9ef9587fe9f4de0a83d', '192.168.31.182', '未知', '未知', '2018-07-06 16:35:38', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('965a0f8d3dfabc70a452763d789b4d99', 6, '7b10646b87a40e0a0c59d654c33aecf8', '192.168.31.135', '未知', '未知', '2018-07-05 15:39:20', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('987fb786fb47f956bb476109a1433fe5', 6, '8f206534daeba4247cc77249838b8a17', '192.168.31.182', '未知', '未知', '2018-07-06 16:03:59', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('9a54549c5a2faeb59a80111c409c5406', 6, 'ca70e92368c49c2ddb0b689004fd1f39', '192.168.31.182', '未知', '未知', '2018-07-06 15:54:11', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('9b848e5059e7d3cc5498a7a9b8f3e3d6', 6, 'ffa92206c925e2d9a596e5c40baf0383', '192.168.31.135', '未知', '未知', '2018-07-05 15:34:03', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('9be1de4dc3b08fef8c70158c9b855b88', 6, '1ff4f6642ac20e4b572043b803638ff5', '192.168.31.135', '未知', '未知', '2018-07-05 15:10:54', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('9c513bf5e173d0555c4cad03e50a27c1', 6, '216490ba5a2e3747aee28334054073b1', '192.168.31.182', '未知', '未知', '2018-07-06 15:43:57', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('9cc2967b1b1b976cf35cd9d6367c8f39', 6, 'd557037ed4159b90656247c9aa9657fd', '192.168.31.182', '未知', '未知', '2018-07-09 10:38:40', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('9ce3a295cfbe3b285a012dcd2729db91', 6, 'db05e2e1141f5a322ec0ea0477f009cb', '192.168.31.182', '未知', '未知', '2018-07-06 16:08:48', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('9dc1b56b5affbed615c28e2e59a51d3f', 6, '132147491652cebd0a8621c64666b794', '192.168.31.182', '未知', '未知', '2018-07-09 10:07:57', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('9e326ed0dc34f35bab735be235563c43', 6, 'af24198cab509530d65b7482ca64c60d', '192.168.31.135', '未知', '未知', '2018-07-05 15:42:18', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('9e45fe7b637baf68295ea705fed6f41f', 6, 'f242d725158111b95cc174fce99ee853', '192.168.31.182', '未知', '未知', '2018-07-09 10:51:32', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('9e52b91e60e5c652e85b72312ba634de', 6, '11f1f70e565ca19466a4d1d92f25a488', '192.168.31.182', '未知', '未知', '2018-07-06 17:04:44', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('a038907691a06666f57aad3cbe2073dd', 6, '57ecb5ebe73a48d462ecea1895178ae4', '192.168.31.182', '未知', '未知', '2018-07-09 10:14:27', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('a22cc37664917f0afc2b8a65fcd1d323', 7, '0e616c76730455b52f710b17c8f725c3', '192.168.31.187', '未知', '未知', '2018-07-17 11:01:08', '2018-08-16 11:01:08');
INSERT INTO `user_login` VALUES ('a278d32070f2d745611be0106901d311', 6, 'c723dd940cc21dd3f9376e2487c584e0', '192.168.31.182', '未知', '未知', '2018-07-06 18:19:05', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('a384ba5cdc00783d13d518daab193035', 6, '27d597973801e48519f47463c7bd1285', '192.168.31.182', '未知', '未知', '2018-07-06 14:56:44', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('a45a4076d96e6d840a44bc877161ab86', 6, '20f67fedc7b7584b1147047b78b8de26', '192.168.31.182', '未知', '未知', '2018-07-06 15:27:27', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('a4642fc1d2b76cfb5e3c101a5a76e95f', 6, 'ec17cbf3073e79f1af0ecb7f124eebe0', '192.168.31.182', '未知', '未知', '2018-07-06 14:54:02', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('a6136a53bca2c512205915584568f219', 7, 'c57f2cd78096eddbac7b6fe2c8fbb396', '192.168.31.187', '未知', '未知', '2018-07-17 11:01:08', '2018-08-16 11:01:08');
INSERT INTO `user_login` VALUES ('a6fc927fe41198fab1d32717e8adf457', 6, '0841000b5fcc01157162e7029b4562f4', '192.168.31.182', '未知', '未知', '2018-07-09 10:12:52', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('a707a2546f336e5dffeb165233536a19', 6, '1f2837c39d6298ea6181ce9440cfcb85', '192.168.31.182', '未知', '未知', '2018-07-06 15:51:46', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('a80a50d2f076b3814137b2eb34397f92', 6, 'bcc62afa3f8d9489e8b110ec6ad635ca', '192.168.31.182', '未知', '未知', '2018-07-06 15:39:04', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('aa23ee9f93b77846bd87c84a2a89c574', 6, 'ad936a73c9632bd7cc6093bea6f16307', '192.168.31.182', '未知', '未知', '2018-07-09 09:51:28', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('abb3c0f95ca0c5f8e40157cfc0f7df1b', 6, '8c60e32307a2f8b590c727b7e5c26c38', '192.168.31.182', '未知', '未知', '2018-07-06 14:44:19', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('acf760e2677f60031995fdbe4d212660', 7, '931ebb961965de97296233c891f5405e', '192.168.31.184', '未知', '未知', '2018-07-11 10:51:37', '2018-08-10 10:51:37');
INSERT INTO `user_login` VALUES ('ad513c2840c851e3453213f63e42e05b', 7, 'fc5c0d98b4d026ddb5e43eecfe977ca1', '192.168.31.184', '未知', '未知', '2018-07-17 18:36:08', '2018-08-16 18:36:08');
INSERT INTO `user_login` VALUES ('ae95fdac16a5d39c1a2bd5557f565470', 7, '8706429c37c4fd8dc46aa8bc5751dbee', '192.168.31.184', '未知', '未知', '2018-07-17 11:19:15', '2018-08-16 11:19:15');
INSERT INTO `user_login` VALUES ('aebd441d43fae5e5775dabf60c6940db', 6, 'dca214c93c6204e0704f65ab5a2a9630', '192.168.31.135', '未知', '未知', '2018-07-05 15:16:53', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('aec9e97ec203a2df1d519a9421f9fee2', 7, 'a22f6b220dd5a9ef42399179b6fe8f7c', '192.168.31.184', '未知', '未知', '2018-07-16 15:38:05', '2018-08-15 15:38:05');
INSERT INTO `user_login` VALUES ('af33883ba2915e473dab43e903f9fa8d', 6, 'b592c21827b4f85842c533ac4fe61311', '192.168.31.182', '未知', '未知', '2018-07-06 17:08:42', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('af5556df75c7a5a14a6aeaa4429d3803', 1, 'b128312f36f69d3131a56e3df213adac', '192.168.31.8', '未知', '未知', '2018-07-04 11:01:43', '2018-08-04 11:05:57');
INSERT INTO `user_login` VALUES ('af7b9e6054744620cbfcc9846862b083', 7, 'cfc407e0781566026a4d011ea6ad4543', '192.168.31.184', '未知', '未知', '2018-07-17 11:08:15', '2018-08-16 11:08:15');
INSERT INTO `user_login` VALUES ('af848728dee3752818d18830e7622c87', 6, '73f730fc2390e8b8d1dda4c75550c7c2', '192.168.31.182', '未知', '未知', '2018-07-09 11:38:27', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('afc88f43bc7e089f6f14f9f40b17f119', 6, '7c94c04b88e37cafb6d9e74d8601725c', '192.168.31.182', '未知', '未知', '2018-07-09 10:18:54', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('b08e1e8b07dc2348cbf6fb92739586c4', 6, '1d5d041229635363fdc30b9d96deea05', '192.168.31.182', '未知', '未知', '2018-07-06 14:57:31', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('b2917beeb2ffaf7ecf5ba7a32ff8ec68', 6, '9edc2113679d7e87c870a34a69e6445d', '192.168.31.182', '未知', '未知', '2018-07-09 10:38:00', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('b5ff9cea56a652d260c1e43c066afd80', 6, '2e3d97c7b6e123081afa938cd7e9414d', '192.168.31.182', '未知', '未知', '2018-07-09 11:34:00', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('b82afe61b30813216b9d0165776df489', 6, '75745dcb221ca703bdc3779eac4bb03f', '192.168.31.182', '未知', '未知', '2018-07-10 09:54:28', '2018-08-09 09:54:29');
INSERT INTO `user_login` VALUES ('babb83d297cc8ac2ea37e99d17a42b4e', 6, '7aa8fdfeebc9ac9be6a108e06a7acab3', '192.168.31.182', '未知', '未知', '2018-07-06 18:16:05', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('bd4de504252e7af52f060bf873d3a514', 7, 'a4e2554900a1d3f97467e4616480f882', '192.168.31.184', '未知', '未知', '2018-07-12 08:35:23', '2018-08-11 08:35:24');
INSERT INTO `user_login` VALUES ('be8373da21924e764da5f65d8e261485', 6, '2b29b827c4a418ea8248d338f76dbbc3', '192.168.31.182', '未知', '未知', '2018-07-06 14:11:09', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('c06f8d169587ef0d2d4547f26e6fa769', 7, 'c65e506f160da301933f7ce9e7a8ad5f', '192.168.31.184', '未知', '未知', '2018-07-11 08:54:24', '2018-08-10 08:54:25');
INSERT INTO `user_login` VALUES ('c0d199c23d5f812f150df838f1a54b88', 6, 'b484740d152507f0f14a52af3746ed5e', '192.168.31.182', '未知', '未知', '2018-07-09 09:54:56', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('c126b3685096cec995d0b364ecf1a518', 6, '11c4c9facc3a56c783fc509dee01f5da', '192.168.31.182', '未知', '未知', '2018-07-06 14:39:56', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('c4380ef197c18d7c3709369d96bd49bf', 7, '1bcf4c311e9fcce11353175b024e803f', '192.168.31.184', '未知', '未知', '2018-07-18 08:44:26', '2018-08-17 08:44:26');
INSERT INTO `user_login` VALUES ('c44829c712f2256ba21d1c875fb3d22a', 6, 'eb269ef2a6f99a5cd073e3773e3cf858', '192.168.31.182', '未知', '未知', '2018-07-09 09:19:52', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('c6025560d22b985d95ff6884abce1c54', 6, '00eb0c90b227e23c9b16b15dd317f7cc', '192.168.31.135', '未知', '未知', '2018-07-05 14:54:13', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('c63eea2b7086df19829ca4eb4ce0db97', 6, '6d22801a5c93919184d2951afdfcfed9', '192.168.31.182', '未知', '未知', '2018-07-09 09:43:11', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('c7fa2ff0b0481f3297069c9fee44fe9b', 6, '500541615792840c7e542031ee643832', '192.168.31.135', '未知', '未知', '2018-07-05 15:40:15', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('c8a3faa2ab20bff2917e6e190036fa0b', 6, 'bb5336e17045688ae6a5a893a7d5f10d', '192.168.31.182', '未知', '未知', '2018-07-09 14:07:24', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('cb81bd895de6bad9317b7e4f6346099e', 6, '9fc92b23e031f0ba989960a81b70c0f2', '192.168.31.182', '未知', '未知', '2018-07-09 11:27:32', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('cbb4d6256ae376dd644722a84f2b2745', 6, '22976f87490c644045652575f6c33abf', '192.168.31.182', '未知', '未知', '2018-07-06 14:47:56', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('cc48b6cd2c5b00568a6a98a9990334c1', 6, '2062f0c27fcfaa63f85dd2c6a3896c66', '192.168.31.182', '未知', '未知', '2018-07-06 14:03:33', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('cd63933d00a3160721183fedcf69bacd', 1, '7fc6196db8dd5e0d385fb6bb58636e8d', '192.168.31.8', '未知', '未知', '2018-07-04 10:59:50', '2018-08-04 11:05:57');
INSERT INTO `user_login` VALUES ('cd6e7d25a2b3f0aaf5ad72f39afc90f4', 7, '1ce1ece4799c260921e6f0ab28689a15', '192.168.31.200', '未知', '未知', '2018-07-17 10:34:55', '2018-08-16 10:34:56');
INSERT INTO `user_login` VALUES ('ce2dec225953f289a8b1b829fdcefb69', 7, '20ac2e603e6f48a0d2215407a1d6f3aa', '192.168.31.184', '未知', '未知', '2018-07-16 09:34:04', '2018-08-15 09:34:04');
INSERT INTO `user_login` VALUES ('ce2fb8b501f01f28eeabba0d2c67dc49', 1, '14406c428f0b15b8c1965975af76ca64', '192.168.31.8', '未知', '未知', '2018-07-23 20:13:30', '2018-08-22 20:13:31');
INSERT INTO `user_login` VALUES ('cf2a0d1b6762fc4729153f6881c6621f', 6, '893ab5199f57669cc32b148edde166d6', '192.168.31.135', '未知', '未知', '2018-07-05 14:42:54', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('d100efc71304270bd4fd30283c2e9a00', 6, 'ab474b75127cafcf5b9ef76726e6c525', '192.168.31.182', '未知', '未知', '2018-07-06 16:30:48', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('d1064313f07cb9ff6c763cd111bfb575', 7, '56b1d18a8bff1bda372f2afd0c8a62aa', '192.168.31.184', '未知', '未知', '2018-07-17 08:32:41', '2018-08-16 08:32:41');
INSERT INTO `user_login` VALUES ('d21026250d5ea909be9530039be9715d', 6, 'b5df874aed08025376d7df3d853ccb45', '192.168.31.182', '未知', '未知', '2018-07-06 15:34:44', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('d24319b381a31902f4b85eff3c1a490d', 39, 'f606e4ba9ca9802691cdf250a3793e88', '192.168.31.10', '未知', '未知', '2018-07-17 18:01:13', '2018-08-16 18:01:14');
INSERT INTO `user_login` VALUES ('d38458bd29e9ce3c2a74d706f9454663', 7, '5061dd871d8f26359445124df80dba2d', '192.168.31.187', '未知', '未知', '2018-07-17 15:57:17', '2018-08-16 15:57:17');
INSERT INTO `user_login` VALUES ('d467a6e6bcfb86890c68be24440999d0', 6, '38125a4655ea40802e69fc1bde7837f6', '192.168.31.182', '未知', '未知', '2018-07-06 17:23:03', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('d4c8d0b6be72913063c159ddf1116ee6', 6, '862c59bf3633d397b8c1c2d5c0824cf2', '192.168.31.182', '未知', '未知', '2018-07-06 17:53:59', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('d4e0d0aa4201df9d875610300ac445c0', 6, 'd06a5976742b7cede3aa6530c6ffb865', '192.168.31.182', '未知', '未知', '2018-07-09 10:42:51', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('d505757ed595604a01e49c9c74188575', 7, '005a2b24643a09be87ae3ce4b7b0302b', '192.168.31.200', '未知', '未知', '2018-07-16 18:23:03', '2018-08-15 18:23:03');
INSERT INTO `user_login` VALUES ('d70da25e41a8c248a21eb566fdf981be', 6, '41fd5dbd24ff708ab4a0b7b3fee2c3b2', '192.168.31.135', '未知', '未知', '2018-07-05 15:43:23', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('d7f52ba0d788a409371307ff559dc934', 6, 'bca43e7beb3cbe43f47205d54d745085', '192.168.31.182', '未知', '未知', '2018-07-06 14:12:04', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('da36211abdf2aca8873c5c23510b3bc1', 6, '52fb330c69d8582c019f1d2828889d29', '192.168.31.182', '未知', '未知', '2018-07-06 16:49:53', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('e09575ebb87e8589a5bbd891055437a5', 6, '797efda3e2500d38714b47ba65c2e6f2', '192.168.31.182', '未知', '未知', '2018-07-09 10:26:26', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('e2a508c2dc2289c9d0c314cfdd897238', 6, '86701182cd068bbbf8451d6d06de5a53', '192.168.31.182', '未知', '未知', '2018-07-06 16:02:49', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('e3f6765951a5deb8152fa167f7776278', 1, 'b97874b2919b387bb8e807c3b28a6dd6', '192.168.31.8', '未知', '未知', '2018-07-24 21:27:00', '2018-08-23 21:27:01');
INSERT INTO `user_login` VALUES ('e71e2436e501c7974bf1c54108a9bed5', 6, 'ce7ec07cdaf94cd6648fd60ad4792d2c', '192.168.31.182', '未知', '未知', '2018-07-09 11:17:21', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('eb9ac244b6a81545087ee2cc07c0b939', 7, '0b75c7c99add0ffc7bc8af59d14b9fe3', '192.168.31.184', '未知', '未知', '2018-07-13 09:26:23', '2018-08-12 09:26:23');
INSERT INTO `user_login` VALUES ('ebe11e4251ced417e68754591e5ce578', 6, '6ed42d16268a80bcf3ee3839e67465f1', '192.168.31.135', '未知', '未知', '2018-07-05 15:49:00', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('ed1cf27ba5f94650340b7ee3caa68bfa', 7, 'dfba30aafbed6561080d077b6bea305c', '192.168.31.187', '未知', '未知', '2018-07-17 11:01:08', '2018-08-16 11:01:08');
INSERT INTO `user_login` VALUES ('ed30be43f50d84ac37e6dad04eaa49e7', 6, '6e339737f68ef8d36687e70577266817', '192.168.31.182', '未知', '未知', '2018-07-06 15:38:01', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('edbea0eb7baed257270c68a84ed49e60', 6, '7c59f78b74eab1bbf3ef4b24214f474b', '192.168.31.182', '未知', '未知', '2018-07-06 14:36:30', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('efc94529dd6599750b34f387c77d9595', 6, '79bf5cd364651e21327c46e5d703ecda', '192.168.31.182', '未知', '未知', '2018-07-06 14:33:50', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('efee46a43f7eabcdeb0ad6087f2c5631', 7, 'e5c2fac734032c165c062fc6024a5322', '192.168.31.187', '未知', '未知', '2018-07-17 15:57:17', '2018-08-16 15:57:17');
INSERT INTO `user_login` VALUES ('f13ecef9095c78e73118b4addd5a954b', 6, '09d85975a5bf4c539e015d3bd1125c48', '192.168.31.182', '未知', '未知', '2018-07-09 10:23:39', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('f5ccc60b1981cff41964707b45c7d545', 6, 'b46cfe78e64c5ec896ba037f7aa81dcc', '192.168.31.182', '未知', '未知', '2018-07-06 15:57:41', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('f6851fab9aa67bb64a61ae7466e32c7f', 6, '618b5b1c399aa45a1430ad4eb5a3e252', '192.168.31.182', '未知', '未知', '2018-07-06 15:11:54', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('f915b9b4ddd015aaa081c28aa2c7e975', 6, 'c371b935937d3f1e9f727895bb541bef', '192.168.31.182', '未知', '未知', '2018-07-06 17:16:05', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('f98da497224a0ae6dcceb0551ca9aa65', 1, '7f37ce4dd32787cd88971fd957bb9d3e', '192.168.31.8', '未知', '未知', '2018-07-17 17:55:47', '2018-08-16 17:55:47');
INSERT INTO `user_login` VALUES ('f9ef97804bca6f7f7e9754229f3f0ccb', 7, '11871713a9c57c37f85d85982c0c0366', '192.168.31.184', '未知', '未知', '2018-07-16 15:38:06', '2018-08-15 15:38:06');
INSERT INTO `user_login` VALUES ('fa90006229becaa289fbc8c77facbb6f', 1, 'c0ac9a8b8bf933a46c2d57fdc16b9865', '192.168.31.8', '未知', '未知', '2018-07-23 20:16:52', '2018-08-22 20:16:53');
INSERT INTO `user_login` VALUES ('faa4792701c1033383bef15170bf9981', 6, '3e21a13c5d05fceeb60b16d7801eaa09', '192.168.31.182', '未知', '未知', '2018-07-09 10:32:55', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('fbddda4a7a4fb7e47a922372bb3c5c96', 6, '5fe787c175e7488446d6a96ad9afec75', '192.168.31.182', '未知', '未知', '2018-07-06 15:56:38', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('fc1377b02307375e6a730be7af4bdf70', 7, 'cbe8530c0437e04471109aecd8ee1ab8', '192.168.31.187', '未知', '未知', '2018-07-16 11:28:54', '2018-08-15 11:28:54');
INSERT INTO `user_login` VALUES ('fcd20face288d108c9065cf50e628cd7', 6, '7d5909e8ade9db4b86a60ea81be7ae01', '192.168.31.182', '未知', '未知', '2018-07-06 14:46:28', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('fe275021a7eaf3be2c8b560fd0756cce', 6, '06173b6baa96bb0a6af79f9a775ed920', '192.168.31.182', '未知', '未知', '2018-07-09 10:24:55', '1970-01-01 08:00:00');
INSERT INTO `user_login` VALUES ('fee3dc5ca3682652418eb8767fe2c0cb', 6, '404de288d2ebff31b4ce41614080d9d6', '192.168.31.182', '未知', '未知', '2018-07-06 14:03:45', '1970-01-01 08:00:00');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
