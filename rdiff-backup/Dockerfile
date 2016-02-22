# Inspiration https://github.com/boombatower/docker-backup/blob/master/Dockerfile

FROM debian:jessie

MAINTAINER Peter de Jong <p.de.jong@gmail.com>

RUN apt-get update && \
    apt-get -y install rdiff-backup && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

ADD backup.sh /root/bin/

RUN chmod +x /root/bin/backup.sh

VOLUME /backup
ENTRYPOINT ["/root/bin/backup.sh"]
