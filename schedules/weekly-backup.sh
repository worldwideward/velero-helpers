#!/bin/bash

# An example schedule for a weekly Velero backup

schedule_name="website"
schedule="0 3 * * 1"
retention="1440h0m0s"
namespace="default"
storage_location="azure"
snapshot_location="default"

# Set Azure as the default location, if this is not yet so.
velero backup-location set azure --default

velero schedule create $schedule_name \
	--schedule "$schedule" \
	--ttl $retention \
	--include-namespaces $namespace \
	--storage-location $storage_location \
	--snapshot-volumes \
	--volume-snapshot-locations $snapshot_location
