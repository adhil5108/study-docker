## ===============================
## 🏗️ Stage 1: Build the JAR
## ===============================
#FROM eclipse-temurin:21-jdk AS build
#WORKDIR /app
#
## Copy Maven project files
#COPY pom.xml .
#COPY src ./src
#
## If you have the Maven Wrapper, copy it too
#COPY mvnw .
#COPY .mvn .mvn
#
## Run Maven inside the container
#RUN ./mvnw clean package -DskipTests
#
## ===============================
## 🚀 Stage 2: Run the JAR
## ===============================
#FROM eclipse-temurin:21-jdk
#WORKDIR /app
#
## Copy built jar from Stage 1
#COPY --from=build /app/target/*.jar app.jar
#
#EXPOSE 8080
#ENTRYPOINT ["java", "-jar", "app.jar"]


# ===============================
# 🏗️ Stage 1: Build the JAR
# ===============================
FROM eclipse-temurin:21-jdk AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src
COPY mvnw .
COPY .mvn .mvn

# ✅ Add this line to give mvnw execute permission
RUN chmod +x mvnw

# Now build the project
RUN ./mvnw clean package -DskipTests

# ===============================
# 🚀 Stage 2: Run the JAR
# ===============================
FROM eclipse-temurin:21-jdk
WORKDIR /app

COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
