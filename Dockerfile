FROM cepgbaseacr.azurecr.io/docker.io/openjdk:17-slim

WORKDIR /app

COPY . /app

RUN javac Main.java

CMD ["java", "Main"]
