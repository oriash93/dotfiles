install_dotfile () {
    IFS='/'
    read -a arr <<< "$1"
    
    cp --backup "$1" ~/${arr[1]}
}

prompt_install () {
   while true; do
    read -p "Do you want to install $1? (y/n) " yn

    case $yn in 
        [yY] ) echo installing $1;
            install_dotfile $1;
            break;;
        [nN] ) break;;
        * ) echo invalid response;;
    esac

    done
}

# bash
prompt_install bash/.bashrc
prompt_install bash/.bash_aliases
prompt_install bash/.bash_functions

# git
prompt_install git/.gitconfig

# vim
prompt_install vim/.vimrc
