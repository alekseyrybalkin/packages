#!/bin/sh

pkgname=sqlite
pkgver=3.7.14
srctar=${pkgname}-autoconf-3071400.tar.gz
srcdir=${location}/${pkgname}-autoconf-3071400

kiin_make() {
  export CFLAGS="$CFLAGS -DSQLITE_ENABLE_FTS3=1 -DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_ENABLE_UNLOCK_NOTIFY -DSQLITE_SECURE_DELETE"
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
