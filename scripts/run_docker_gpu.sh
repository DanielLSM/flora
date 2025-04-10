#!/bin/bash
# Launch an experiment using the docker gpu image

cmd_line="$@"

echo "Executing in the docker (gpu image):"
echo $cmd_line

winpty docker run -it  --gpus all --network host --ipc=host \
  yourname/bpref-cpu:latest \
  bash -c "cd /root/code/rl_zoo/ && $cmd_line"

sleep 10