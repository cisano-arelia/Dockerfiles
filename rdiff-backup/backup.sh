#!/bin/bash
# Inspiration  https://raw.githubusercontent.com/boombatower/docker-backup/master/backup.sh

volumes=$(cat /proc/mounts | \
          grep -oP "/dev/[^ ]+ \K(/[^ ]+)" | \
          grep -v "/backup" | \
          grep -v "/etc/resolv.conf" | \
          grep -v "/etc/hostname" | \
          grep -v "/etc/hosts")

if [ -z "$volumes" ]; then
  echo "No volumes were detected."
  exit 1
fi

echo "Volumes detected: $volumes"

for x in $volumes; do
	find $volumes >> /tmp/include-list
done

echo "Backuping..."

rdiff-backup --include-filelist /tmp/include-list --exclude '**' / /backup

