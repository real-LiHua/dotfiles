#!/bin/bash
PATH=/usr/bin
ALERT="Clamav 检测到签名: $CLAM_VIRUSEVENT_VIRUSNAME 在 $CLAM_VIRUSEVENT_FILENAME"

for ADDRESS in /run/user/*; do
    USERID=${ADDRESS#/run/user/}
    /usr/bin/sudo -u "#$USERID" DBUS_SESSION_BUS_ADDRESS="unix:path=$ADDRESS/bus" PATH=${PATH} \
        /usr/bin/notify-send -u critical -i dialog-warning "🦠 存在病毒" "$ALERT"
done
