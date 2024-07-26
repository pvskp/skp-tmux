#! /usr/bin/env bash
fzf --prompt="  " --pointer=" " --border=sharp \
    --border-label="Sessionizer" \
    --no-scrollbar \
    --no-separator \
    --header="Choose a repository" \
    --color="gutter:-1" \
    --color="pointer:blue" \
    --color="prompt:green" \
    --color="label:green:bold" \
    --color="info:yellow" \
    --color="current-bg:gray" \
    --color="border:green"
