#!/usr/bin/env bash

timestamp_file="/var/mapped/tmp/elapsed_time"
if [ ! -f "$timestamp_file" ]; then
    exit
fi
start=$(cat $timestamp_file)

now=$(date +%s)
diff_in_secs=$(( now - start ))
if (( $diff_in_secs == $now )); then
    exit
fi

diff_in_mins=$(( diff_in_secs / 60 ))
diff_in_hours=$(( diff_in_mins / 60 ))
diff_in_days=$(( diff_in_hours / 24 ))

time=${diff_in_secs}
unit="sec"
if (( $diff_in_secs > 59 )); then
    time=${diff_in_mins}
    unit="min"
fi
if (( $diff_in_mins > 59 )); then
    time=${diff_in_hours}
    unit="hour"
fi
if (( $diff_in_hours > 23 )); then
    time=${diff_in_days}
    unit="day"
fi

if (( $time > 1 )); then
    unit="${unit}s"
fi
echo "$time $unit"
