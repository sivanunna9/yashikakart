FROM tomcat:7.0
RUN apt-get update \
    apt-get install -y vim
ADD target/ekart.war /usr/local/tomcat/webapps
ENTRYPOINT /usr/local/tomcat/bin/startup.sh && bash
