#!/usr/bin/env bash

STATUS_FILE=/tmp/quay_status_check

if [ ! -f $STATUS_FILE ]; then
    echo "(Quay status: ?)" > $STATUS_FILE
fi

# only run once every five minutes
if [ "$(date +%S)" != 00 ] || [[ ! "$(date +%M)" =~ .*[05]$ ]]; then
    cat $STATUS_FILE
    exit
fi

# update status file
raw_status=$(curl -s https://status.quay.io/api/v2/status.json)
status=$(echo $raw_status | jq ".status.indicator")

if [ $status != \""none\"" ]; then
    description=$(echo $raw_status | jq -r ".status.description")
    echo "$description" | tee $STATUS_FILE
else
    echo "" | tee $STATUS_FILE
fi
