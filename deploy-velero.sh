#!/bin/bash

# Deploy Velero server components with Helm.
# Make sure you added the vmware-tanzu repository.

namespace="velero"
credentials_file_path="./azure-credentials"
provider="azure"
plugin="microsoft-azure"
provider_plugin_tag="v1.2.0"
resource_group=""
storage_container=""
storage_account_name=""


helm upgrade --install velero vmware-tanzu/velero \
--namespace $namespace \
--set-file credentials.secretContents.cloud=$credentials_file_path \
--set configuration.provider=$provider \
--set configuration.backupStorageLocation.name=$provider \
--set configuration.backupStorageLocation.bucket=$storage_container \
--set configuration.backupStorageLocation.config.resourceGroup=$resource_group \
--set configuration.backupStorageLocation.config.storageAccount=$storage_account_name \
--set configuration.volumeSnapshotLocation.name=$providers \
--set configuration.volumeSnapshotLocation.config.resourceGroup=$resource_group \
--set initContainers[0].name=velero-plugin-for-$provider \
--set initContainers[0].image=velero/velero-plugin-for-$plugin:$provider_plugin_tag \
--set initContainers[0].volumeMounts[0].mountPath=/target \
--set initContainers[0].volumeMounts[0].name=plugins

