#!/bin/bash

current_ws=$(hyprctl monitors -j | jq -r '.[0].activeWorkspace.id')

if [ "$1" == "down" ]; then
    next_ws=$((current_ws + 1))
    hyprctl dispatch workspace $next_ws
elif [ "$1" == "up" ]; then
    if [ "$current_ws" -gt 1 ]; then
        prev_ws=$((current_ws - 1))
        hyprctl dispatch workspace $prev_ws
    else
        hyprctl dispatch workspace 1
    fi
fi
