# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"

# Load lf icons file if it exists
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/lf_icons" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/lf_icons"

if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
	export MOZ_ENABLE_WAYLAND=1
fi

# Add shims directory to PATH
export PATH="${ASDF_DATA_DIR:-$HOME/.local/share/asdf}/shims:$PATH"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -i
_comp_options+=(globdots)		# Include hidden files.

# Change from ls to eza
if [ "$(command -v eza)" ]; then
	unalias -m 'ls'
	alias ls='eza -G --color auto --icons -a -s type'
	alias ll='eza -l --color always --icons -a -s type'
fi

# Change from cat to bat
if [ "$(command -v bat)" ]; then
	unalias -m 'cat'
	alias cat='bat'
fi

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

if [ -f "${XDG_DATA_HOME:-$HOME/.local/share}/go/bin/redo" ]; then
	source "$(redo alias-file)"
	bindkey -s '^r' 'redo\n'
fi

LFCD="$HOME/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
	source "$LFCD"
fi
bindkey -s '^o' 'lfcd\n'

bindkey -s '^h' 'bc -l\n'

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

bindkey -s '^n' 'v\n'

bindkey '^[[P' delete-char

# Easy encrypting and decrypting with gpg
# secret () {
#         output=~/"${1}".$(date +%s).enc
#         gpg --encrypt --armor --output ${output} -r 0x0000 -r 0x0001 -r 0x0002 "${1}" && echo "${1} -> ${output}"
# }

# reveal () {
#         output=$(echo "${1}" | rev | cut -c16- | rev)
#         gpg --decrypt --output ${output} "${1}" && echo "${1} -> ${output}"
# }

# export GPG_TTY="$(tty)"
# export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
# gpgconf --launch gpg-agent

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

export PATH="$HOME/.local/share/cargo/bin:$PATH"
eval "$(zoxide init zsh)"

export PATH="$PATH:$HOME/.spicetify"

# Add Flutter to PATH if directory exists
[ -d "$HOME/bin/flutter/" ] && export PATH="$PATH:$HOME/bin/flutter/bin"
# Android SDK setup
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin"

source ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
source ~/.config/zsh/plugins/git.zsh
source ~/.config/zsh/plugins/git.plugin.zsh
if [[ "$(command -v apt)" || "$(command -v apt-get)" ]]; then
  source ~/.config/zsh/plugins/ubuntu.plugin.zsh
elif [[ "$(command -v dnf)" || "$(command -v yum)" ]]; then
  source ~/.config/zsh/plugins/dnf.plugin.zsh
fi
source ~/.config/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
source ~/.config/zsh/plugins/command-not-found.plugin.zsh
fpath=("$HOME/.config/zsh/plugins/zsh-completions/src" $fpath)
fpath=("$HOME/.config/zsh/completion" $fpath)
fpath=("$HOME/.config/zsh/completion/_poetry" $fpath)
eval "$(starship init zsh)"

# eval "$(thefuck --alias)"

# 1Password Setup
if [ -d "$$HOME/.config/op/" ]; then
  eval "$(op signin)"
  source ~/.config/zsh/plugins/1password.plugin.zsh
  source "${XDG_CONFIG_HOME:-$HOME/.config}/op/plugins.sh"
fi

${${(A)=:-pfetch neofetch fastfetch}[RANDOM%3+1]}

# Source funky shell functions
[ -f ~/.local/share/funky/funky.sh ] && source ~/.local/share/funky/funky.sh

source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins/catppuccin_mocha-zsh-syntax-highlighting.zsh"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/secret.zshenv"

# pnpm
export PNPM_HOME="/home/biehlerj/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export BUN_INSTALL="${XDG_DATA_HOME:-$HOME/.local/share}/bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "/home/biehlerj/.local/share/reflex/bun/_bun" ] && source "/home/biehlerj/.local/share/reflex/bun/_bun"
