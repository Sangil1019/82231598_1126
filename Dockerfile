FROM cepgbaseacr.azurecr.io/docker.io/openjdk:17-slim

WORKDIR /app

RUN apt-get update && apt-get install -y maven

COPY pom.xml ./

RUN mvn dependency:go-offline

COPY src ./src

EXPOSE 8080

CMD ["mvn", "spring-boot:run"]
