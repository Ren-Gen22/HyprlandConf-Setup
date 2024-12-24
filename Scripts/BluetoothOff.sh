#!/bin/bash

controller=$(bluetoothctl list | head -n 1 | awk '{print $2}')

state=$(bluetoothctl show "$controller" | grep "Powered:" | awk '{print $2}')

if [ "$state" = "yes" ]; then
    echo -e 'power off\nexit' | bluetoothctl
    if [ $? -eq 0 ]; then
        notify-send -i bluetooth-disabled " Bluetooth Disabled"
    else
        notify-send -i dialog-error " Failed to disable Bluetooth!!"
    fi
#else
#    echo -e 'power on\nexit' | bluetoothctl
#    if [ $? -eq 0 ]; then
#        notify-send -i bluetooth-active "Bluetooth" "Enabled"
#    else
#        notify-send -i dialog-error "Bluetooth" "Failed to enable Bluetooth"
#    fi
fi
