FROM ubuntu:latest

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y openjdk-11-jre-headless && \
    mkdir /minecraft && \
    cd /minecraft && \
    wget https://maven.minecraftforge.net/net/minecraftforge/forge/1.16.5-36.1.0/forge-1.16.5-36.1.0-installer.jar && \
    echo "eula=true" > eula.txt && \
    java -jar forge-1.16.5-36.1.0-installer.jar --installServer && \
    java -Xms1G -Xmx2G -jar forge-1.16.5-36.1.0.jar nogui