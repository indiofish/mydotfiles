#/bin/bash

echo "This script replaces the current tmux settings!"

rm -rf ~/.tmux.conf
cp .tmux.conf ~/
cp .tmux_complete.sh ~/
