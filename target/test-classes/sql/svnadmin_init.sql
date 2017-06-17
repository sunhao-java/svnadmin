# Host: hpboys.com  (Version: 5.6.34-log)
# Date: 2017-05-17 13:27:22
# Generator: MySQL-Front 5.3  (Build 2.42)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

DROP DATABASE IF EXISTS `svnadmin`;
CREATE DATABASE `svnadmin` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `svnadmin`;

#
# Source for table "i18n"
#

DROP TABLE IF EXISTS `i18n`;
CREATE TABLE `i18n` (
  `lang` varchar(20) NOT NULL,
  `id` varchar(200) NOT NULL,
  `lbl` varchar(200) NOT NULL,
  PRIMARY KEY (`lang`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "i18n"
#

INSERT INTO `i18n` VALUES ('en','en','English'),('en','i18n.add.title','Add Language'),('en','i18n.current','Current Language'),('en','i18n.error.lang','[Language] cannot be empty'),('en','i18n.error.lbl','[Label] cannot be empty'),('en','i18n.id','Key'),('en','i18n.lang','Language'),('en','i18n.lbl','Label'),('en','i18n.op.addlang','Add Language'),('en','i18n.op.export','Export Language'),('en','i18n.op.submit','Submit'),('en','i18n.title','Language'),('en','login.btn.login','Login'),('en','login.info.setadmin','Welcome to SVN ADMIN,please set the administrator accout and password.'),('en','login.title','SVN ADMIN Login'),('en','main.link.i18n','Language'),('en','main.link.logout','Logout'),('en','main.link.pj','Project'),('en','main.link.user','User'),('en','main.title','SVN ADMIN'),('en','pj.btn.submit','Submit'),('en','pj.des','Desciption'),('en','pj.error.path','[Path] cannot be empty'),('en','pj.error.pj','[Project] cannot be empty'),('en','pj.error.url','[URL] cannot be empty'),('en','pj.op.delete','Delete'),('en','pj.op.delete.confirm','Are you sure to delete?'),('en','pj.op.setauth','Authorization'),('en','pj.op.setgr','Group'),('en','pj.op.setuser','User'),('en','pj.path','Path'),('en','pj.pj','Project'),('en','pj.title','Project'),('en','pj.type','Type'),('en','pj.type.http','http'),('en','pj.type.http.mutil','http(mutil)'),('en','pj.type.svn','svn'),('en','pj.url','URL'),('en','pjauth.btn.submit','Save'),('en','pjauth.error.grusr','Please select Group or User'),('en','pjauth.error.pj','[Project] cannot be empty'),('en','pjauth.error.res','[Resource] can not be empy'),('en','pjauth.op.delete','Delete'),('en','pjauth.op.delete.confirm','Are you sure to delete?'),('en','pjauth.res','Resource'),('en','pjauth.res.select','Please select resource'),('en','pjauth.rw','Access'),('en','pjauth.rw.none','none'),('en','pjauth.rw.r','Read'),('en','pjauth.rw.rw','Read-write'),('en','pjauth.title','Authorization'),('en','pjgr.btn.submit','Submit'),('en','pjgr.error.gr','[Group] cannot be empty'),('en','pjgr.error.pj','[Project] cannot be empty'),('en','pjgr.op.delete','Delete'),('en','pjgr.op.delete.confirm','Are you sure to delete?'),('en','pjgr.op.setuser','User'),('en','pjgr.title','Groups'),('en','pjgrusr.error.usr','[User] cannot be empty'),('en','pjgrusr.op.delete','Delete'),('en','pjgrusr.op.delete.confirm','Are you sure to delete?'),('en','pjgrusr.op.submit','Add User'),('en','pjgrusr.title','Group User'),('en','pjusr.error.pj','[Project] cannot be empty'),('en','pjusr.error.psw','[Password] cannot be empty'),('en','pjusr.error.usr','[User] cannot be empty'),('en','pjusr.info','(Notice:Project user setting only effect this project)'),('en','pjusr.op.delete','Delete'),('en','pjusr.op.submit','Submit'),('en','pjusr.psw.psw','Password'),('en','pjusr.title','Project User'),('en','pjusr.usr.select','Please select user'),('en','pj_gr.des','Desciption'),('en','pj_gr.gr','Group'),('en','rep.btn.go','Refresh'),('en','svn.auth.error','authorization failed'),('en','sys.error','Error:'),('en','sys.error.pj.empty','Can not access'),('en','sys.error.timeout','Session has been timeout,please login again.'),('en','sys.lbl.no','No.'),('en','usr.error.psw','[Password] cannot be empty'),('en','usr.error.usr','[User] cannot be empty'),('en','usr.op.delete','Delete'),('en','usr.op.delete.confirm','Are you sure to delete?'),('en','usr.op.submit','Submit'),('en','usr.psw','Password'),('en','usr.role','Role'),('en','usr.role.select','Please select role'),('en','usr.title','User'),('en','usr.usr','User'),('en','zh_CN','Simplified Chinese'),('zh_CN','en','en'),('zh_CN','login.btn.login','登录'),('zh_CN','login.error.notfoundusr','不存在用户{0} '),('zh_CN','login.error.wrongpassword','密码错误 '),('zh_CN','login.info.setadmin','欢迎使用SVN ADMIN,第一次使用请设置管理员帐号和密码.'),('zh_CN','login.title','SVN ADMIN 登录'),('zh_CN','main.link.i18n','语言'),('zh_CN','main.link.logout','退出'),('zh_CN','main.link.pj','项目'),('zh_CN','main.link.user','用户'),('zh_CN','main.title','SVN ADMIN'),('zh_CN','pj.btn.submit','提交'),('zh_CN','pj.des','描述'),('zh_CN','pj.error.path','路径不可以为空'),('zh_CN','pj.error.pj','项目不可以为空'),('zh_CN','pj.error.url','URL不可以为空'),('zh_CN','pj.op.delete','删除'),('zh_CN','pj.op.delete.confirm','确认删除?'),('zh_CN','pj.op.setauth','设置权限'),('zh_CN','pj.op.setgr','设置用户组'),('zh_CN','pj.op.setuser','设置用户'),('zh_CN','pj.path','路径'),('zh_CN','pj.pj','项目'),('zh_CN','pj.title','项目管理'),('zh_CN','pj.type','类型'),('zh_CN','pj.type.http','http'),('zh_CN','pj.type.http.mutil','http(多库)'),('zh_CN','pj.type.svn','svn'),('zh_CN','pj.url','URL'),('zh_CN','pjauth.btn.submit','保存'),('zh_CN','pjauth.error.grusr','请选择用户组或用户'),('zh_CN','pjauth.error.pj','项目不可以为空'),('zh_CN','pjauth.error.res','资源不可以为空'),('zh_CN','pjauth.op.delete','删除'),('zh_CN','pjauth.op.delete.confirm','确认删除?'),('zh_CN','pjauth.res','资源'),('zh_CN','pjauth.res.select','选择资源'),('zh_CN','pjauth.rw','权限'),('zh_CN','pjauth.rw.none','没有权限'),('zh_CN','pjauth.rw.r','可读'),('zh_CN','pjauth.rw.rw','可读可写'),('zh_CN','pjauth.title','权限管理'),('zh_CN','pjgr.btn.submit','提交'),('zh_CN','pjgr.error.gr','组号不可以为空'),('zh_CN','pjgr.error.pj','项目不可以为空'),('zh_CN','pjgr.op.delete','删除'),('zh_CN','pjgr.op.delete.confirm','确认删除?'),('zh_CN','pjgr.op.setuser','设置用户'),('zh_CN','pjgr.title','用户组管理'),('zh_CN','pjgrusr.error.usr','用户不可以为空'),('zh_CN','pjgrusr.op.delete','删除'),('zh_CN','pjgrusr.op.delete.confirm','确认删除?'),('zh_CN','pjgrusr.op.submit','增加用户'),('zh_CN','pjgrusr.title','项目组用户管理'),('zh_CN','pjusr.error.pj','项目不可以为空'),('zh_CN','pjusr.error.psw','项目新密码不可以为空'),('zh_CN','pjusr.error.usr','用户不可以为空'),('zh_CN','pjusr.info','(注意:这里设置的用户密码只对这个项目有效)'),('zh_CN','pjusr.op.delete','删除'),('zh_CN','pjusr.op.delete.confirm','确认删除?'),('zh_CN','pjusr.op.submit','提交'),('zh_CN','pjusr.psw.psw','项目新密码'),('zh_CN','pjusr.title','项目用户管理'),('zh_CN','pjusr.usr.select','选择用户'),('zh_CN','pj_gr.des','描述'),('zh_CN','pj_gr.gr','用户组'),('zh_CN','rep.btn.go','刷新'),('zh_CN','svn.auth.error','认证失败'),('zh_CN','sys.error','错误'),('zh_CN','sys.error.timeout','超时或未登录'),('zh_CN','sys.lbl.no','NO.'),('zh_CN','usr.error.psw','密码不可以为空'),('zh_CN','usr.error.usr','用户不可以为空'),('zh_CN','usr.op.delete','删除'),('zh_CN','usr.op.delete.confirm','确认删除?'),('zh_CN','usr.op.listauth','查看权限'),('zh_CN','usr.op.submit','提交'),('zh_CN','usr.psw','密码'),('zh_CN','usr.role','角色'),('zh_CN','usr.role.select','选择角色'),('zh_CN','usr.title','用户管理'),('zh_CN','usr.usr','帐号'),('zh_CN','zh_CN','Chinese');

#
# Source for table "pj"
#

DROP TABLE IF EXISTS `pj`;
CREATE TABLE `pj` (
  `pj` varchar(50) NOT NULL,
  `path` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `type` varchar(10) NOT NULL,
  `des` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "pj"
#

INSERT INTO `pj` VALUES ('edu','/svn/edu','svn://hpboys.com/edu','svn','Dubbo学习案例');

#
# Source for table "pj_gr"
#

DROP TABLE IF EXISTS `pj_gr`;
CREATE TABLE `pj_gr` (
  `pj` varchar(50) NOT NULL,
  `gr` varchar(50) NOT NULL,
  `des` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pj`,`gr`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`pj`) REFERENCES `pj` (`pj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "pj_gr"
#

INSERT INTO `pj_gr` VALUES ('edu','developer','developer'),('edu','manager','manager'),('edu','tester','tester');

#
# Source for table "pj_gr_auth"
#

DROP TABLE IF EXISTS `pj_gr_auth`;
CREATE TABLE `pj_gr_auth` (
  `pj` varchar(50) NOT NULL,
  `gr` varchar(50) NOT NULL,
  `res` varchar(200) NOT NULL,
  `rw` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pj`,`res`,`gr`),
  KEY `FK_Reference_6` (`pj`,`gr`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`pj`, `gr`) REFERENCES `pj_gr` (`pj`, `gr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "pj_gr_auth"
#


#
# Source for table "usr"
#

DROP TABLE IF EXISTS `usr`;
CREATE TABLE `usr` (
  `usr` varchar(50) NOT NULL,
  `psw` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`usr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "usr"
#

INSERT INTO `usr` VALUES ('*','*',NULL,NULL),('root','cm9vdA**',NULL,'admin');

#
# Source for table "pj_usr_auth"
#

DROP TABLE IF EXISTS `pj_usr_auth`;
CREATE TABLE `pj_usr_auth` (
  `pj` varchar(50) NOT NULL,
  `usr` varchar(50) NOT NULL,
  `res` varchar(200) NOT NULL,
  `rw` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pj`,`res`,`usr`),
  KEY `FK_Reference_8` (`usr`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`pj`) REFERENCES `pj` (`pj`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`usr`) REFERENCES `usr` (`usr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "pj_usr_auth"
#


#
# Source for table "pj_usr"
#

DROP TABLE IF EXISTS `pj_usr`;
CREATE TABLE `pj_usr` (
  `pj` varchar(50) NOT NULL,
  `usr` varchar(50) NOT NULL,
  `psw` varchar(50) NOT NULL,
  PRIMARY KEY (`usr`,`pj`),
  KEY `FK_Reference_5` (`pj`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`pj`) REFERENCES `pj` (`pj`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`usr`) REFERENCES `usr` (`usr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "pj_usr"
#


#
# Source for table "pj_gr_usr"
#

DROP TABLE IF EXISTS `pj_gr_usr`;
CREATE TABLE `pj_gr_usr` (
  `pj` varchar(50) NOT NULL,
  `gr` varchar(50) NOT NULL,
  `usr` varchar(50) NOT NULL,
  PRIMARY KEY (`pj`,`usr`,`gr`),
  KEY `FK_Reference_10` (`pj`,`gr`),
  KEY `FK_Reference_9` (`usr`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`pj`, `gr`) REFERENCES `pj_gr` (`pj`, `gr`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`usr`) REFERENCES `usr` (`usr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "pj_gr_usr"
#


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
