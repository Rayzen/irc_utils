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
	local hws="$@"

    for m in $hws; do
        if [[ -f $m.startup ]] && [[ -d $m ]]; then
            echo "" >> $m.startup
            echo "/etc/init.d/bind start" >> $m.startup
            mkdir -p $m/etc/bind
            touch $m/etc/bind/named.conf
        fi
    done

}

start_apache(){
	local srv="$@"
	local curdir=`pwd`
	local dest="/home/guest/public_html/index.html"
	for s in $srv; do
		if [[ -f $m.startup ]] && [[ -d $m ]]; then
			echo "\na2enmod userdir\n/etc/init.d/apache2 start" >> $s.startup
			touchp $s/$dest
			echo "<html><body>Hello! This is $s speaking!!!</" >> $dest
		fi
	done
}

start_rip(){
	#TODO
}

start_ospf(){
	#TODO
}

start_bgp(){
	#TODO
}

open_lab(){
	./sublime_text -na $1
	./sublime_text -a $1/*
}