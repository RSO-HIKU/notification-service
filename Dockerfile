# Build stage
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /workspace

COPY pom.xml .
RUN mvn -q -DskipTests dependency:go-offline

COPY src ./src
RUN mvn -q -DskipTests clean package

# Run stage
FROM eclipse-temurin:21-jre
WORKDIR /app

# Copy JAR
COPY --from=build /workspace/target/notification-service-0.1.0.jar ./notification-service.jar

# Copy configuration
COPY src/main/resources/config.yaml ./config.yaml

# Expose port as defined in config.yaml
EXPOSE 8088

# Run JAR with explicit config
CMD ["java", "-jar", "notification-service.jar"]
