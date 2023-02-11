alias clear-hist='history -c > '"$HISTFILE"
alias i='incognito'
alias clh='history -c > '"$HISTFILE"
[ $(tput colors) -eq 256 ] && alias man='batman'

# Source common aliases
if [ -f /home/eliminmax/.config/common_aliases ]; then
    . /home/eliminmax/.config/common_aliases
fi

# vi:ft=bash
