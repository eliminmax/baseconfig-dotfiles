function fish_prompt --description 'Write out the prompt'
    set -l color_cwd
    set -l suffix
    set color_cwd $fish_color_cwd
    set suffix '&'
    set -l ret_color
    if test $status -eq 0
        set ret_color 46
    else
        set ret_color 124
    end
    echo -n -s (printf '\e[0;1m[\e[1;38;5;%dm%d\e[39m] ' $ret_color $status) (printf '\e[1;38;5;131m')"$USER" @ (prompt_hostname) (set_color normal) (set_color $fish_color_bold) : (printf '\e[1;38;5;81m') (sodiumSierraStrawberry $PWD) (set_color normal) (set_color $fish_color_bold) "$suffix " (set_color normal)
end
