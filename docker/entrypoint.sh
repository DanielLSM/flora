#!/bin/sh
# This script is the entrypoint for the Docker image.
# Taken from https://github.com/openai/gym/

set -ex

## Wait for the file to come up
display=1
file="/tmp/.X11-unix/X$display"
#
##rm file
##rm "/tmp/.X$display"
#
## Set up display; otherwise rendering will fail
Xvfb :1 -screen 0 1024x768x24 &
export DISPLAY=:1

cd /root/code/rl_zoo/

exec "$@"

shutdown -h now
