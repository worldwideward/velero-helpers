#!/bin/bash

# Use Velero to create an one-time snapshot
# of k8s persistent volumes in the default namespace.

backup_name="kube-backup"
namespace="default"
storage_location="azure"
snapshot_location="default"

velero backup create $backup_name \
	--include-namespaces $namespace \
	--storage-location $storage_location \
	--snapshot-volumes \
	--volume-snapshot-locations $snapshot_location

