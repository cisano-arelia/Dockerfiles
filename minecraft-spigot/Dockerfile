# minecraft-spigot
# inspiration and args-split from totokaka

FROM java:8-jdk

MAINTAINER nathema <me@nathema.eu>

ADD args-split.sh /bin/args-split

RUN useradd -s /bin/bash -d /minecraft -m minecraft && \
    chmod +x /bin/args-split && \
    mkdir /BuildTools && \
    wget -O /BuildTools/BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && \
    cd /BuildTools && \
    java -jar BuildTools.jar --rev 1.8.8 && \
    cp /BuildTools/spigot-1.8.8.jar /minecraft/spigot.jar

EXPOSE 25565

USER minecraft

VOLUME /minecraft

WORKDIR /minecraft

ENTRYPOINT ["/bin/args-split", "java", "--", "-jar", "spigot.jar", "--"]

CMD ["-Xmx2G", "-Xms256M", "--", "nogui"]
