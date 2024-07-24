#! /usr/bin/bash

fzfc="$HOME/dotfiles/.local/bin/fzfc"

if [ -z "$(pgrep tmux)" ]
then
    bash -c $HOME/.dotfiles/scripts/tmux-sessionizer
    exit 0
else
    CHOOSED_SESSION=`tmux ls | cut -d ':' -f 1 | $fzfc`

    if [ -n "$CHOOSED_SESSION" ]
    then
        if [ -z "$TMUX" ]
        then
            tmux attach -t $CHOOSED_SESSION
        else
            tmux switch -t $CHOOSED_SESSION
        fi
    else
        echo "No option was selected."
        exit 0
    fi
fi
