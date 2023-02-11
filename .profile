# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi


# Include Flatpak, local games, Cargo and RubyGem binaries in PATH
pathmunge () {
    case :"$PATH": in
        *:"$1":*)
            ;;
        *)
            if [ "$2" = "after" ] ; then
                PATH=$PATH:$1
            else
                PATH=$1:$PATH
            fi
    esac
}
# Cargo and radare2 binaries should be higher priority than existing PATH
if [ -d "$HOME/.local/lib/rust/cargo/bin" ]; then
    pathmunge "$HOME/.local/lib/rust/cargo/bin"
fi

if [ -d "$HOME/.local/r2env/bin" ]; then
    pathmunge "$HOME/.local/r2env/bin"
fi

# Flatpak, games and RubyGem should be lower priority than existing PATH
if [ -d "$HOME/.local/share/gem/ruby/3.0.0/bin" ]; then
    pathmunge "$HOME/.local/share/gem/ruby/3.0.0/bin" after
fi

if [ -d "$HOME/.local/share/flatpak/exports/bin" ]; then
    pathmunge "$HOME/.local/share/flatpak/exports/bin" after
fi

if [ -d "$HOME/.local/games" ]; then
    pathmunge "$HOME/.local/games" after
fi

# move ~/.local/bin back to beginning of PATH,
# and ~/.local/games and /usr{/local,}/games back to the end
eval "$("$HOME/.local/bin/path-reorder")"


### Environment Configuration

# Use vim as the default editor
export EDITOR=vim

# Use GTK2-style QT Theming
export QT_QPA_PLATFORMTHEME=qt5ct

# Less config
export LESS=-QRiS
export LESSHISTFILE="$HOME/.local/share/histfiles/less"

# Set XDG directory variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Tell certain shells to source ~/.shinit
if [ -z $ENV ]; then
    export ENV="$XDG_CONFIG_HOME/shinit"
fi

# Set the ansible-related environment
export ANSIBLE_INVENTORY="$XDG_CONFIG_HOME/ansible/inventory"
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"


# Set the rust-related environment
export CARGO_HOME="$HOME/.local/lib/rust/cargo"
export RUSTUP_HOME="$HOME/.local/lib/rust/rustup"

# clean up $HOME
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"
export WINEPREFIX="$XDG_DATA_HOME/wine"
export XPRA_SOCKET_DIR="/var/run/user/$(id -u)/xpra"
export GOPATH="$HOME/.local/lib/go"
export R2ENV_PATH="$HOME/.local/r2env"

# Default to python3.11 for packages installed with pipx
export PIPX_DEFAULT_PYTHON='/usr/bin/python3.11'
