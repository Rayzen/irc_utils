#!/bin/sh

# mkdir && cd
mkgo(){
	mkdir -p $1
	cd $1
}

#mkdir && touch
touchp(){
	mkdir -p `dirname $1`
	touch $1
}