#!/usr/bin/env bash
set -euo pipefail

# Detect display names dynamically
HDMI=$(swaymsg -t get_outputs | jq -r '.[] | select(.name | test("HDMI")) | .name' || echo "")
LAPTOP=$(swaymsg -t get_outputs | jq -r '.[] | select(.name | test("eDP")) | .name' || echo "")

# Validate detection
if [[ -z "$LAPTOP" ]]; then
    echo "No laptop display (eDP) found. Exiting."
    exit 1
fi

if [[ -n "$HDMI" ]]; then
    HDMI_ACTIVE=$(swaymsg -t get_outputs | jq -r --arg HDMI "$HDMI" '.[] | select(.name == $HDMI) | .active')

    if [[ "$HDMI_ACTIVE" == "true" ]]; then
        swaymsg "output $HDMI enable"
        swaymsg "output $LAPTOP enable"
        sleep 1

        # Move odd-numbered workspaces to HDMI
        for ws in 1 3 5 7 9; do
            swaymsg "workspace $ws"
            swaymsg "move workspace to output $HDMI"
        done

        # Move even-numbered workspaces to LAPTOP
        for ws in 2 4 6 8 10; do
            swaymsg "workspace $ws"
            swaymsg "move workspace to output $LAPTOP"
        done

        exit 0
    fi
fi

# Fallback: HDMI not connected, use laptop only
swaymsg "output $LAPTOP enable"
for ws in {1..10}; do
    swaymsg "workspace $ws"
    swaymsg "move workspace to output $LAPTOP"
done

