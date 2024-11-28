FROM ce82231598acr.azurecr.io/docker.io/openjdk:17-slim

WORKDIR /app

# 업데이트 및 Maven 설치
RUN apt-get update && \
    apt-get install -y --no-install-recommends maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 의존성 캐싱
COPY pom.xml ./pom.xml
RUN mvn dependency:go-offline

# 소스 복사 및 빌드
COPY src ./src

# 애플리케이션 실행
EXPOSE 8080
CMD ["mvn", "spring-boot:run"]

