# Lines configured by zsh-newuser-install
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/eliminmax/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

HISTFILE="/home/eliminmax/.local/share/histfiles/zsh"

autoload -Uz add-zsh-hook
setopt promptsubst

sodiumSS_pwd () {
    export sSS_pwd="$(sodiumSierraStrawberry $(pwd))"
}
add-zsh-hook precmd sodiumSS_pwd
PROMPT='%{$reset_color%}%B[%F{%(?.46.124)}%?%f] %F{45}%n@%m%f:%F{77}${sSS_pwd}%f$ %b%{$reset_color%}'
fpath=($fpath "/home/eliminmax/.zfunctions")

# load common aliases
if [[ -f "/home/eliminmax/.config/common_aliases" ]]; then
    source "/home/eliminmax/.config/common_aliases"
fi

# use emacs-style keybinds, without escape
bindkey -e
bindkey -r ""

eval $(thefuck --alias)

compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
