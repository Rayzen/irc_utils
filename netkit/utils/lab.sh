#!/bin/sh

init(){
	local hws="$@"
    for m in $hws; do
        mkdir $m
        touch $m.startup
    done
    touch lab.conf
}

start_bind(){

}

start?apache(){

}

start_rip(){

}

start_ospf(){

}

start_bgp(){

}

open_lab(){
	./sublime_text -na $1 &
}