#
# ~/.bashrc
#

# login start Hyprland
[ $(tty) = "/dev/tty1" ] && cd ~ && niri
[[ $- != *i* ]] && return

PS1='\[\e[1;31m\][\W]\[\e[1;35m\] $branch \[\e[0m\]'

# Common commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mk='mkdir'

# git
alias ga='git add'
alias gm='git commit -m'
function gc() {
    git clone "git@github.com:$1" && cd "$(basename "$1" .git)" && zeditor  &&  exit;
}
alias gc='gc'

# package manager
alias in='sudo pacman -S'
alias un='sudo pacman -Rsn'
alias pi='paru -S'
alias pu='paru -Rsn'
alias ci='cnpm i'
alias cn='cnpm un'

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
#alias z='WAYLAND_DISPLAY=wayland-1 zeditor'
alias c='c() { code $1 && exit;}; c'
alias z='f() { WAYLAND_DISPLAY=wayland-1 zeditor "$1" && exit; }; f'
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
PATH="$HOME/.local/npm/bin:$PATH"
