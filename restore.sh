#!/bin/bash

# Restore the most recent backup created by Velero.

most_recent_backup=$(velero backup get | tail -n 1 | awk '{ print $1 }')

velero restore create restore-website \
	--from-backup $most_recent_backup \
