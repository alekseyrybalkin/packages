#!/bin/sh

pkgname=lua51
pkgver=5.1.5
urls="http://www.lua.org/ftp/lua-${pkgver}.tar.gz \
  http://rybalkin.org/kiin-files/lua-5.1.5-arch.patch \
  http://rybalkin.org/kiin-files/lua-5.1-cflags.diff"
srctar=lua-${pkgver}.tar.gz
srcdir=${location}/lua-${pkgver}

kiin_make() {
  patch -p1 -i ${KIIN_HOME}/tarballs/lua-5.1.5-arch.patch
  patch -p1 -i ${KIIN_HOME}/tarballs/lua-5.1-cflags.diff
  export CFLAGS="$CFLAGS -fPIC"
  sed -e 's:llua:llua5.1:' -e 's:/include:/include/lua5.1:' -i etc/lua.pc
  sed -r -e '/^LUA_(SO|A|T)=/ s/lua/lua5.1/' -e '/^LUAC_T=/ s/luac/luac5.1/' \
    -i src/Makefile
  make MYCFLAGS="$CFLAGS" MYLDFLAGS="$LDFLAGS" linux
}

kiin_install() {
  make \
    TO_BIN='lua5.1 luac5.1' \
    TO_LIB="liblua5.1.a liblua5.1.so liblua5.1.so.5.1 liblua5.1.so.${pkgver}" \
    INSTALL_DATA="cp -d" \
    INSTALL_TOP=${pkgdir}/usr \
    INSTALL_INC=${pkgdir}/usr/include/lua5.1 \
    INSTALL_MAN=${pkgdir}/usr/share/man/man1 \
    install
  install -Dm644 etc/lua.pc ${pkgdir}/usr/lib/pkgconfig/lua5.1.pc
}
