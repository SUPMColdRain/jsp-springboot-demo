FROM tomcat:9.0.30
RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./target/exam.war /usr/local/tomcat/webapps/ROOT.war
CMD ["catalina.sh", "run"]
