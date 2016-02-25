# Docker container definition for incremental data volume backup 

Example backup script: 

```
#!/bin/bash

BASEDIR=/srv/backup/data-containers

for c in $(docker ps -a --format="{{.Names}}" | grep data)
do
   echo "Processing container $c"
   if [ ! -d $c ]; then
      mkdir $BASEDIR/$c
   fi

   docker run --rm --volumes-from $c -v $BASEDIR/$c:/backup nathema/rdiff-backup
done

