#!/bin/bash

# Check if we have get_iplayer
if [[ ! -f /usr/local/bin/youtube-dl ]]
then
  /root/update.sh start
fi

if [[ ! -f /usr/local/bin/youtube-dl ]]
then  # pause for checking things out...
  echo err1 - Error occurred, pausing for 9999 seconds for investigation
  sleep 9999
fi

# Set some nice defaults
#if [[ ! -f /root/.get_iplayer/options ]]
#then
#  echo No options file found, adding some nice defaults...
#  /root/get_iplayer --prefs-add --whitespace
#  /root/get_iplayer --prefs-add --subs-embed
#  /root/get_iplayer --prefs-add --metadata
#  /root/get_iplayer --prefs-add --nopurge
  
#  echo Removing non-standard download location from existing PVR files...
  # so downloads don't get saved in the container
#  sed -i '/^output/d' /root/.get_iplayer/pvr/*
#fi

# Force output location to a separate docker volume
#echo Forcing output location...
#/root/get_iplayer --prefs-add --output="/root/output/"

if [[ -f /usr/local/bin/youtube-dl-webui ]]
then
  # Start cron
  #service cron start
  
  # Keep restarting - for when the get_iplayer script is updated
  while true
  do
    /usr/local/bin/youtube-dl-webui -c /root/config/youtube-dl-webui.conf
  done 
else
  echo err2 - Error occurred, pausing for 9999 seconds for investigation
  sleep 9999 # when testing, keep container up long enough to check stuff out
fi
