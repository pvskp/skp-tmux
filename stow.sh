#!/usr/bin/env bash
base_dir=$(dirname "$(realpath "$0")")

finished_with_errors=0

# if [ ! -d "$HOME/.tmux/" ]; then
#   echo "Warning: missing '.tmux/'. creating..."
#   mkdir ~/.tmux/
# fi

ln -s "$base_dir/tmux/" "$HOME/.tmux"
if [ $? -ne 0 ]; then
  echo "Error: failed to export .tmux/"
  finished_with_errors=1
fi

ln -s "$base_dir/tmux.conf" "$HOME/.tmux.conf"
if [ $? -ne 0 ]; then
  echo "Error: failed to export .tmux.conf"
  finished_with_errors=1
fi

if [ $finished_with_errors -ne 0 ]; then
  echo "Warning: one or more failed to export"
else
  echo "Success: installed tmux config"
fi

