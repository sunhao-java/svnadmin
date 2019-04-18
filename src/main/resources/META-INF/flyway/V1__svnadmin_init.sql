/*
 Navicat Premium Data Transfer

 Source Server         : docker-10.20.2.152
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 10.20.2.152:3306
 Source Schema         : svnadmin

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 18/04/2019 13:09:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for i18n
-- ----------------------------
DROP TABLE IF EXISTS `i18n`;
CREATE TABLE `i18n`
(
    `lang` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `id`   varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `lbl`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    PRIMARY KEY (`lang`, `id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of i18n
-- ----------------------------
INSERT INTO `i18n`
VALUES ('en', 'en', 'English');
INSERT INTO `i18n`
VALUES ('en', 'i18n.add.title', 'Add Language');
INSERT INTO `i18n`
VALUES ('en', 'i18n.current', 'Current Language');
INSERT INTO `i18n`
VALUES ('en', 'i18n.error.lang', '[Language] cannot be empty');
INSERT INTO `i18n`
VALUES ('en', 'i18n.error.lbl', '[Label] cannot be empty');
INSERT INTO `i18n`
VALUES ('en', 'i18n.id', 'Key');
INSERT INTO `i18n`
VALUES ('en', 'i18n.lang', 'Language');
INSERT INTO `i18n`
VALUES ('en', 'i18n.lbl', 'Label');
INSERT INTO `i18n`
VALUES ('en', 'i18n.op.addlang', 'Add Language');
INSERT INTO `i18n`
VALUES ('en', 'i18n.op.export', 'Export Language');
INSERT INTO `i18n`
VALUES ('en', 'i18n.op.submit', 'Submit');
INSERT INTO `i18n`
VALUES ('en', 'i18n.title', 'Language');
INSERT INTO `i18n`
VALUES ('en', 'login.btn.login', 'Login');
INSERT INTO `i18n`
VALUES ('en', 'login.info.setadmin', 'Welcome to SVN ADMIN,please set the administrator accout and password.');
INSERT INTO `i18n`
VALUES ('en', 'login.title', 'SVN ADMIN Login');
INSERT INTO `i18n`
VALUES ('en', 'main.link.i18n', 'Language');
INSERT INTO `i18n`
VALUES ('en', 'main.link.logout', 'Logout');
INSERT INTO `i18n`
VALUES ('en', 'main.link.pj', 'Project');
INSERT INTO `i18n`
VALUES ('en', 'main.link.user', 'User');
INSERT INTO `i18n`
VALUES ('en', 'main.title', 'SVN ADMIN');
INSERT INTO `i18n`
VALUES ('en', 'pj.btn.submit', 'Submit');
INSERT INTO `i18n`
VALUES ('en', 'pj.des', 'Desciption');
INSERT INTO `i18n`
VALUES ('en', 'pj.error.path', '[Path] cannot be empty');
INSERT INTO `i18n`
VALUES ('en', 'pj.error.pj', '[Project] cannot be empty');
INSERT INTO `i18n`
VALUES ('en', 'pj.error.url', '[URL] cannot be empty');
INSERT INTO `i18n`
VALUES ('en', 'pj.op.delete', 'Delete');
INSERT INTO `i18n`
VALUES ('en', 'pj.op.delete.confirm', 'Are you sure to delete?');
INSERT INTO `i18n`
VALUES ('en', 'pj.op.setauth', 'Authorization');
INSERT INTO `i18n`
VALUES ('en', 'pj.op.setgr', 'Group');
INSERT INTO `i18n`
VALUES ('en', 'pj.op.setuser', 'User');
INSERT INTO `i18n`
VALUES ('en', 'pj.path', 'Path');
INSERT INTO `i18n`
VALUES ('en', 'pj.pj', 'Project');
INSERT INTO `i18n`
VALUES ('en', 'pj.title', 'Project');
INSERT INTO `i18n`
VALUES ('en', 'pj.type', 'Type');
INSERT INTO `i18n`
VALUES ('en', 'pj.type.http', 'http');
INSERT INTO `i18n`
VALUES ('en', 'pj.type.http.mutil', 'http(mutil)');
INSERT INTO `i18n`
VALUES ('en', 'pj.type.svn', 'svn');
INSERT INTO `i18n`
VALUES ('en', 'pj.url', 'URL');
INSERT INTO `i18n`
VALUES ('en', 'pjauth.btn.submit', 'Save');
INSERT INTO `i18n`
VALUES ('en', 'pjauth.error.grusr', 'Please select Group or User');
INSERT INTO `i18n`
VALUES ('en', 'pjauth.error.pj', '[Project] cannot be empty');
INSERT INTO `i18n`
VALUES ('en', 'pjauth.error.res', '[Resource] can not be empy');
INSERT INTO `i18n`
VALUES ('en', 'pjauth.op.delete', 'Delete');
INSERT INTO `i18n`
VALUES ('en', 'pjauth.op.delete.confirm', 'Are you sure to delete?');
INSERT INTO `i18n`
VALUES ('en', 'pjauth.res', 'Resource');
INSERT INTO `i18n`
VALUES ('en', 'pjauth.res.select', 'Please select resource');
INSERT INTO `i18n`
VALUES ('en', 'pjauth.rw', 'Access');
INSERT INTO `i18n`
VALUES ('en', 'pjauth.rw.none', 'none');
INSERT INTO `i18n`
VALUES ('en', 'pjauth.rw.r', 'Read');
INSERT INTO `i18n`
VALUES ('en', 'pjauth.rw.rw', 'Read-write');
INSERT INTO `i18n`
VALUES ('en', 'pjauth.title', 'Authorization');
INSERT INTO `i18n`
VALUES ('en', 'pjgr.btn.submit', 'Submit');
INSERT INTO `i18n`
VALUES ('en', 'pjgr.error.gr', '[Group] cannot be empty');
INSERT INTO `i18n`
VALUES ('en', 'pjgr.error.pj', '[Project] cannot be empty');
INSERT INTO `i18n`
VALUES ('en', 'pjgr.op.delete', 'Delete');
INSERT INTO `i18n`
VALUES ('en', 'pjgr.op.delete.confirm', 'Are you sure to delete?');
INSERT INTO `i18n`
VALUES ('en', 'pjgr.op.setuser', 'User');
INSERT INTO `i18n`
VALUES ('en', 'pjgr.title', 'Groups');
INSERT INTO `i18n`
VALUES ('en', 'pjgrusr.error.usr', '[User] cannot be empty');
INSERT INTO `i18n`
VALUES ('en', 'pjgrusr.op.delete', 'Delete');
INSERT INTO `i18n`
VALUES ('en', 'pjgrusr.op.delete.confirm', 'Are you sure to delete?');
INSERT INTO `i18n`
VALUES ('en', 'pjgrusr.op.submit', 'Add User');
INSERT INTO `i18n`
VALUES ('en', 'pjgrusr.title', 'Group User');
INSERT INTO `i18n`
VALUES ('en', 'pjusr.error.pj', '[Project] cannot be empty');
INSERT INTO `i18n`
VALUES ('en', 'pjusr.error.psw', '[Password] cannot be empty');
INSERT INTO `i18n`
VALUES ('en', 'pjusr.error.usr', '[User] cannot be empty');
INSERT INTO `i18n`
VALUES ('en', 'pjusr.info', '(Notice:Project user setting only effect this project)');
INSERT INTO `i18n`
VALUES ('en', 'pjusr.op.delete', 'Delete');
INSERT INTO `i18n`
VALUES ('en', 'pjusr.op.submit', 'Submit');
INSERT INTO `i18n`
VALUES ('en', 'pjusr.psw.psw', 'Password');
INSERT INTO `i18n`
VALUES ('en', 'pjusr.title', 'Project User');
INSERT INTO `i18n`
VALUES ('en', 'pjusr.usr.select', 'Please select user');
INSERT INTO `i18n`
VALUES ('en', 'pj_gr.des', 'Desciption');
INSERT INTO `i18n`
VALUES ('en', 'pj_gr.gr', 'Group');
INSERT INTO `i18n`
VALUES ('en', 'rep.btn.go', 'Refresh');
INSERT INTO `i18n`
VALUES ('en', 'svn.auth.error', 'authorization failed');
INSERT INTO `i18n`
VALUES ('en', 'sys.error', 'Error:');
INSERT INTO `i18n`
VALUES ('en', 'sys.error.pj.empty', 'Can not access');
INSERT INTO `i18n`
VALUES ('en', 'sys.error.timeout', 'Session has been timeout,please login again.');
INSERT INTO `i18n`
VALUES ('en', 'sys.lbl.no', 'No.');
INSERT INTO `i18n`
VALUES ('en', 'usr.error.psw', '[Password] cannot be empty');
INSERT INTO `i18n`
VALUES ('en', 'usr.error.usr', '[User] cannot be empty');
INSERT INTO `i18n`
VALUES ('en', 'usr.op.delete', 'Delete');
INSERT INTO `i18n`
VALUES ('en', 'usr.op.delete.confirm', 'Are you sure to delete?');
INSERT INTO `i18n`
VALUES ('en', 'usr.op.submit', 'Submit');
INSERT INTO `i18n`
VALUES ('en', 'usr.psw', 'Password');
INSERT INTO `i18n`
VALUES ('en', 'usr.role', 'Role');
INSERT INTO `i18n`
VALUES ('en', 'usr.role.select', 'Please select role');
INSERT INTO `i18n`
VALUES ('en', 'usr.title', 'User');
INSERT INTO `i18n`
VALUES ('en', 'usr.usr', 'User');
INSERT INTO `i18n`
VALUES ('en', 'zh_CN', 'Simplified Chinese');
INSERT INTO `i18n`
VALUES ('zh_CN', 'en', 'en');
INSERT INTO `i18n`
VALUES ('zh_CN', 'login.btn.login', '登录');
INSERT INTO `i18n`
VALUES ('zh_CN', 'login.error.notfoundusr', '不存在用户{0} ');
INSERT INTO `i18n`
VALUES ('zh_CN', 'login.error.wrongpassword', '密码错误 ');
INSERT INTO `i18n`
VALUES ('zh_CN', 'login.info.setadmin', '欢迎使用SVN ADMIN,第一次使用请设置管理员帐号和密码.');
INSERT INTO `i18n`
VALUES ('zh_CN', 'login.title', 'SVN ADMIN 登录');
INSERT INTO `i18n`
VALUES ('zh_CN', 'main.link.i18n', '语言');
INSERT INTO `i18n`
VALUES ('zh_CN', 'main.link.logout', '退出');
INSERT INTO `i18n`
VALUES ('zh_CN', 'main.link.pj', '项目');
INSERT INTO `i18n`
VALUES ('zh_CN', 'main.link.user', '用户');
INSERT INTO `i18n`
VALUES ('zh_CN', 'main.title', 'SVN ADMIN');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj.btn.submit', '提交');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj.des', '描述');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj.error.path', '路径不可以为空');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj.error.pj', '项目不可以为空');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj.error.url', 'URL不可以为空');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj.op.delete', '删除');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj.op.delete.confirm', '确认删除?');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj.op.setauth', '设置权限');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj.op.setgr', '设置用户组');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj.op.setuser', '设置用户');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj.path', '路径');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj.pj', '项目');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj.title', '项目管理');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj.type', '类型');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj.type.http', 'http');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj.type.http.mutil', 'http(多库)');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj.type.svn', 'svn');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj.url', 'URL');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjauth.btn.submit', '保存');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjauth.error.grusr', '请选择用户组或用户');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjauth.error.pj', '项目不可以为空');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjauth.error.res', '资源不可以为空');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjauth.op.delete', '删除');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjauth.op.delete.confirm', '确认删除?');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjauth.res', '资源');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjauth.res.select', '选择资源');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjauth.rw', '权限');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjauth.rw.none', '没有权限');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjauth.rw.r', '可读');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjauth.rw.rw', '可读可写');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjauth.title', '权限管理');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjgr.btn.submit', '提交');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjgr.error.gr', '组号不可以为空');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjgr.error.pj', '项目不可以为空');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjgr.op.delete', '删除');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjgr.op.delete.confirm', '确认删除?');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjgr.op.setuser', '设置用户');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjgr.title', '用户组管理');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjgrusr.error.usr', '用户不可以为空');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjgrusr.op.delete', '删除');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjgrusr.op.delete.confirm', '确认删除?');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjgrusr.op.submit', '增加用户');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjgrusr.title', '项目组用户管理');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjusr.error.pj', '项目不可以为空');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjusr.error.psw', '项目新密码不可以为空');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjusr.error.usr', '用户不可以为空');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjusr.info', '(注意:这里设置的用户密码只对这个项目有效)');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjusr.op.delete', '删除');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjusr.op.delete.confirm', '确认删除?');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjusr.op.submit', '提交');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjusr.psw.psw', '项目新密码');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjusr.title', '项目用户管理');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pjusr.usr.select', '选择用户');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj_gr.des', '描述');
INSERT INTO `i18n`
VALUES ('zh_CN', 'pj_gr.gr', '用户组');
INSERT INTO `i18n`
VALUES ('zh_CN', 'rep.btn.go', '刷新');
INSERT INTO `i18n`
VALUES ('zh_CN', 'svn.auth.error', '认证失败');
INSERT INTO `i18n`
VALUES ('zh_CN', 'svn.notFoundResp', '找不到仓库 路径{0}');
INSERT INTO `i18n`
VALUES ('zh_CN', 'sys.error', '错误');
INSERT INTO `i18n`
VALUES ('zh_CN', 'sys.error.timeout', '超时或未登录');
INSERT INTO `i18n`
VALUES ('zh_CN', 'sys.lbl.no', 'NO.');
INSERT INTO `i18n`
VALUES ('zh_CN', 'usr.error.psw', '密码不可以为空');
INSERT INTO `i18n`
VALUES ('zh_CN', 'usr.error.usr', '用户不可以为空');
INSERT INTO `i18n`
VALUES ('zh_CN', 'usr.op.delete', '删除');
INSERT INTO `i18n`
VALUES ('zh_CN', 'usr.op.delete.confirm', '确认删除?');
INSERT INTO `i18n`
VALUES ('zh_CN', 'usr.op.listauth', '查看权限');
INSERT INTO `i18n`
VALUES ('zh_CN', 'usr.op.submit', '提交');
INSERT INTO `i18n`
VALUES ('zh_CN', 'usr.psw', '密码');
INSERT INTO `i18n`
VALUES ('zh_CN', 'usr.role', '角色');
INSERT INTO `i18n`
VALUES ('zh_CN', 'usr.role.select', '选择角色');
INSERT INTO `i18n`
VALUES ('zh_CN', 'usr.title', '用户管理');
INSERT INTO `i18n`
VALUES ('zh_CN', 'usr.usr', '帐号');
INSERT INTO `i18n`
VALUES ('zh_CN', 'zh_CN', 'Chinese');

-- ----------------------------
-- Table structure for pj
-- ----------------------------
DROP TABLE IF EXISTS `pj`;
CREATE TABLE `pj`
(
    `pj`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `url`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `des`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    PRIMARY KEY (`pj`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pj_gr
-- ----------------------------
DROP TABLE IF EXISTS `pj_gr`;
CREATE TABLE `pj_gr`
(
    `pj`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `gr`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `des` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    PRIMARY KEY (`pj`, `gr`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pj_gr_auth
-- ----------------------------
DROP TABLE IF EXISTS `pj_gr_auth`;
CREATE TABLE `pj_gr_auth`
(
    `pj`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `gr`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `res` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `rw`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    PRIMARY KEY (`pj`, `res`, `gr`) USING BTREE,
    INDEX `FK_Reference_6` (`pj`, `gr`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pj_gr_usr
-- ----------------------------
DROP TABLE IF EXISTS `pj_gr_usr`;
CREATE TABLE `pj_gr_usr`
(
    `pj`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `gr`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `usr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    PRIMARY KEY (`pj`, `usr`, `gr`) USING BTREE,
    INDEX `FK_Reference_10` (`pj`, `gr`) USING BTREE,
    INDEX `FK_Reference_9` (`usr`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pj_usr
-- ----------------------------
DROP TABLE IF EXISTS `pj_usr`;
CREATE TABLE `pj_usr`
(
    `pj`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `usr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `psw` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    PRIMARY KEY (`usr`, `pj`) USING BTREE,
    INDEX `FK_Reference_5` (`pj`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pj_usr_auth
-- ----------------------------
DROP TABLE IF EXISTS `pj_usr_auth`;
CREATE TABLE `pj_usr_auth`
(
    `pj`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `usr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `res` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `rw`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    PRIMARY KEY (`pj`, `res`, `usr`) USING BTREE,
    INDEX `FK_Reference_8` (`usr`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for usr
-- ----------------------------
DROP TABLE IF EXISTS `usr`;
CREATE TABLE `usr`
(
    `usr`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `psw`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `role` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    PRIMARY KEY (`usr`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usr
-- ----------------------------
INSERT INTO `usr`
VALUES ('root', 'cm9vdDEyMw**', '系统管理员', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
