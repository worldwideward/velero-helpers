#!/bin/bash

# Restore the most recent backup created by Velero.

velero backup get

echo " "
echo "-------"
read -p "Type the name of the backup you need to restore: " backup_name

restore_name=$backup_name-$RANDOM

velero restore create $restore_name \
	--from-backup $backup_name \

echo " "
echo "-------"

velero restore get
