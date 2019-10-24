#!/bin/bash                                                                 

if [ $(which jq) ]
then
    echo "Jq is installed"
else
    echo "No jq installed"
    sudo apt-get install jq
fi

aws emr terminate-clusters --cluster-ids $(aws emr list-clusters --active | jq -r '.Clusters|.[0]|.Id')
