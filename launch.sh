#!/bin/sh
source /opt/env.sh
tmux new-session -d "softIocPVA -d $1"
sleep infinity & wait