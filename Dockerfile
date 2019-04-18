FROM tomcat

# 删除原来的
RUN rm -rf /usr/local/tomcat/webapps/*

# 复制文件
COPY ./web /usr/local/tomcat/webapps/ROOT

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone