FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY target/hello-world-1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-cp", "app.jar", "com.bootcamp.HelloWorld"]
