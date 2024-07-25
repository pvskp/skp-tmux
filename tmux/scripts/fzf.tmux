#! /usr/bin/env bash
fzf --prompt="  " --pointer=" " --border=sharp \
  --border-label="Sessionizer" \
  --no-scrollbar \
  --no-separator \
  --header="Choose a repository" \
  --color="gutter:-1" \
  --color="pointer:magenta" \
  --color="prompt:green" \
  --color="label:green:bold" \
  --color="info:yellow" \
  --color="border:green"
