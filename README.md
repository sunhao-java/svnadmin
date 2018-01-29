# SvnAdmin

#### 致力于成为一个安全流畅，极简可靠的SVN管理工具
（这不是SVN服务器，它的职责是帮你方便的管理SVN服务以下功能）
> 主要功能 
- 支持用户现有SVN项目导入，一键迁移；
- SVN仓库创建，管理；
- SVN用户，用户组创建，管理；
- SVN资源权限授权；
- 用户权限查看，密码更改；
- SVN仓库支持多库模式；

> 获取老司机的带路：

<a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=58dddb7a869c97060a2c96fb4eb658d4a50d2a108caaa1eef5dafbf94d1e09b3" rel="nofollow noreferrer noopener"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="SVN管理系统-交流群" title="SVN管理系统-交流群"></a>


> 一、使用源码开发部署步骤：
1. 下载项目源码；
1. 找到文件 test\resources\svnadmin_init.sql 进行执行初始化；
1. 默认root账户：root/root
1. 删除所有账户，进行登录，则可以重新初始化管理员账号；
1. SVN认证账户和登录账户默认一致；


> 二、使用部署包直接部署步骤：
1. 下载最新部署包V4.1.0（[点此下载](https://gitee.com/hpboys/svnadmin/releases/v4.1.0)）；
1. 找到文件 src\test\resources\sql\svnadmin_init.sql 进行执行初始化；
1. 配置数据库连接信息，配置文件位置：WEB-INF/classes/jdbc.properties
1. 部署到tomcat等Web容器中即可；环境推荐JDK1.8 / Tomcat8
1. 默认root账户：root/root
1. 删除所有账户，进行登录，则可以重新初始化管理员账号；
1. SVN认证账户和登录账户默认一致；


> 三、使用多库启动模式：

假设你的SVN地址为D:\svn\demo，
那么你需要使用多库的启动方式

```
svnserve -d -r D:\svn
```
你的访问路径将是这样的：
svn://localhost/demo
