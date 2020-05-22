#!/bin/sh

# Old one with terminator
# exec terminator -e "/home/dvg/dotfiles/linux/shell/scripts/shortcuts/tmux/auto-tmux-resurect.sh"

# Start guake and automatically reload tmux

guake --rename-current-tab='workflow' --execute-command='pgrep -vx tmux > /dev/null && \
tmux new -d -s delete-me && \
tmux run-shell $TMUX_DIR/plugins/tmux-resurrect/scripts/restore.sh && \
tmux kill-session -t delete-me && \
tmux attach || tmux attach'
