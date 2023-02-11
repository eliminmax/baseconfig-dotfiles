# Bash function definitions

tac () {
    bat -pp --color=always "$@" | /usr/bin/tac
}

get16colors () {
    local n=0
    while [ $n -lt 16 ]; do
    echo -e "\033[01;38;5;${n}m$n\033[m\033[48;5;$n;38;5;232m$n\033[m"
    ((n++))
    done
}

get256colors () {
    local n=0
    while [ $n -lt 256 ]; do
    echo -e "\033[01;38;5;${n}m$n\033[m\033[48;5;$n;38;5;232m$n\033[m"
    ((n++))
    done
}

wine-proton () {
    # Run a Windows executable with Proton instead of the system wine
    WINEPREFIX='/home/eliminmax/.proton-pfx' /home/eliminmax/.steam/debian-installation/steamapps/common/Proton\ -\ Experimental/files/bin/wine "$*"
}

gzbat () {
    if [ $# -ne 1 ]; then
        return 1
    else
        pigz --stdout --decompress "$1" | bat --file-name "${1%.gz}"
    fi
}
# vi:ft=bash
