#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Power Menu (with direct key bindings)

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Theme Elements
prompt="`hostname`"
mesg="Uptime : `uptime -p | sed -e 's/up //g'`"

if [[ ( "$theme" == *'type-1'* ) || ( "$theme" == *'type-3'* ) || ( "$theme" == *'type-5'* ) ]]; then
	list_col='1'
	list_row='6'
elif [[ ( "$theme" == *'type-2'* ) || ( "$theme" == *'type-4'* ) ]]; then
	list_col='6'
	list_row='1'
fi

# Options
layout=`cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2`
if [[ "$layout" == 'NO' ]]; then
	option_1=" Lock (l)"
	option_2=" Logout (o)"
	option_3=" Suspend (u)"
	option_4=" Hibernate (h)"
	option_5=" Reboot (r)"
	option_6=" Shutdown (s)"
	yes=' Yes'
	no=' No'
else
	option_1=" (l)"
	option_2=" (o)"
	option_3=" (u)"
	option_4=" (h)"
	option_5=" (r)"
	option_6=" (s)"
	yes=''
	no=''
fi

# Rofi CMD with Key Bindings
rofi_cmd() {
	rofi -theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-theme-str 'textbox-prompt-colon {str: "";}' \
		-dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		-markup-rows \
		-kb-custom-1 "l" \
		-kb-custom-2 "o" \
		-kb-custom-3 "u" \
		-kb-custom-4 "h" \
		-kb-custom-5 "r" \
		-kb-custom-6 "s" \
		-theme ${theme}
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {orientation: vertical; children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${theme}
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Confirm and execute
confirm_run () {	
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		${1} && ${2} && ${3}
	else
		exit
	fi	
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]] || [[ "$1" == '--kb-custom-1' ]]; then
		betterlockscreen -l
	elif [[ "$1" == '--opt2' ]] || [[ "$1" == '--kb-custom-2' ]]; then
		logout
	elif [[ "$1" == '--opt3' ]] || [[ "$1" == '--kb-custom-3' ]]; then
		confirm_run 'mpc -q pause' 'amixer set Master mute' 'systemctl suspend' 'betterlockscreen -l'
	elif [[ "$1" == '--opt4' ]] || [[ "$1" == '--kb-custom-4' ]]; then
		confirm_run 'systemctl hibernate'
	elif [[ "$1" == '--opt5' ]] || [[ "$1" == '--kb-custom-5' ]]; then
		confirm_run 'systemctl reboot'
	elif [[ "$1" == '--opt6' ]] || [[ "$1" == '--kb-custom-6' ]]; then
		confirm_run 'systemctl poweroff'
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
    $option_3)
		run_cmd --opt3
        ;;
    $option_4)
		run_cmd --opt4
        ;;
    $option_5)
		run_cmd --opt5
        ;;
    $option_6)
		run_cmd --opt6
        ;;
    --kb-custom-1)
        run_cmd --kb-custom-1
        ;;
    --kb-custom-2)
        run_cmd --kb-custom-2
        ;;
    --kb-custom-3)
        run_cmd --kb-custom-3
        ;;
    --kb-custom-4)
        run_cmd --kb-custom-4
        ;;
    --kb-custom-5)
        run_cmd --kb-custom-5
        ;;
    --kb-custom-6)
        run_cmd --kb-custom-6
        ;;
esac
