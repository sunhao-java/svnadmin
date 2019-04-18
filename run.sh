#!/bin/bash

# 启动tomcat
/usr/local/tomcat/bin/catalina.sh run
# 启动svn
/usr/bin/svnserve --daemon --foreground --root /var/opt/svn