#
# ~/.bashrc
#

# login start Hyprland
[ $(tty) = "/dev/tty1" ] && cd ~ && hyprland
[[ $- != *i* ]] && return

# Common commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mk='mkdir'

# git
alias ga='git add '
alias gm='git commit -m '
alias gc='git clone '

# package manager
alias in='sudo pacman -S '
alias un='sudo pacman -Rsnc '
alias ai='yay -S '
alias au='yay -Rsnc '
alias ci='cnpm i '
alias cn='cnpm un '

# client
edit() {
    local editor="nvim"
		if [[ "$1" == "nvim" || "$1" == "helix" ]]; then
        editor="$1"
        shift
    fi
    [[ -z "$1" ]] && { $editor; return; }
    if [[ -d "$1" ]]; then
        $editor "$1"
    else
        [[ "$(dirname "$1")" = "." ]] || cd "$(dirname "$1")"
        $editor "$(basename "$1")"
    fi
}

alias h='helix'
alias v='edit nvim'
alias hs='hugo server --bind="0.0.0.0" -p 4000 --minify'
alias hb='hugo build --minify'
alias cl='rm -rf ~/.local/share/nvim'

# node js
alias dev='bun run dev'
alias client='bun run client'
alias build='bun run build'
alias test='bun run test'

parse_git_branch() {
     git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* $.*$/ (1)/'
}

PROMPT_COMMAND='branch=$(parse_git_branch)'

# environment
PATH=~/.console-ninja/.bin:$PATH
PATH="$HOME/.local/share/.npm-global/bin:$PATH"
PS1='\e[1;31m[\W] \e[1;35m$ $branch \e[0m'
