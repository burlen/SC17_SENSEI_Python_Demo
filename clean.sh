#!/bin/bash
trap 'echo "# $BASH_COMMAND"' DEBUG

rm -f *.png *.mkv *.bp
