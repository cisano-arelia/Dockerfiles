# Docker container definition for a small personal Spigot Minecraft server

SystemD unit file for a small personal minecraft server: 

```[Unit]
Description=Minecraft
After=mariadb.service
Requires=mariadb.service

[Service]
Restart=always
RestartSec=30
TimeoutStartSec=0
ExecStartPre=-/usr/bin/docker kill minecraft
ExecStartPre=-/usr/bin/docker rm minecraft
ExecStart=/usr/bin/docker run --name minecraft -p 25565:25565 --link mariadb:mysql --link mail:mail --dns=x.x.x.x --cpuset-cpus=0,1 --memory=2G --privileged --volumes-from=minecraft-data nathema/minecraft-spigot:1.8.8
ExecStop=/usr/bin/docker stop minecraft

[Install]
WantedBy=multi-user.target


