#/bin/bash

echo "This script replaces the current vim settings!"
NVIM_PATH=~/.config/nvim

rm -rf NVIM_PATH
mkdir NVIM_PATH
cp init.vim NVIM_PATH/init.vim
cp -r syntax NVIM_PATH/syntax

curl -fLo NVIM_PATH/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim ./README.md +PlugInstall +qall
