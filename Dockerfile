FROM tomcat:8.0

ADD **/*.war /usr/local/tomcat/webapps

EXPOSE 8083

CMD ["catalina.sh", "run"]
