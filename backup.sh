#!/bin/bash

DIR="/home/mantarobot/database_backups"
cd $DIR

FILENAME="rethinkdb-backup-$(date +%Y-%m-%d-%H-%M).tar.gz"

rethinkdb dump -f $FILENAME --clients 8
backblaze-b2 upload-file mantaro-database $FILENAME $FILENAME
