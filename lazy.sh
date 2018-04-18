#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "Please specify a file"
  else 
    as "$1".s -o "$1".o
    if [ $? -eq 0 ] 
      then
        #Assembly succeeds
        ld "$1".o -o "$1"
        if [ $? -eq 0 ]
          then 
            #Linking succeeds 
            rm "$1".o
          else
            echo -e "\nLinking unsuccessful... exit code: $?"
            rm "$1".o
        fi
      else
        echo -e "\nAssembly unsuccessful... exit code: $?"
    fi
fi
