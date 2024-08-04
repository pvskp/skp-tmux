#!/usr/bin/env bash

source ~/.tmux/api.tmux

bind -n C-Left send-keys M-b
bind -n C-Right send-keys M-f

# fix
# bind C-l send-keys 'C-l'
bind -n C-l send-keys 'C-l'
bind -n C-k send-keys 'C-k'


unbind C-b
set -g prefix M-a
bind M-a send-prefix


setw -g mode-keys vi
bind -T copy-mode-vi 'v' send -X begin-selection
bind -T copy-mode-vi 'y' send -X copy-selection
bind -T copy-mode-vi 'C-c' send -X clear-selection
bind -t vi-copy V rectangle-toggle
bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xsel"


# Bind status bar toggle
bind z set-option -g status #Ctrl+F3 Combo


bind -n M-[ swap-pane -U
bind -n M-] swap-pane -D


# Remap splits
bind -n M-d split-window -h -c "#{pane_current_path}"
bind -n M-s split-window -v -c "#{pane_current_path}"

# Remap new-window
bind c new-window -c "#{pane_current_path}"

bind -n M-x kill-pane

# Go to last window
bind -n M-Tab last-window

# Go to window x
bind -n M-1 select-window -t :1
bind -n M-2 select-window -t :2
bind -n M-3 select-window -t :3
bind -n M-4 select-window -t :4
bind -n M-5 select-window -t :5
bind -n M-6 select-window -t :6
bind -n M-7 select-window -t :7
bind -n M-8 select-window -t :8
bind -n M-9 select-window -t :9

# Simple zoom
bind -n M-z resize-pane -Z

# # Keep zoom when chaging window
# bind -r k select-pane -U \;  resize-pane -Z
# bind -r j select-pane -D \;  resize-pane -Z
# bind -r h select-pane -L \;  resize-pane -Z
# bind -r l select-pane -R \;  resize-pane -Z

# and now unbind keys
unbind Up
unbind Down
unbind Left
unbind Right

unbind C-Up
unbind C-Down
unbind C-Left
unbind C-Right

bind -n M-\; last-pane \; resize-pane -Z

# Reload .tmux.conf file
bind R source-file ~/.tmux.conf \; display-message "Config reloaded."

# ---<< Neovim keybinds >>---
# tmux.nvim keybinds
# navigation
is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?\.?(view|n?vim?x?)(-wrapped)?(diff)?$'"

# Select panes
bind -n 'M-h' if-shell "$is_vim" 'send-keys M-h' 'select-pane -L'
bind -n 'M-j' if-shell "$is_vim" 'send-keys M-j' 'select-pane -D'
bind -n 'M-k' if-shell "$is_vim" 'send-keys M-k' 'select-pane -U'
bind -n 'M-l' if-shell "$is_vim" 'send-keys M-l' 'select-pane -R'

# Resize panes
bind -n 'M-Left'  if-shell "$is_vim" 'send-keys M-Left' 'resize-pane -L 1'
bind -n 'M-Down'  if-shell "$is_vim" 'send-keys M-Down' 'resize-pane -D 1'
bind -n 'M-Up'    if-shell "$is_vim" 'send-keys M-Up' 'resize-pane -U 1'
bind -n 'M-Right' if-shell "$is_vim" 'send-keys M-Right' 'resize-pane -R 1'

bind -n M-f run-shell "tmux neww ~/.tmux/scripts/switcher.tmux"
bind -n M-n run-shell "tmux neww ~/.tmux/scripts/sessionizer.tmux"
