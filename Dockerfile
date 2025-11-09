# Step 1: Use a base image with Java 17 (or whatever version your app uses)
FROM eclipse-temurin:21-jdk


# Step 2: Set working directory inside container
WORKDIR /app

# Step 3: Copy the JAR file (built from Maven)
COPY target/week-4-0.0.1-SNAPSHOT.jar app.jar

# Step 4: Expose the default Spring Boot port
EXPOSE 8080

# Step 5: Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
