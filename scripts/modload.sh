#!/usr/bin/env sh

set -e

#rebuild all
cd /usr/src/sbin/luactl
make USETOOLS=no
make install USETOOLS=no

cd /usr/src/sys/modules/lua
#make clean
make USETOOLS=no
make install USETOOLS=no

cd /usr/src/sys/modules/luasystm
make USETOOLS=no
make install USETOOLS=no

set +e

#reload module
modunload luasystm
modunload lua

modload lua
modload luasystm

sysctl -w kern.lua.verbose=1
sysctl -w ddb.onpanic=1