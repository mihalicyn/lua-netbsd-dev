#!/usr/bin/env sh

#if kernel crashes we got fs in normal state ;)
sync

cd ~/dev
./modload.sh

luactl create s1

#load stdlib
luactl -s require s1

luactl load s1 /root/dev/$1.lua
#echo "/root/dev/$1.lua"
luactl destroy s1

cd ~/dev
