#!/bin/bash

aws emr terminate-clusters --cluster-ids $(aws emr list-clusters --active | jq -r '.Clusters|.[0]|.Id')
