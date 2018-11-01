#!/bin/sh

set -e

if [ -z "$SYNC_INTERVAL_SECONDS" ] || [ "$SYNC_INTERVAL_SECONDS" -eq 0 ]; then
    exec /usr/bin/rclone "$@"
fi

# Default is to loop every $SYNC_INTERVAL_SECONDS seconds
while true; do
    /usr/bin/rclone "$@"
    sleep "$SYNC_INTERVAL_SECONDS"
done
