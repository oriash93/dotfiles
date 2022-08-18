# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ------------------------------------
# Aliases
# ------------------------------------

# Load external aliases file
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Prompt
PS1='\[\e[0;32m\]\u@\h \[\e[0;33m\]\w\[\e[0;36m\]`__git_ps1` \[\e[00m\]\n$ '

pathappend() {
  for ARG in "$@"
  do
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="${PATH:+"$PATH:"}$ARG"
    fi
  done
}

# Scripts
SCRIPTS=`realpath scripts/`
pathappend $SCRIPTS