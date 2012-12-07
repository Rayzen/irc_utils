#!/bin/sh

#Netkit configuration file

set_netkit_env(){
	export NETKIT_HOME=$HOME/netkit
	export PATH=$PATH:$NETKIT_HOME/bin
	export MANPATH=$MANPATH:$NETKIT_HOME/man
}