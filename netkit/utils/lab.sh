#!/usr/bin/env bash

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
            echo "#\n/etc/init.d/bind start" >> $m.startup
            mkdir -p $m/etc/bind
            touch $m/etc/bind/named.conf
        fi
    done

}

start_apache(){
	local srv="$@"
	local curdir=`pwd`
	local dest="home/guest/public_html/index.html"
	for s in $srv; do
		if [[ -f $s.startup ]] && [[ -d $s ]]; then
			echo "#\na2enmod userdir\n/etc/init.d/apache2 start" >> $s.startup
			touchp $s/$dest
			echo "<html><body>Hello! This is $s speaking!!!</" >> $dest
		fi
	done
}

start_zebra(){
	local router="$@"
	local dest="etc/zebra"
	for r in $router; do
		if [[ -f $r.startup ]] && [[ -d $r ]]; then
			echo "#\n/etc/init.d/zebra start"
			touchp $r/$dest/zebra.conf
			touchp $r/$dest/daemons
			echo "Zebra activated on $r"
		fi
	done	
}

start_rip(){
	local router="$@"
	local dest="etc/zebra/ripd.conf"
	start_zebra $router
	for r in $router; do
		if [[ -f $r.startup ]] && [[ -d $r ]]; then
			touchp $r/$dest
		fi
	done
}

start_ospf(){	
	local router="$@"
	local dest="etc/zebra/ospfdd.conf"
	start_zebra $router
	for r in $router; do
		if [[ -f $r.startup ]] && [[ -d $r ]]; then
			touchp $r/$dest
		fi
	done
}

start_bgp(){
	local router="$@"
	local dest="etc/zebra/bgpd.conf"
	start_zebra $router
	for r in $router; do
		if [[ -f $r.startup ]] && [[ -d $r ]]; then
			touchp $r/$dest
		fi
	done
}

open_lab(){
	./sublime_text -na $1
	./sublime_text -a $1/*
}
