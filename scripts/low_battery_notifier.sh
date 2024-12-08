#!/bin/bash

while true; do
    notify-send -u critical "Low Battery" "Your battery is low. Please charge your device."
    
    sleep 30  # seconds
done
