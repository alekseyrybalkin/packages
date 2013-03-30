#!/bin/sh

pkgname=sqlite
pkgver=3.7.16.1
_pkgver=3071601
srctar=${pkgname}-autoconf-${_pkgver}.tar.gz
urls="http://sqlite.org/2013/${pkgname}-autoconf-${_pkgver}.tar.gz"
srcdir=${location}/${pkgname}-autoconf-${_pkgver}

kiin_make() {
  export CFLAGS="$CFLAGS -DSQLITE_ENABLE_FTS3=1 \
    -DSQLITE_ENABLE_COLUMN_METADATA=1 \
    -DSQLITE_ENABLE_UNLOCK_NOTIFY=1 \
    -DSQLITE_SECURE_DELETE=1"
  ./configure --prefix=/usr \
    --disable-static \
    --disable-readline \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
