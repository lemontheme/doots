#!/usr/bin/env bash

if [ "$(dark-mode status)" == 'off' ]; then
    tmux set-option -g @rose_pine_variant 'dawn' 
else
    tmux set-option -g @rose_pine_variant 'moon' 
fi
