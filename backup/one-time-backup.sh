#!/bin/bash

# Use Velero to create an one-time snapshot
# of k8s persistent volumes in the default namespace.

backup_name=$2
namespace=$1
storage_location="azure"
snapshot_location="default"

if [ -z "$1" ]; then

	echo "Usage: ./one-time-backup [namespace] [backup-name]";
else
	velero backup create $backup_name-$RANDOM \
		--include-namespaces $namespace \
		--storage-location $storage_location \
		--snapshot-volumes \
		--volume-snapshot-locations $snapshot_location
fi
