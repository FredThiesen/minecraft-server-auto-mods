FROM openjdk:17-jdk-alpine3.14

WORKDIR /minecraft

RUN curl -L https://launcher.mojang.com/v1/objects/a0d0322dbf5f6c2eaae1ccd1db7aabe54f880cc5/server.jar -o minecraft_server.jar

COPY ./start.sh .

RUN chmod +x start.sh

CMD ["./start.sh"]
