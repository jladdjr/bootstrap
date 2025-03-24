#!/bin/bash

# from https://stackoverflow.com/a/55313834

wsNext=$(( $( i3-msg -t get_workspaces | jq '.[] | select(.focused).num' ) + $1))
i3-msg move container to workspace $wsNext
i3-msg workspace $wsNext
