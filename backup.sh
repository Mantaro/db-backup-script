#!/bin/bash

DIR="/home/mantarobot/database_backups"
FILENAME="mongodb-backup-$(date +%Y-%m-%d-%H-%M).tar.gz"

cd $DIR
mongodump --gzip --archive=$FILENAME
backblaze-b2 upload-file mantaro-database $FILENAME $FILENAME
