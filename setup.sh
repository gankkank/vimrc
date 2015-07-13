#!/bin/bash

remote_repo="https://github.com/gankkank/vimrc"

setup_global() {
  config="/etc/vim/vimrc.local"
  if ! [ -f "$config" ]; then
    echo "source /etc/vim/custom/init.vimrc" > $config
  else
    grep 'source /etc/vim/custom/init.vimrc' $config > /dev/null || \
      echo "Please add 'source /etc/vim/custom/init.vimrc' to $config"
  fi

  [ -d /etc/vim/custom ] || git clone $remote_repo /etc/vim/custom

  vim +PluginInstall +qall
}

setup_local() {
  config=~/.vimrc
  if ! [ -f "$config" ]; then
    echo "source ~/.vim/init.vimrc" > $config
  else
    grep 'source ~/.vim/init.vimrc' $config > /dev/null || \
      echo "Please add 'source ~/.vim/init.vimrc' to $config"
  fi

  [ -d ~/.vim ] || git clone $remote_repo ~/.vim

  vim +PluginInstall +qall
}


case "$1" in
  global)
    setup_global
    ;;
  *)
    setup_local
    ;;
esac
