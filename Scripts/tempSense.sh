#!/bin/bash
#sudo service kmod start
clear
clean(){
    clear
    exit
}
trap clean SIGINT
while :
    do
        tput cup 0 0
        sensors
        #sleep 1
done
