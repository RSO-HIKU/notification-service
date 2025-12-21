FROM eclipse-temurin:21-jre
WORKDIR /app

# Copy JAR
COPY target/notification-service-0.1.0.jar ./notification-service.jar

# Copy configuration
COPY src/main/resources/config.yaml ./config.yaml

# Expose port as defined in config.yaml
EXPOSE 8088

# Run JAR with explicit config
CMD ["java", "-jar", "notification-service.jar"]
