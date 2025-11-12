#!/bin/bash

CTL_FILE="/tmp/mp3-audio.ctl"

if [ ! -f "$CTL_FILE" ]; then
  echo "0" >"$CTL_FILE"
  exit 0
fi

VALUE=$(cat "$CTL_FILE")

if [ "$VALUE" = "0" ]; then
  NEW_VALUE="1"
else
  NEW_VALUE="0"
fi

echo "$NEW_VALUE" >"$CTL_FILE"
