#!bin/sh

# Start tmux and resurect to last session
pgrep -vx tmux > /dev/null && \
    tmux new -d -s delete-me && \
    tmux run-shell $TMUX_DIR/plugins/tmux-resurrect/scripts/restore.sh && \
    tmux kill-session -t delete-me && \
    tmux attach || tmux attach
