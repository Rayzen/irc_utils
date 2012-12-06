#!/usr/bin/env bash

dir=`pwd`
echo $dir
ln -s $dir/netkit $HOME/netkit-util
cp -f $dir/sublime-text-2/Packages/Color\ Scheme\ -\ Default/* $HOME/.config/sublime-text-2/Packages/Color\ Scheme\ -\ Default
cp -f $dir/sublime-text-2/Packages/User/* $HOME/.config/sublime-text-2/Packages/User


echo
echo "Solarizing terminal"
sh $dir/netkit/env/gnome-terminal-colors-solarized-master/set_dark.sh

echo
echo "add \$HOME/bin to PATH"
echo "export PATH=$PATH:$HOME/netkit-util/bin" >> $HOME/.bashrc

echo
echo "Add sublime_text to PATH"
echo "export PATH=$PATH:$HOME/netkit-util/Sublime\ Text\ 2"  >> $HOME/.bashrc

echo 
echo "Add bash script to .bashrc"
echo "source $HOME/netkit-util/utils/lab.sh" >> $HOME/.bashrc
echo "source $HOME/netkit-util/utils/util.sh" >> $HOME/.bashrc

echo
echo "Add aliases to .bashrc"
echo "alias ls='ls --color=auto -l"
echo "alias tree='tree -C"

echo
echo "Loading new settings"
source $HOME/.bashrc

