#!/bin/sh
export LANG=en_US.UTF-8
tmux new-session -d 'watch timew summary'
tmux split-window -v 'tasksh'
tmux attach
tmux reflow
