#!/bin/bash
PATH=/usr/bin
ALERT="Clamav 检测到签名: $CLAM_VIRUSEVENT_VIRUSNAME 在 $CLAM_VIRUSEVENT_FILENAME"

for ADDRESS in /run/user/*; do
    USERID=${ADDRESS#/run/user/}
    /sbin/sudo -u "#$USERID" DBUS_SESSION_BUS_ADDRESS="unix:path=$ADDRESS/bus" PATH=${PATH} \
	    /sbin/gdbus call --session \
	    --dest=org.freedesktop.Notifications \
	    --object-path=/org/freedesktop/Notifications \
	    --method=org.freedesktop.Notifications.Notify \
	    "" 0 "" '🦠 存在病毒' "$ALERT" \
	    '[]' '{"urgency": <1>}' 0
done
