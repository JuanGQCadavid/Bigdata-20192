#!/bin/bash                                                                 

if [ $(which jq) ]
then
    echo "Jq is installed"
else
    echo "No jq installed"
    sudo apt-get install jq
fi


CLUSTER_TO_REMOVE=$(aws emr list-clusters --active | jq -r '.Clusters|.[0]|.Id')

echo "Removing $CLUSTER_TO_REMOVE" 

aws emr terminate-clusters --cluster-ids $CLUSTER_TO_REMOVE
