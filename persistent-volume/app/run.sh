#!/bin/sh

# Script that shows that the data is persisted between pods even after they're killed.
# It also shows that the local mount in minikube is active, by scavenging the mount and 
# showing any changes in it.

# if audit does not exist yet, create folder and add a timestamp file in it
if [[ ! -d $VOLUME/audit ]]; then
    mkdir $VOLUME/audit
    echo "Config created in $(date -u)" > $VOLUME/audit/timestamp
fi

# show the creation date (this should be the same between pods)
cat "$VOLUME/audit/timestamp"

# Volume scavenger
while true; do
    ls -la $VOLUME
    /bin/sleep 10
done
