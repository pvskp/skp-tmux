#!/usr/bin/env bash

# Inspiration from https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer

fzfc="$HOME/dotfiles/.local/bin/fzfc"

if [[ $# -eq 1 ]]; then
  selected=$1
else
  dirs=$(find ~/Documents/repos/ -mindepth 1 -maxdepth 1 -type d)
  config_dirs=$(find ~/.config/ -mindepth 1 -maxdepth 1 -type d,l)
  dirs="${dirs}"$'\n'"${config_dirs}"
  dirs="${dirs}"$'\n'"$HOME/dotfiles/"
  dirs="${dirs}"$'\n'"$HOME/syncthing/personal-vault-obsidian/"
  dirs="${dirs}"$'\n'"$HOME/.config/nvim"
  selected=$(echo "${dirs}" | $fzfc)
fi

if [[ -z $selected ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]]; then
  # Checks if session already exists
  tmux has-session -t $selected_name 2>/dev/null

  # If don't, creates it
  if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
  fi

  # otherwise, attach
  tmux attach-session -t $selected_name
  exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
  tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
