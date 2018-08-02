FROM debian:jessie
RUN echo deb http://http.us.debian.org/debian/ jessie-backports main >> /etc/apt/sources.list
RUN echo deb-src http://http.us.debian.org/debian/ jessie-backports main >> /etc/apt/sources.list

RUN apt-get update -y; apt-get upgrade -y

RUN apt-get install -y -t jessie-backports ca-certificates-java

RUN \
    apt-get install -y \
    openjdk-8-jre \
    openjdk-8-jre-headless \
    wget

COPY eula.txt /tmp/
ADD eula.txt /tmp/

RUN \
    cd /opt;\
    wget https://launcher.mojang.com/mc/game/1.13/server/d0caafb8438ebd206f99930cfaecfa6c9a13dca0/server.jar;\
    cp /tmp/eula.txt /opt/eula.txt

EXPOSE 80 25565

VOLUME ["/data"]
CMD bash `cd /opt && /usr/lib/jvm/java-8-openjdk-amd64/bin/java -Xmx1024M -Xms1024M -jar server.jar nogui`
