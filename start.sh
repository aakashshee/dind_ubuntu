#!/bin/bash

service ssh start
service ssh enable

dockerd &

sleep 2

# By some strange reason we need to do echo command to get to the next command
echo " "


while :; do echo 'Press <CTRL+C> to exit.'; sleep 1; done

