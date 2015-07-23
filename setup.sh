#!/bin/bash

remote_repo="https://github.com/gankkank/vimrc"

setup_global() {
  config="/etc/vim/vimrc.local"
  if ! [ -f "$config" ]; then
    echo "source /etc/vim/custom/init.global.vimrc" > $config
  else
    grep 'source /etc/vim/custom/init.global.vimrc' $config > /dev/null || \
      echo "Please add 'source /etc/vim/custom/init.global.vimrc' to $config"
  fi

  if ! [ -d /etc/vim/custom ]; then
    git clone $remote_repo /etc/vim/custom
    git clone https://github.com/gmarik/Vundle.vim.git /etc/vim/custom/bundle/Vundle.vim
  fi

  (vim +PluginInstall +qall)
}

setup_local() {
  config=~/.vimrc
  if ! [ -f "$config" ]; then
    echo "source ~/.vim/init.vimrc" > $config
  else
    grep 'source ~/.vim/init.vimrc' $config > /dev/null || \
      echo "Please add 'source ~/.vim/init.vimrc' to $config"
  fi

  if ! [ -d ~/.vim ]; then
    git clone $remote_repo ~/.vim
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  fi

  (vim +PluginInstall +qall)
}


case "$1" in
  global)
    setup_global
    ;;
  *)
    setup_local
    ;;
esac
