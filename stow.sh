#!/usr/bin/env bash
base_dir=$(dirname "$(realpath "$0")")

finished_with_errors=0

if [ -L "$HOME/.tmux" ]; then
 echo "Error: .tmux/ symbolic link already exists. Delete it first."
 exit 1
fi

ln -s "$base_dir/tmux/" "$HOME/.tmux"
if [ $? -ne 0 ]; then
  echo "Error: failed to export ~/.tmux/"
  finished_with_errors=1
fi

tmux_conf="$HOME/.tmux.conf"
if [ -L "$tmux_conf" ]; then
 echo "Error: ~/.tmux.conf symbolic link already exists. Delete it first."
 exit 1
fi

ln -s "$base_dir/tmux.conf" "$tmux_conf"
if [ $? -ne 0 ]; then
  echo "Error: failed to export .tmux.conf"
  finished_with_errors=1
fi

if [ $finished_with_errors -ne 0 ]; then
  echo "Warning: one or more failed to export"
else
  echo "Success: installed tmux config"
fi

