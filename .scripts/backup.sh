#!/usr/bin/env bash

SOURCE_DIR="/home/moritz/Moritz"
BACKUP_VOL="/volume1/backup"
NAS_ADDR="moritz@delta"
BACKUP_DIR="${NAS_ADDR}:${BACKUP_VOL}"
CURRENT_POST="/daily/current"

case $1 in
    "daily") # 19:30 Uhr
        DAY="$(date '+%a' | tr '[:upper:]' '[:lower:]')"
        BACKUP_POST="/daily/${DAY}"
        BACKUP_PATH="${BACKUP_DIR}${BACKUP_POST}"
        ssh -t $NAS_ADDR "mkdir -p $BACKUP_VOL$BACKUP_POST"
        ssh -t $NAS_ADDR "ln -sfn $BACKUP_VOL$BACKUP_POST $BACKUP_VOL$CURRENT_POST"
        rsync -avm --include-from="/home/moritz/.config/rsyncexclude" $SOURCE_DIR $BACKUP_PATH
        # wenn alles funktioniert --delete noch einfügen
        ;;
    "weekly") # Sonntag 20 Uhr
        SECONDS="$(date '+%s')"
        WEEK_LEN="$((3600*24*7))"
        WEEK=$(($SECONDS / $WEEK_LEN % 5 + 1))
        BACKUP_POST="/weekly/week${WEEK}"
        BACKUP_PATH="${BACKUP_DIR}${BACKUP_POST}"
        ssh -t $NAS_ADDR "mkdir -p $BACKUP_VOL$BACKUP_POST"
        rsync -avm --include-from="/home/moritz/.config/rsyncexclude" $SOURCE_DIR $BACKUP_PATH
        # wenn alles funktioniert --delete noch einfügen
        ;;
    "monthly") # am 1. des Monats 19:00 Uhr
        MONTH="$(date --date="yesterday" '+%Y_%B')"
        ssh -t $NAS_ADDR "cd $BACKUP_VOL$CURRENT_POST &&
            tar -cjvhf ${BACKUP_VOL}/monthly/${MONTH}.tar.bz2 *"
        ;;
esac

