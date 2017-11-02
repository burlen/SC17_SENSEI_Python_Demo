#!/bin/bash
trap 'echo "# $BASH_COMMAND"' DEBUG

image_template=$1
frame_rate=$2

ffmpeg -loglevel panic -i ${image_template} -y -c:v libx264 -preset ultrafast -crf 22 -r ${frame_rate} output.mkv
mplayer -vo x11 -really-quiet -loop 0 output.mkv
