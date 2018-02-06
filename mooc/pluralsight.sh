#!/bin/bash

PLURAL_SIGHT_COURSE=$1
PLURAL_SIGHT_USERNAME=  # write your username here
PLURAL_SIGHT_PASSWORD=  # write your password here


youtube-dl \
  --username $PLURAL_SIGHT_USERNAME \
  --password $PLURAL_SIGHT_PASSWORD \
  https://www.pluralsight.com/courses/$PLURAL_SIGHT_COURSE \
  -o "/home/mgonul/Videos/%(playlist)s/%(chapter_number)s. %(chapter)s/%(playlist_index)s. %(title)s.%(ext)s" \
  --sleep-interval 35 \
  --max-sleep-interval 120 \
  --sub-lang en \
  --sub-format srt \
  --write-sub

