#!/usr/bin/env bash

dir=`dirname $0`
echo $dir
ln -s $dir/netkit $HOME/netkit-util
ln -s $dir/netkit/env/colors/Xresources $HOME/.Xresources
cp -f $dir/sublime-text-2/Packages/Color\ Scheme\ -\ Default/* $HOME/.config/sublime-text-2/Packages/Color\ Scheme\ -\ Default
cp -f $dir/sublime-text-2/Packages/User/* $HOME/.config/sublime-text-2/Packages/User

echo
echo "add \$HOME/bin to PATH"
echo "export PATH=$PATH:$HOME/netkit-util/bin" >> $HOME/.bashrc

echo
echo "Add sublime_text to PATH"
#echo "export PATH=$PATH:$HOME/netkit-util/Sublime\ Text\ 2"  >> $HOME/.bashrc

echo 
echo "Add bash script to .bashrc"
echo "#Scripts" >> $HOME/.bashrc
echo "source $HOME/netkit-util/utils/lab.sh" >> $HOME/.bashrc
echo "source $HOME/netkit-util/utils/util.sh" >> $HOME/.bashrc

echo
echo "Add aliases to .bashrc" 
echo "#Aliases" >> $HOME/.bashrc
echo "alias ls='ls --color=auto -l" >> $HOME/.bashrc
echo "alias tree='tree -C">> $HOME/.bashrc

echo
echo "Solarizing terminal"
sh $dir/netkit/env/colors/gnome-terminal-colors-solarized-master/set_dark.sh
echo "xrdb -load $HOME/.Xresources" >> $HOME/.bashrc

echo
echo "Loading new settings"
source $HOME/.bashrc