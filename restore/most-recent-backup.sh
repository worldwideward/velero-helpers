#!/bin/bash

# Restore the most recent backup created by Velero.

most_recent_backup=$(velero backup get | tail -n 1 | awk '{ print $1 }')

restore_name=$most_recent_backup-$RANDOM

echo "Attempting to restore $most_recent_backup"
read -p "Continue? (y/n) " x

case $x in

	y|Y)
		velero restore create $restore_name \
			--from-backup $most_recent_backup \
		;;
	n|N)
		echo "Abort operation"
		;;
	*)
		echo "ERROR: please type 'y' or 'n'"
esac
