#!/bin/bash
tmux send-keys 'C-a'
tmux copy-mode
tmux send-keys 'v$h' Enter
