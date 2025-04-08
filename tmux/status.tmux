#!/usr/bin/env bash

THEME="default"

source ~/.tmux/api.tmux

apply_color(){
    # $1: fg
    # $2: bg
    # $3: text to colorize
    fg="$1"
    bg="$2"
    text="$3"

    echo "#[fg=${fg} bg=${bg}]${text}#[fg=default bg=default]"
}

source "$HOME/.tmux/themes/${THEME}.sh"

set -g status-justify left
set -g status-left-length 50
set -g status-right-length 100

set -g automatic-rename-format '#{b:pane_current_path}'

# Configurações de status
set -g status-style "bg=${color_bg}"
# set -g status-left-style "fg=default bg=default"
# set -g status-right-style "fg=default bg=default"


separator="█"

session_glyph=" 󰍂  "
colored_sep="$(apply_color ${color_session_icon_bg} ${color_session_icon_fg} █)"
session_section="$(apply_color ${color_session_icon_fg} ${color_session_icon_bg} "$session_glyph")"
session_section="${session_section}$(apply_color ${color_session_text_fg} ${color_session_text_bg} ' @#S ')"


calendar_glyph="   "
colored_sep="$(apply_color ${color_calendar_icon_bg} ${color_calendar_icon_fg} █)"
calendar_section="$(apply_color ${color_calendar_icon_fg} ${color_calendar_icon_bg} "${calendar_glyph}")"
calendar_section="${calendar_section}$(apply_color "${color_calendar_text_fg}" "${color_calendar_text_bg}" " #(date +'%d•%m') ")"

double_separator="$(apply_color ${color_bg} ${color_bg} '██')"

clock_glyph=" 󰥔  "
clock_section="$(apply_color ${color_clock_icon_fg} ${color_clock_icon_bg} "${clock_glyph}")"
clock_section="${clock_section}$(apply_color ${color_clock_text_fg} ${color_clock_text_bg} " #(date +'%H:%M') ")"

# user_glyph="   "
user_glyph="   "
user_section="$(apply_color ${color_user_icon_fg} ${color_user_icon_bg} "${user_glyph}")"
user_section="${user_section}$(apply_color ${color_user_text_fg} ${color_user_text_bg} " ${USER}@$(hostname) ")"

# set -g status-style "bg=${color_bg}"
set -g status-left "${session_section}${double_separator}${double_separator}"
set -g status-right "${calendar_section}${double_separator}${clock_section}${double_separator}${user_section}"

colored_sep="$(apply_color ${color_win_current_bg} ${color_win_current_fg} ${separator})"
window_current_section="${colored_sep}"
window_current_section="${window_current_section}$(apply_color ${color_win_current_fg} ${color_win_current_bg} "#I:#W")"
window_current_section="${window_current_section}${colored_sep}"

setw -g window-status-current-format "#[bold]${window_current_section}"

colored_sep="$(apply_color ${color_bg_alt} "default" ${separator})"
window_content="$(apply_color ${color_fg_alt} ${color_bg_alt} "#I:#W")"
setw -g window-status-format "${colored_sep}${window_content}${colored_sep}"
# setw -g window-status-format "#[bg=${color_bg_alt} fg=${color_fg_alt}]#I:#W"
