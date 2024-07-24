# skp-tmux
This repo contains my tmux dotfiles. Feel free to use it as you wish.

![image](https://github.com/user-attachments/assets/07ffb0bf-77f8-41e7-a4cb-82f4a5193302)
![image](https://github.com/user-attachments/assets/3e978f36-e4ca-473a-90aa-335378ef2551)

## Setup

```bash
$ git clone https://github.com/pvskp/skp-tmux/
$ cd skp-tmux
$ ./stow.sh
```
## "What can I take from this?"
So I spend some time searching a flexible way of configuring tmux. It took me to write a set of bash scripts to wrap tmux native API (see [api.tmux](tmux/api.tmux)). It can be extended to your needs.

## Mappings

This repository contains a customized configuration for tmux, including several key mappings to facilitate navigation and management of panes and windows. Below are the main mappings configured:

### Prefix and Vi Mode

- `Alt+a`: Prefix (replaces `Ctrl+b`).
- Vi Mode for copy:
  - `v`: Begin selection.
  - `y`: Copy selection.
  - `Ctrl+c`: Clear selection.

### Status Bar Toggle

- `Alt+a` `z`: Toggle status bar (Ctrl+F3 Combo).

### Pane Management

- `Alt+a` `Alt+[`: Swap pane up.
- `Alt+a` `Alt+]`: Swap pane down.

### Split Windows

- `Alt+a` `Alt+d`: Split window horizontally, keeping the current path.
- `Alt+a` `Alt+s`: Split window vertically, keeping the current path.

### Window Management

- `Alt+a` `c`: Create a new window, keeping the current path.
- `Alt+a` `Alt+x`: Kill the current pane.
- `Alt+a` `Alt+Tab`: Go to the last window.

### Select Windows by Number

- `Alt+a` `Alt+1` to `Alt+9`: Select window 1 to 9 respectively.

### Simple Zoom

- `Alt+a` `Alt+z`: Toggle pane zoom.

### Unbind Default Keys

- Unbind `Up`, `Down`, `Left`, `Right`, `Ctrl+Up`, `Ctrl+Down`, `Ctrl+Left`, `Ctrl+Right`.

### Miscellaneous

- `Alt+a` `Alt+;`: Go to the last pane and toggle zoom.
- `Alt+a` `R`: Reload `.tmux.conf` file and display a message.
- `Alt+a` `Alt+f`: Run the `switcher.tmux` script.
- `Alt+a` `Alt+n`: Run the `sessionizer.tmux` script.

### Neovim Keybinds

- `Alt+a` `Alt+h`, `Alt+a` `Alt+j`, `Alt+a` `Alt+k`, `Alt+a` `Alt+l`: If in Neovim, send respective keys; otherwise, select the pane in the corresponding direction.
- `Alt+a` `Alt+Left`, `Alt+a` `Alt+Down`, `Alt+a` `Alt+Up`, `Alt+a` `Alt+Right`: If in Neovim, send respective keys; otherwise, resize the pane in the corresponding direction by 1 unit.


## License
This project is licensed under the MIT license. See [LICENSE](LICENSE)
