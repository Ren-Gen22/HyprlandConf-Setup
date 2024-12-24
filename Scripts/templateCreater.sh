#!/bin/bash

while getopts "hvf:" flag; do
 case $flag in
   cpp)       
       echo "Created C++ file"
       cp ~/Templates/cplus.cpp ./"$filename"
   ;;
    py)       
        echo "Created python file"
        cp ~/Templates/Python.py ./"$filename"
   ;;

   f)    filename=$OPTARG
   echo "$filename"
   ;;
   \?)
       echo "invalid"
   ;;
 esac
done
