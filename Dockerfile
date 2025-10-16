# Use an official Maven image to build the project
FROM maven:3.9.8-eclipse-temurin-17 AS build

# Set working directory
WORKDIR /app

# Copy pom.xml and download dependencies (faster builds)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Package the application
RUN mvn clean package -DskipTests

# ==========================
# Use lightweight JRE image for running the app
# ==========================
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copy the JAR file from the builder stage
COPY --from=build /app/target/*.jar app.jar

# Expose port (change if your app uses another port)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
