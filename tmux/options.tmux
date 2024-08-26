#!/usr/bin/env bash
source ~/.tmux/api.tmux

set -g status-position top

# Start windows and panes at 1, not 0
set -g base-index 1
setw -g pane-base-index 1

# Fix C-Left and C-Right
setw -g xterm-keys on
set -sg escape-time 10
set -g mouse on

set -g default-terminal "tmux-256color"
set -ga terminal-features ",alacritty:usstyle"
set -ga terminal-overrides ",tmux-256color:Tc"

# --<< Pane coloring >>--
set -g pane-active-border-style "bg=default fg=white"
set -g pane-border-style "bg=default fg=colour241"
