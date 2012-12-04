#!/bin/sh

dir=$(dirname $0)

ln -s $dir/netkit $HOME/netkit
cp -f $dir/sublime-text-2/Packages/Color\ Scheme\ -\ Default/* $HOME/.config/sublime-text-2/Packages/Color\ Scheme\ -\ Default/
cp -f $dir/sublime-text-2/Packages/User/* $HOME/.config/sublime-text-2/Packages/User/


echo
echo "Solarizing terminal"
sh $dir/netkit/utils/gnome-terminal-colors-solarized-master/set_dark.sh

echo
echo "add \$HOME/bin to PATH"
echo "export PATH=$HOME/netkit/bin:$PATH" >> $HOME/.bashrc

echo
echo "Add sublime_text to PATH"
echo "export PATH=$HOME/netkit/Sublime\ Text\ 2/:$PATH"  >> $HOME/.bashrc

echo 
echo "Add bash script to .bashrc"
echo "source $HOME/netkit/utils/lab.sh" >> $HOME/.bashrc
echo "source $HOME/netkit/utils/util.sh" >> $HOME/.bashrc

echo
echo "Add aliases to .bashrc"
echo "alias ls='ls --color=auto"
echo "alias tree='tree -C"

echo
echo "Loading new settings"
source $HOME/.bashrc

