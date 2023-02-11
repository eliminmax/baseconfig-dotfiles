# Define a function to set incognito
incognito() {
    if [[ "$INCOG_ON" == 'true' ]] && ! [[ "$1" == "force" ]]; then
        echo -e "\e[01;93mAlready incognito!\e[m"
        return 1
    else
        PS1='\[\e[0;1m\][\[\e[$(__prompt_prev_exit_color_code)m\]$?\[\e[39m\]] \[\e[1;38;5;245m\]\w\[\e[39m\]\$ \[\e[0m\]'
        unset HISTFILE
        # unalias rm if it is aliased
        alias rm &>/dev/null && unalias rm
        # alias v, vi, vim, and nvim to nvim -i NONE -n
        alias v="$(which nvim)"' -i NONE -n'
        alias vi="$(which nvim)"' -i NONE -n'
        alias vim="$(which nvim)"' -i NONE -n'
        alias nvim="$(which nvim)"' -i NONE -n'
        # similarly, alias view to nvim -i NONE -n -m -M
        alias view="$(which nvim)"' -i NONE -n -m -M'
        alias vimdiff="$(which nvim)"' -i NONE -n -d'
        export INCOG_ON='true'
        export EDITOR="$(which nvim)"' -i NONE -n'
        umask 0077
    fi
}
# if $INCOG_ON is set to 'true, enable the alternative incognito prompt, and unset HISTFILE
if [[ "$INCOG_ON" == 'true' ]]; then
    incognito force
fi

# vi:ft=bash
