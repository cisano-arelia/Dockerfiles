# minecraft-spigot
# inspiration and args-split from totokaka

FROM java:8-jdk

MAINTAINER nathema <me@nathema.eu>

ADD args-split.sh /bin/args-split

RUN useradd -s /bin/bash -d /server -m minecraft && \
    mkdir /buildtools && \
    wget -O /buildtools/BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && \
    chown -R minecraft /buildtools && \
    chmod +x /bin/args-split

EXPOSE 25565

USER minecraft

VOLUME /server
VOLUME /buildtools

WORKDIR /server

ENTRYPOINT ["/bin/args-split", "java", "--", "-jar", "spigot.jar", "--"]

CMD ["-Xmx1536M", "-Xms512M", "--", "nogui"]
