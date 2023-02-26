# Stage 1: Compile the application
FROM maven:3.5.2-jdk-17 AS compile
WORKDIR /app
COPY pom.xml .
COPY src/ ./src/
RUN mvn clean compile

# Stage 2: Build the application
FROM openjdk:17-jre
WORKDIR /app
COPY --from=compile /app/target/bakemyday-0.0.1-SNAPSHOT.jar ./app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
