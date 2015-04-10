#!/bin/sh

pkgname=sqlite
pkgver=3.8.9.0
_pkgver=3080900
srctar=${pkgname}-autoconf-${_pkgver}.tar.gz
urls="http://sqlite.org/2015/${pkgname}-autoconf-${_pkgver}.tar.gz"
srcdir=${location}/${pkgname}-autoconf-${_pkgver}

kiin_make() {
  patch -p1 -i ../sqlite-history-file-location.diff
  export CFLAGS="$CFLAGS -DSQLITE_ENABLE_FTS3=1 \
    -DSQLITE_ENABLE_COLUMN_METADATA=1 \
    -DSQLITE_ENABLE_UNLOCK_NOTIFY=1 \
    -DSQLITE_SECURE_DELETE=1"
  ./configure --prefix=/usr \
    --disable-static \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
