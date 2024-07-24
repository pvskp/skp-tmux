#!/usr/bin/env bash

unbind(){
    tmux unbind "$@"
}

bind(){
    tmux bind "$@"
}

setw(){
    tmux set-window-option "$@"
}

set(){
    tmux set-option "$@"
}

