if [ "$TERM" == "xterm-kitty" ]; then
    alias icat='kitty +kitten icat'
    ### Completion
    source <(kitty + complete setup bash)
elif [[ "$TERM" == tmux* ]]; then
    alias ssh="TERM=${TERM/tmux/screen}"' ssh'
    alias ssh-='/usr/bin/ssh'
elif [[ "$TERM" == linux ]]; then
    unalias ls
    unalias la
    unalias ll
    unalias l
    alias ls='ls --color=auto'
    alias la='ls --color=auto -A'
    alias ll='ls --color=auto -AlF'
    alias l='ls -F'
fi
# vi:ft=bash
