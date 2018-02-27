#!/bin/bash

if [ $# -eq 0 ]
  then
    printf "Please specify a program\n"
  else 
    as "$1".s -o "$1".o
    if [ $? -eq 0 ] 
      then
        printf "Assembly Successful...\n\n"
        ld "$1".o -o "$1"
        if [ $? -eq 0 ]
          then 
            printf "\nLinking Successful\n"
            rm "$1".o
          else
            printf "\nSomthing went wrong...\n"
        fi
      else
        printf "\nSomething went wrong...\n"
    fi
fi
