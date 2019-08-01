FROM maven:3.6.1

RUN mkdir -p /app

COPY . /app

WORKDIR /app

CMD mvn spring-boot:run 
