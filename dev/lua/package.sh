#!/bin/sh

pkgname=lua
pkgver=5.2.2
urls="http://www.lua.org/ftp/lua-${pkgver}.tar.gz \
  http://rybalkin.org/kiin-files/liblua.so.patch"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -p1 -i ../liblua.so.patch
  export CFLAGS="$CFLAGS -fPIC"
  make MYCFLAGS="$CFLAGS" MYLDFLAGS="$LDFLAGS" linux
  sed "s/%VER%/${pkgver%.*}/g;s/%REL%/${pkgver}/g" ../lua.pc > lua.pc
}

kiin_install() {
  make \
    TO_LIB="liblua.a liblua.so liblua.so.5.2 liblua.so.5.2.1" \
    INSTALL_DATA="cp -d" \
    INSTALL_TOP=${pkgdir}/usr \
    INSTALL_MAN=${pkgdir}/usr/share/man/man1 \
    install
  install -Dm644 lua.pc ${pkgdir}/usr/lib/pkgconfig/lua.pc
}
