#!/usr/bin/env bash

STATUS_FILE=/tmp/slack_status_check

if [ ! -f $STATUS_FILE ]; then
    echo "(Slack status: ?)" > $STATUS_FILE
fi

# only run once every five minutes
if [ "$(date +%S)" != 00 ] || [[ ! "$(date +%M)" =~ .*[05]$ ]]; then
    cat $STATUS_FILE
    exit
fi

# update status file
raw_status=$(curl -s https://status.slack.com/api/v2.0.0/current)
num_incidents=$(echo $raw_status | jq ".active_incidents | length")

if [ "$num_incidents" != "0" ]; then
    title=$(echo $raw_status | jq -r ".active_incidents[0].title")
    echo "$title" | tee $STATUS_FILE
else
    echo "" | tee $STATUS_FILE
fi
