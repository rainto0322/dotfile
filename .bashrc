# ~/.bashrc
# author: rainto0322

# login start niri
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
alias .='cd ../'
alias ~='cd ~'

########### git operation
alias ga='Git_Add'
alias gm='Git_Commit'
alias gc='git clone'
alias gp='git push'
alias gra='git remote add origin'
alias gran='git remote set-url --add origin'

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
alias bid="bun install -D --registry=https://registry.npmmirror.com"
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
alias h='helix'
alias v='nvim'
alias c='c() { code $1 && exit;}; c'
alias hs='hugo server --bind="0.0.0.0" -p 4000 --minify'
alias hn='HugoNewPost'
alias hb='hugo build --minify'
alias cl='rm -rf ~/.local/share/nvim'

# function
Git_Branch() {
	git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* $.*$/ (1)/'
}

Git_Add() { git add "${@:-.}"; }

Git_Commit() {
    if [ $# -ne 2 ]; then
        echo '❌ usage error: gm <type> <description>'
        return 1
    fi

    local scope="$1"
    local desc="$2"

    declare -A emoji_map
    emoji_map=(
		["core"]="⚙️"
		["fix"]="🐛"
		["docs"]="📚"
		["style"]="🌈"
		["perf"]="⚡"
		["chroe"]="🔧"
		["revert"]="⏪"
		["refactor"]="♻️"
		["ci"]="👷"
    )

    local emoji="${emoji_map[$scope]:-✨}"
    local commit_msg="${emoji}${scope}: ${desc}"
    git commit -m "$commit_msg"
}

HugoNewPost() {
	local name=$1
	local category=$2
	local tags=$3

	local FileName="$(date +%Y%m%d)$name"
	echo "$FileName"
}

