#!/bin/bash
session="cardano"
# Check if the session exists, discarding output
# We can check $? for the exit status (zero for success, non-zero for failure)
# border colours



tmux has-session -t $session 2>/dev/null
if [ $? != 0 ]; then
 tmux attach-session -t $session
 tmux new -s "cardano" -n "node" -d
 tmux split-window -v
 tmux split-window -h
 tmux select-pane -t 'cardano:node.0'
 tmux split-window -h
 tmux send-keys -t 'cardano:node.0' '/home/cardano/cardano/nodes/core1/scripts/cnode.sh' Enter
 tmux send-keys -t 'cardano:node.1' '/home/cardano/cardano/nodes/relay1/scripts/cnode.sh' Enter
 tmux send-keys -t 'cardano:node.2' '/home/cardano/cardano/nodes/relay2/scripts/cnode.sh' Enter
 tmux send-keys -t 'cardano:node.3' '' Enter

fi

tmux attach-session -t $session
