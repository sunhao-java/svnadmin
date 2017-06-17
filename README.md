# SvnAdmin

#### 致力于成为一个安全流畅，极简可靠的SVN管理工具
> 主要功能 
- SVN仓库创建，管理；
- SVN用户，用户组创建，管理；
- SVN资源权限授权；
- 用户权限查看，密码更改；
- SVN仓库支持多库模式；


> 一、使用源码开发部署步骤：
1. 下载项目源码；
1. 找到文件 test\resources\svnadmin_init.sql 进行执行初始化；
1. 默认root账户：root/root
1. 删除所有账户，进行登录，则可以重新初始化管理员账号；
1. SVN认证账户和登录账户默认一致；


> 二、使用部署包直接部署步骤：
1. 下载最新部署包（[点此下载](http://hpboys.qiniudn.com//download/svnadmin.war)）；
1. 找到文件 sql\svnadmin_init.sql 进行执行初始化；
1. 配置数据库连接信息，配置文件位置：WEB-INF/classes/jdbc.properties
1. 部署到tomcat等Web容器中即可；环境推荐JDK1.8 / Tomcat8
1. 默认root账户：root/root
1. 删除所有账户，进行登录，则可以重新初始化管理员账号；
1. SVN认证账户和登录账户默认一致；
