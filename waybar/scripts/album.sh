#!/bin/bash
album_art=$(playerctl metadata mpris:artUrl)
if [[ -z $album_art ]]
then
   # spotify is dead, we should die too.
   exit
fi
curl -s  "${album_art}" --output "/tmp/cover.jpg"
echo "/tmp/cover.jpg"
