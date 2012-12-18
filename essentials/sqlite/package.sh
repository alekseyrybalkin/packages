#!/bin/sh

pkgname=sqlite
pkgver=3.7.15
_pkgver=3071500
srctar=${pkgname}-autoconf-${_pkgver}.tar.gz
urls="http://sqlite.org/${pkgname}-autoconf-${_pkgver}.tar.gz"
srcdir=${location}/${pkgname}-autoconf-${_pkgver}

kiin_make() {
  export CFLAGS="$CFLAGS -DSQLITE_ENABLE_FTS3=1 -DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_ENABLE_UNLOCK_NOTIFY -DSQLITE_SECURE_DELETE"
  ./configure --prefix=/usr --disable-static --disable-readline
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
