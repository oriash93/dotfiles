#!/bin/bash


# Creates the directory if it doesn't exist, and changes into it
# Usage: mcd somedir
function mcd {
    if [ $# -ne 1 ]; then
      echo "Usage: mcd <directory-name>"
      return
    fi

    mkdir "$1"
    cd "$1" || return
}


# Always use correct program to extract files
# Usage: extract somefile.tar.gz
function extract {
 if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f "$1" ] ; then
        case $1 in
          *.tar.bz2)   tar xvjf ./"$1"    ;;
          *.tar.gz)    tar xvzf ./"$1"    ;;
          *.tar.xz)    tar xvJf ./"$1"    ;;
          *.lzma)      unlzma ./"$1"      ;;
          *.bz2)       bunzip2 ./"$1"     ;;
          *.rar)       unrar x -ad ./"$1" ;;
          *.gz)        gunzip ./"$1"      ;;
          *.tar)       tar xvf ./"$1"     ;;
          *.tbz2)      tar xvjf ./"$1"    ;;
          *.tgz)       tar xvzf ./"$1"    ;;
          *.zip)       unzip ./"$1"       ;;
          *.Z)         uncompress ./"$1"  ;;
          *.7z)        7z x ./"$1"        ;;
          *.xz)        unxz ./"$1"        ;;
          *.exe)       cabextract ./"$1"  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}


# Removes the given path from the PATH variable
# Usage: pathremove /path/to/bin [PATH]
# E.g., to remove ~/bin from $PATH
#     pathremove ~/bin PATH
function pathremove {
  local IFS=':'
  local NEWPATH
  local DIR
  local PATHVARIABLE=${2:-PATH}
  for DIR in ${!PATHVARIABLE} ; do
    if [ "${DIR}" != "${1}" ] ; then
      NEWPATH="${NEWPATH:+${NEWPATH}:}${DIR}"
    fi
  done
  export "${PATHVARIABLE}"="${NEWPATH}"
}


# Adds the given path to the beginning of the PATH variable
# Usage: pathprepend /path/to/bin [PATH]
# E.g., to prepend ~/bin to $PATH
#     pathprepend ~/bin PATH
function pathprepend {
  pathremove "${1}" "${2}"
  [ -d "${1}" ] || return
  local PATHVARIABLE="${2:-PATH}"
  export "${PATHVARIABLE}"="${1}${!PATHVARIABLE:+:${!PATHVARIABLE}}"
}


# Adds the given path to the end of the PATH variable
# Usage: pathappend /path/to/bin [PATH]
# E.g., to append ~/bin to $PATH
#     pathappend ~/bin PATH
function pathappend {
  pathremove "${1}" "${2}"
  [ -d "${1}" ] || return
  local PATHVARIABLE=${2:-PATH}
  export "$PATHVARIABLE"="${!PATHVARIABLE:+${!PATHVARIABLE}:}${1}"
}


# Removes all junk docker images
# Usage: cleanjunkimages
function cleanjunkimages {
  docker rmi -f "$(docker images | grep '<none>' | awk '{print $3}')"
}


# Remove local branches that no longer exist on remote.
# Usage: prunebranches
function prunebranches {
  git fetch origin --prune
  git branch --merged main | grep -v 'main$' | xargs git branch -d
}
