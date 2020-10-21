#!/usr/bin/env bash

STATUS_FILE=/tmp/gh_notification_count

if [ ! -f $STATUS_FILE ]; then
    echo "?" > $STATUS_FILE
fi

# only run once a minute
if [ "$(date +%S)" != 00 ]; then
    cat $STATUS_FILE
    exit
fi

. /var/git/zuul-alert/token.sh
cat $STATUS_FILE > ${STATUS_FILE}.old
curl -s -H "Authorization: token ${GITHUB_TOKEN}" https://api.github.com/notifications | jq ". | length" | tee $STATUS_FILE

new=$(cat $STATUS_FILE)
old=$(cat ${STATUS_FILE}.old)

# if there's a new notification
# .. send a mac notification
# .. and automatically open the link (again, on the mac host)
if [ $new -gt $old ]; then
    # TODO: save json response and parse saved response, instead of making repeat requests
    title=$(curl -s -H "Authorization: token ${GITHUB_TOKEN}" https://api.github.com/notifications | jq -r ". | sort_by(-(.id | tonumber))[0].subject.title")
    latest_comment_url=$(curl -s -H "Authorization: token ${GITHUB_TOKEN}" https://api.github.com/notifications | jq -r ". | sort_by(-(.id | tonumber))[0].subject.latest_comment_url")
    latest_comment_api_url=$(curl -s -H "Authorization: token ${GITHUB_TOKEN}" https://api.github.com/notifications | jq -r ". | sort_by(-(.id | tonumber))[0].subject.latest_comment_url")
    latest_comment_url=$(curl -s -H "Authorization: token ${GITHUB_TOKEN}" ${latest_comment_api_url} | jq -r ".html_url")

    # mac notification
    /usr/bin/jim/notifications/notify "${title}"

    # open link on host
    /usr/bin/jim/open_link_on_host ${latest_comment_url}
fi
