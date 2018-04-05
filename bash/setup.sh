#/bin/bash

echo "This script replaces the current bash settings!"

rm -rf ~/.bashrc
rm -rf ~/.bash_profile
rm -rf ~/.bash_aliases
rm -rf ~/.inputrc
cp .bashrc ~/
cp .bash_aliases ~/
cp .inputrc ~/
cp ./.bash_profile ~/
