#!/bin/sh

pkgname=sqlite
pkgver=3.11.1
_pkgver=3110100
srctar=${pkgname}-autoconf-${_pkgver}.tar.gz
urls="http://sqlite.org/2016/${pkgname}-autoconf-${_pkgver}.tar.gz"
srcdir=${location}/${pkgname}-autoconf-${_pkgver}

kiin_make() {
  MAKEFLAGS=
  patch -p1 -i ../sqlite-history-file-location.diff
  export CFLAGS="$CFLAGS -DSQLITE_ENABLE_FTS3=1 \
    -DSQLITE_ENABLE_COLUMN_METADATA=1 \
    -DSQLITE_ENABLE_UNLOCK_NOTIFY=1 \
    -DSQLITE_SECURE_DELETE=1"
  ./configure --prefix=/usr \
    --disable-static \
    --enable-readline \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  MAKEFLAGS=
  make DESTDIR=${pkgdir} install
}
