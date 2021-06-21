# Velero.io Quick Delpoy

## Installation

Make sure you have an Azure Kubernetes Cluster up and running.  

Make sure you have an Azure Storage Account with a container, create a service principal and make it a "Storage Account Contributor" on that storage account.  

Copy the file `azure-credentials.sample` as `azure-credentials` and fill out the required variables.  

Next, run `deploy-velero.sh`. In a few seconds the service should be up and running.

#### Velero CLI

If you need to install the CLI, you could do this as follows
```bash
version="v1.6.0"

wget https://github.com/vmware-tanzu/velero/releases/download/$version/velero-$version-linux-amd64.tar.gz
tar xf velero-$version-linux-amd64.tar.gz
sudo cp velero-$version-linux-amd64/velero /usr/local/sbin/
rm -Rf velero-v1.6.0-linux-amd64*
```
