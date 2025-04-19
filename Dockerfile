# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Install Maven (if necessary)
RUN apt-get update && apt-get install -y maven

# Copy pom.xml and source code to build the application
COPY pom.xml .
COPY src ./src

# Build the application (this will create the target directory with the .jar)
RUN mvn clean package -DskipTests

# Now copy the .jar file from the build context to the image
COPY ./target/*.jar app.jar

# Expose the port your Spring Boot app will run on
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
