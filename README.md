# SvnAdmin

致力于成为一个安全流畅，极简可靠的SVN管理工具

# 主要功能 
- 支持用户现有SVN项目导入，一键迁移；
- SVN仓库创建，管理；
- SVN用户，用户组创建，管理；
- SVN资源权限授权；
- 用户权限查看，密码更改；
- SVN仓库支持多库模式；

# 使用源码开发部署步骤：
1. 下载项目源码
2. 构建本地镜像
    
        docker build -t svnadmin .
3. 编写docker-compose.yml

        version: '3.1'
        services:
          svnadmin-svn:
            image: svnadmin-svn
            container_name: svnadmin-svn
            restart: always
            network_mode: "bridge"
            ports:
              - "8888:8080"
              - "3690:3690"
            environment:
              SVN_ADMIN_DB: db
              SVN_ADMIN_INSTANCE: svnadmin
              SVN_ADMIN_USERNAME: root
              SVN_ADMIN_PASSWORD: 123456
            external_links:
              - mysql:db
            volumes:
              - ./data:/var/opt/svn
4. 运行
    
        docker-compose up -d
5. 访问

        http://ip:8888        

# Docker-Hub上的镜像

    sunhaojava/svnadmin:latest