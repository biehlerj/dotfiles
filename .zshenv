typeset -U PATH path

# Add $HOME/.local/bin to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

# XDG paths
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_VIDEOS_DIR="$HOME/Videos"

# Set directory for zsh
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

# Disable history file for less
export LESSHISTFILE=-

# Clean home dir
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
export PATH="$PATH:$CARGO_HOME/bin"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/X11/xinitrc"
export PYENV_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/pyenv"
export GRADLE_HOME=$HOME/gradle
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export JDTLS_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/lspinstall/java" 
export DOCKER_CLIENT_TIMEOUT=120
export DOCKER_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/docker"
export COMPOSE_HTTP_TIMEOUT=120
export RANGER_LOAD_DEFAULT_RC=false
export NEXT_TELEMETRY_DISABLED=1
export FNM_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/fnm"

# Personal path configs
export DEV_HOME="$HOME/dev"
export DOTFILES_HOME="$DEV_HOME/gitlab.com/biehlerj/dotfiles"

# Set default apps
export BROWSER="brave-browser"
export COLORTERM="truecolor"
export EDITOR="nvim"
export IMAGE="sxiv"
export OPENER="xdg-open"
export PAGER="less"
export READER="zathura"
export VIDEO="mpv"
export VISUAL="nvim"
export SYSTEMD_EDITOR="${EDITOR:-$(which vim)}"

# Pfetch setup
export PF_INFO="ascii title os host kernel uptime pkgs memory shell editor palette"
