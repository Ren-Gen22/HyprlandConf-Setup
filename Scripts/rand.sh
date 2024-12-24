#!/bin/bash
clear
clean(){
    clear
    exit
}
trap clean SIGINT
while :
do
    tput cup 0 0
    playerctl metadata

done
