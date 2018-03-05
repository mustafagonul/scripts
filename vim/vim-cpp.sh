#!/bin/bash

SESSION_NAME=${PWD/*\//}


# Create the session
tmux new-session -s ${SESSION_NAME} -n vim-cpp -d


# Split window
tmux split-window -h -p 10


# Select first pane (1) -- vim
tmux select-pane -t 1
tmux send-keys -t ${SESSION_NAME} 'vim' C-m


# Attach session
tmux attach -t ${SESSION_NAME}

