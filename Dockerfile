FROM ce82231598acr.azurecr.io/docker.io/openjdk:17-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends maven

COPY pom.xml ./pom.xml
RUN mvn dependency:go-offline

COPY src ./src

EXPOSE 8080
CMD ["mvn", "spring-boot:run"]

