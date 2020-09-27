# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ------------------------------------
# ALIASES
# ------------------------------------

# meta
alias reload_alias='source ~/.bashrc'
alias show_alias='echo; cat ~/.bashrc'

# Ideal directory listing
alias ls="ls --color=auto"
alias ll="ls -laFG"
# -l list in long format
# -F Display a...
#       slash (`/') immediately after each pathname that is a directory,
#       asterisk (`*') after each that is executable,
#       at sign (`@') after each symbolic link
#       equals sign (`=') after each socket,
#       percent sign (`%') after each whiteout,
#       vertical bar (`|') after each that is a FIFO.
# -G = Color
# -a = Show hidden files
alias l=ls

# Ask before removing/copying/moving files.
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'
alias ..='cd ..'

# Pretty-print of PATH variable
alias path='echo -e ${PATH//:/\\n}'

# Search history. Example usage: `histg git` to recent commands that use git
alias histg="history | grep"

# Get your current IP
alias myip="curl http://ipecho.net/plain; echo"

# Example alias for SSH'ing into a server
alias myserver="ssh user@111.111.111.111"

# Example alias for quickly getting to a commonly used directory
alias reps='cd D:\Repositories'

# Git aliases
alias gs='git status'
alias gg='git graph'
alias gd='git diff'
alias gf='git fetch --all'
alias gnir='git grep -Ini'

alias cdgit='cd `git rev-parse --show-toplevel`'

# Other aliases
alias node='winpty node.exe'
alias nlg='npm list -g --depth=0'

# ------------------------------------
# Color variables
# ------------------------------------
# Regular Colors
Black='\e[0;30m'
Red='\e[0;31m'
Green='\e[0;32m'
Yellow='\e[0;33m'
Blue='\e[0;34m'
Purple='\e[0;35m'
Cyan='\e[0;36m'
White='\e[0;37m'
Light_Gray='\033[0;37m'

# Bold
BBlack='\e[1;30m'
BRed='\e[1;31m'
BGreen='\e[1;32m'
BYellow='\e[1;33m'
BBlue='\e[1;34m'
BPurple='\e[0;35m'
BCyan='\e[1;36m'
BWhite='\e[1;37m'
BLight_Gray='\033[1;37m'

# Reset colors
NONE="\e[0m"


# ------------------------------------
# Configure prompt
# Includes special handling for git repos
# ------------------------------------
# When in a git repo, this method is used to determine the current branch
function parse_git_branch {
    git branch 2>/dev/null | grep '^*' | sed 's_^..__' | sed 's_\(.*\)_(\1)_'
}

# When in a git repo, this method is used to determine if there are changes
function git_dirty {
    git diff --quiet HEAD &>/dev/null
    [ $? == 1 ] && echo "!"
}

# Variables
ps1_user="$BGreen\u$NONE"
ps1_host="$Green\h$NONE"
ps1_dir="$BPurple\w$NONE"
ps1_git="$Cyan \$(parse_git_branch)$Red \$(git_dirty)$NONE"

# default option i think
export PS1="\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ "

# default option improved
#export PS1="\[\033[35m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ "

# Option 1 user@host:dir(branch)! $
#export PS1="${ps1_user}@${ps1_host}:${ps1_dir}${ps1_git}\$ "

# Option 2 dir(branch)! $
#export PS1="${ps1_dir}${ps1_git}\n$ "