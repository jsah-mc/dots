#!/bin/sh
# Outputs all workspaces as circles, filled for active
# Make executable: chmod +x ~/.config/eww/scripts/workspaces.sh

# Extract active workspace from hyprctl monitors
active=$(hyprctl monitors | grep "active workspace:" | awk '{print $3}' | tr -d '()')

# Number of workspaces
total=4

output=""

for i in $(seq 1 $total); do
    if [ "$i" = "$active" ]; then
        output="$output● "
    else
        output="$output○ "
    fi
done

echo "$output"
