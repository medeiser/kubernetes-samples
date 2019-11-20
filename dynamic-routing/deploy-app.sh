#!/usr/bin/env bash

#
# Shell script for deploying a service dynamically using the config map template 'deployment-template.yaml'
# 
# Usage: ./deploy-app.sh <app-name> <app-port>
#

set -euxo pipefail

# validate input
if [ "$#" -ne 2 ]
then
  echo "$0: Expected mandatory arguments <app-name>> and <app-port>"
	exit 3
fi

# replace application name and port variables
CONFIG_MAP=`cat "deployment-template.yaml" | sed "s/{{APP}}/$1/g" | sed "s/{{PORT}}/$2/g"`

# deploy service
echo "$CONFIG_MAP" | kubectl apply -f -
