# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Install Maven (if necessary)
RUN apt-get update && apt-get install -y maven

# Copy the pom.xml and the source code to build the application
COPY pom.xml .
COPY src ./src

# Build the application (this will create the target directory with the .jar)
RUN mvn clean package -DskipTests

# Copy the built .jar file into the container
COPY target/*.jar app.jar

# Expose the port your Spring Boot app will run on
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
