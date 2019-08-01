FROM maven:3.6.1

RUN mdkir -p /app

COPY . /app

WORKDIR /app

CMD mvn spring-boot:run 
