# ~/.bashrc
# author: rainto0322

# login start Hyprland
[ $(tty) = "/dev/tty1" ] && cd ~ && niri
[[ $- != *i* ]] && return

# environment
PATH=~/.console-ninja/.bin:$PATH
PATH="$HOME/.local/npm/bin:$PATH"
PATH="$HOME/.local/share/pnpm/bin:$PATH"
PATH="$HOME/.bun/bin:$PATH"
PROMPT_COMMAND='branch=$(Git_Branch)'
PS1='\[\e[1;31m\][\W]\[\e[1;35m\] $branch \[\e[0m\]'

# Common commands
alias ls='ls --color'
alias mk='mkdir'
alias .='cd ./'
alias ..='cd ../'
alias ~='cd ~'

########### git operation
alias ga='Git_Add'
alias gm='git commit -m'
alias gc='git clone'
alias gp='git push'

########### package manager
# pacman
alias sy='sudo pacman -Sy'
alias syu='sudo pacman -Syu'
alias in='sudo pacman -S'
alias un='sudo pacman -Rsn'
# paru
alias pi='paru -S'
alias pu='paru -Rsn'
# bun.js
alias bi="bun install --registry=https://registry.npmmirror.com"
alias bc="bun create --registry=https://registry.npmmirror.com"
alias biu="bun update -p --registry=https://registry.npmmirror.com"
alias biv="bun install --verbose --registry=https://registry.npmmirror.com"
alias bu="bun remove"
alias ba="bun add --registry=https://registry.npmmirror.com"
alias bad="bun add -D --registry=https://registry.npmmirror.com"
alias dev='bun run dev'
alias client='bun run client'
alias server='bun run server'
alias start='bun run start'
alias build='bun run build'
# npm
alias ci='cnpm i'
alias cid='cnpm i -D'
alias cn='cnpm un'

# client
alias h='Editor helix'
alias v='nvim'
alias c='c() { code $1 && exit;}; c'
alias z='f() { WAYLAND_DISPLAY=wayland-1 zeditor "$1" && exit; }; f'
alias hs='hugo server --bind="0.0.0.0" -p 4000 --minify'
alias hn='HugoNewPost'
alias hb='hugo build --minify'
alias cl='rm -rf ~/.local/share/nvim'


Git_Branch() {
	git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* $.*$/ (1)/'
}

Git_Add() { git add "${@:-.}"; }

Editor() {
    local editor="$1"
    local target="$2"

    # No target path passed in
    if [ -z "$target" ]; then
        "$editor"
        return $?
    fi

    local target_abs
    if [[ "$target" = /* ]]; then
        target_abs="$target"
    else
        target_abs="$PWD/$target"
    fi

    if [ -d "$target_abs" ]; then
        # 目标是文件夹：直接进入文件夹并打开编辑器
        cd "$target_abs" && "$editor"
    else
        # The target is a file (exists/does not exist)
        # Extract directory+file name
        local target_dir=$(dirname "$target_abs")
        local target_file=$(basename "$target_abs")
		
        if [ -d "$target_dir" ]; then
            cd "$target_dir" && "$editor" "$target_file"
        else
            # When the directory does not exist
            "$editor" "$target_abs"
        fi
    fi
}

HugoNewPost() {
	local name=$1
	local category=$2
	local tags=$3

	local FileName="$(date +%Y%m%d)$name"
	echo "$FileName"
}

