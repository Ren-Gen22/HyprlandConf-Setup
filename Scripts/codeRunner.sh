#!/bin/bash

echo "File Name: $1"
IFS='.'
read -ra newarr <<< "$1"
tempPath=~/codeTemp/
#echo "${#newarr[@]}" #length
fileType=${newarr[-1]}
#echo "File Type :$fileType"
case "$fileType" in
    sh)
        echo "Script file Output:"
        echo
        ./"$1"
        ;;
    py)
        echo "Python File Output:"
        echo "------------------------------"
        python "$1"
        echo "------------------------------"
        ;;
    cpp)
        echo "C++ File Output:"
        echo "------------------------------"
        fp=$tempPath$newarr[-2]
        g++ "$1" -o $fp && $fp && rm $fp 
        echo "------------------------------"
        ;;
    c)
        echo "C file Output:"
        echo "------------------------------"
        fp=$tempPath${newarr[-2]}
        gcc "$1" -o $fp && $fp && rm $fp
        echo "------------------------------"        ;;
    *)
        echo "Invalid file type!!!"
        ;;
esac

