#!/bin/sh
export LANG=en_US.UTF-8
tmux new-session -d
tmux split-window -h 'broot --sizes' 
tmux split-window -v 'speedometer.py -tx eth0 -rx eth0' 
tmux attach
tmux reflow
