#!/usr/bin/env bash

STATUS_FILE=/tmp/gh_status_check

if [ ! -f $STATUS_FILE ]; then
    echo "(Github status: ?)" > $STATUS_FILE
fi

# only run once every five minutes
if [ "$(date +%S)" != 00 ] || [[ ! "$(date +%M)" =~ .*[05]$ ]]; then
    cat $STATUS_FILE
    exit
fi

# update status file
raw_status=$(curl -s https://kctbh9vrtdwd.statuspage.io/api/v2/incidents/unresolved.json)
num_incidents=$(echo $raw_status | jq ".incidents | length")

if [ "$num_incidents" != "0" ]; then
    title=$(echo $raw_status | jq -r ".incidents[0].incident_updates[0].body")
    echo "$title" | tee $STATUS_FILE
else
    echo "" | tee $STATUS_FILE
fi
