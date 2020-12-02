#!/bin/bash
trap "exit" SIGINT
## comment out the next line to show this is the one removed 
## INTERVAL=$1
mkdir /var/htdocs
while :
do
  echo Configured to generate new fortune every $INTERVAL seconds
  echo $(date) Writing fortune to /var/htdocs/index.html
  /usr/games/fortune > /var/htdocs/index.html
  sleep $INTERVAL
done
