#!/bin/bash

clean(){
    clear
    exit
}
trap clean SIGINT
clear

while :
do
    tput cup 0 0
    nvidia-smi
    sleep 1
done

