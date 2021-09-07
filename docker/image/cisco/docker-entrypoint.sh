#!/bin/sh

if [ -z "$ANYCONNECT_SERVERCERT" ]; then
  (
    echo yes
    echo $ANYCONNECT_PASSWORD
  ) | openconnect $ANYCONNECT_SERVER --user=$ANYCONNECT_USER --timestamp
else
  (
    echo yes
    echo $ANYCONNECT_PASSWORD
  ) | openconnect $ANYCONNECT_SERVER --user=$ANYCONNECT_USER --servercert=$ANYCONNECT_SERVERCERT --timestamp
fi
