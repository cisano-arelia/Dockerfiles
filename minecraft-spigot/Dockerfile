# minecraft-spigot

FROM java:8-jdk

MAINTAINER nathema <me@nathema.eu>

RUN apt-get update && \
    apt-get install -y libssl-dev python-dev python-pip git && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN cd /usr && \
    git clone https://github.com/gsand/mark2.git

RUN cd /usr/mark2 && \
    pip install -r requirements.txt && \
    ln -s /usr/mark2/mark2 /usr/bin/mark2 && \
    mkdir /etc/mark2 && \
    cp /usr/mark2/mk2/resources/mark2.default.properties /etc/mark2/mark2.properties

RUN mkdir /spigot && \
    wget -O /spigot/BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && \
    cd /spigot && \
    java -jar BuildTools.jar --rev 1.9.2 && \
    find . -maxdepth 1 ! -name '.' ! -name 'spigot*.jar' -exec rm -rf {} +

RUN useradd -s /bin/bash -d /minecraft -m minecraft && \
    echo "minecraft - priority -1" >> /etc/security/limits.conf

ADD runmc /usr/bin/runmc

RUN chmod +x /usr/bin/runmc

EXPOSE 25565

USER minecraft

VOLUME /minecraft

WORKDIR /minecraft

CMD ["runmc"]
