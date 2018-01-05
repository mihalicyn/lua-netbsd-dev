#!/usr/bin/env sh

set -e

clean_rebuild()
{
    make clean
    make USETOOLS=no
    make install USETOOLS=no
}

cp /usr/src/sys/sys/lua.h /usr/include/sys/lua.h
cp /usr/src/external/mit/lua/dist/src/lua.h /usr/include/lua.h

#rebuild all
cd /usr/src/sbin/luactl
clean_rebuild

cd /usr/src/sys/modules/lua
clean_rebuild

cd /usr/src/sys/modules/luasystm
clean_rebuild

cd /usr/src/sys/modules/luapmf
clean_rebuild

cd /usr/src/external/mit/lua/lib
clean_rebuild

cd /usr/src/external/mit/lua/usr.bin/lua
clean_rebuild
