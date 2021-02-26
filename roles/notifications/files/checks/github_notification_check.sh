#!/usr/bin/env bash

STATUS_FILE=/tmp/gh_notification_count

if [ ! -f $STATUS_FILE ]; then
    echo "?" > $STATUS_FILE
fi

# don't check outside of working hours
if [[ "$(date +%H)" -lt 8 || "$(date +%H)" -gt 17 ]]; then
    status=$(cat "${STATUS_FILE}")
    echo "${status}*"
    exit
fi

# only run once a minute
if [ "$(date +%S)" != 00 ]; then
    cat $STATUS_FILE
    exit
fi

# update status file
cat $STATUS_FILE > ${STATUS_FILE}.old
raw_notifications=$(curl -s -H "Authorization: token ${GITHUB_TOKEN}" https://api.github.com/notifications)
echo $raw_notifications | jq ". | length" | tee $STATUS_FILE

# compare new / old status
new=$(cat $STATUS_FILE)
old=$(cat ${STATUS_FILE}.old)

if [ $new -gt $old ]; then
    # get issue title
    raw_latest_notification=$(echo $raw_notifications | jq -r "sort_by(-(.id | tonumber))[0]")
    title=$(echo $raw_latest_notification | jq -r ".subject.title")
    latest_comment_api_url=$(echo $raw_latest_notification | jq -r ".subject.latest_comment_url")
    latest_comment_url=$(curl -s -H "Authorization: token ${GITHUB_TOKEN}" ${latest_comment_api_url} | jq -r ".html_url")

    # mac notification
    echo $title > ${STATUS_FILE}.title
    /usr/bin/jim/notifications/notify "${title}"

    sleep 5

    # open link on host
    echo ${latest_comment_url} > ${STATUS_FILE}.latest_comment_url
    /usr/bin/jim/open_link_on_host ${latest_comment_url}
fi
