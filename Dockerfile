FROM tomcat:8.0

# Remove default ROOT app (recommended)
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Deploy your war
COPY target/ekart.war /usr/local/tomcat/webapps/ekart.war

# Expose port
EXPOSE 8080

# Start Tomcat in foreground (required for Docker)
CMD ["catalina.sh", "run"]
