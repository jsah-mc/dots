#!/bin/sh

if iwctl station wlan0 show | grep -q "connected"; then
    icon=""
    ssid=Sahnet
    status="Connected to ${ssid}"
elif cat /sys/class/net/eno1/operstate | grep -q "up"; then
    icon="󰌗"
    status="Conected to Wired"
else
    icon="睊"
    status="offline"
fi

echo "{\"icon\": \"${icon}\", \"status\": \"${status}\"}" 
