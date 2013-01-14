#!/usr/bin/env bash

source_script=`pwd`/$0
dir=`dirname $source_script`
echo $dir


ln -sf  $dir/st2/sublime_text $dir/netkit/bin/
ln -sf $dir/netkit $HOME/netkit-util
ln -sf $dir/netkit/env/colors/Xresources $HOME/.Xresources

echo
echo "add \$HOME/netkit-util/bin to PATH"
export PATH=$PATH:$HOME/netkit-util/bin
echo "export PATH=\$PATH:\$HOME/netkit-util/bin" >> $HOME/.bashrc

###Start sublime###
#./$dir/st2/sublime_text &
sublime_text &
sublime_pid=$!
echo $sublime_pid
sleep 2 
kill -9 $sublime_pid

cp -f $dir/sublime-text-2/Packages/Color\ Scheme\ -\ Default/* $HOME/.config/sublime-text-2/Packages/Color\ Scheme\ -\ Default
cp -f $dir/sublime-text-2/Packages/User/* $HOME/.config/sublime-text-2/Packages/User

echo 
echo "Add bash script to .bashrc"
echo "#Scripts" >> $HOME/.bashrc
echo "source \$HOME/netkit-util/utils/lab.sh" >> $HOME/.bashrc
echo "source \$HOME/netkit-util/utils/util.sh" >> $HOME/.bashrc

echo
echo "Add aliases to .bashrc" 
echo "#Aliases" >> $HOME/.bashrc
echo "alias ls=ls --color=auto -l" >> $HOME/.bashrc

echo
echo "Solarizing terminal"
sh $dir/netkit/env/colors/gnome-terminal-colors-solarized-master/set_dark.sh
echo "xrdb -load \$HOME/.Xresources" >> $HOME/.bashrc

echo
echo "Start simpleswitcher"
simpleswitcher &

echo
echo "Loading new settings"
source $HOME/.bashrc
