#!/bin/bash

# Meta
alias edit_aliases='vim ~/.bash_aliases'
alias edit_bashrc='vim ~/.bashrc'
alias reload_aliases='source ~/.bash_aliases'
alias show_aliases='echo; cat ~/.bash_aliases;'

# Git stuff
alias gs='git status'
alias gg='git graph'
alias gd='git diff'
alias gf='git fetch --all'
alias gnir='git grep -Ini'
alias ginir='grep -Inir'
alias cdgit='cd `git rev-parse --show-toplevel`'

# Ideal directory listing
alias l=ls
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

alias reps='cd D:\Repositories'
alias scripts='cd D:\Scripts'

# Other aliases
alias node='winpty node.exe'
alias nlg='npm list -g --depth=0'
