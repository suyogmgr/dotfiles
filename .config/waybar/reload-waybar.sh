#!/bin/bash

# Kill all running waybar instances
killall waybar

# Wait for the processes to fully terminate
sleep 1

# Restart waybar
waybar & disown
