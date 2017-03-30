# minecraft-spigot

FROM java:8-jdk

MAINTAINER nathema <me@nathema.eu>

RUN apt-get update && \
    apt-get install -y build-essential libssl-dev libffi-dev python-dev python-pip git locales && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

RUN cd /usr && \
    git clone https://github.com/gsand/mark2.git

RUN cd /usr/mark2 && \
    pip install --upgrade cffi==1.7.0 pyparsing appdirs && \
    pip install --upgrade -r requirements.txt && \
    ln -s /usr/mark2/mark2 /usr/bin/mark2 && \
    mkdir /etc/mark2 && \
    cp /usr/mark2/mk2/resources/mark2.default.properties /etc/mark2/mark2.properties

RUN useradd -s /bin/bash -d /minecraft -m minecraft && \
    echo "minecraft - priority -1" >> /etc/security/limits.conf

ADD runmc /usr/bin/runmc

RUN chmod +x /usr/bin/runmc

EXPOSE 25565

USER minecraft

VOLUME /minecraft

WORKDIR /minecraft

CMD ["runmc"]
