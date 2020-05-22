#!/bin/bash

DEVICE="38:18:4C:7C:99:1E"

# TODO: do `bt-device -l` use bash tool to get WH-... line & RegEx to extract adress

# TODO disconnect with bluetoothctl
bt-device -d $DEVICE

coproc bluetoothctl
echo -e 'connect 38:18:4C:7C:99:1E\nexit' >&${COPROC[1]}
output=$(cat <&${COPROC[0]})
# echo $output

# pacmd set-card-profile "bluez_card.38_18_4C_7C_99_1E" a2dp_sink
