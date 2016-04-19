#!/bin/sh

pkgname=sqlite
pkgver=3.12.2
_pkgver=3120200
srctar=${pkgname}-autoconf-${_pkgver}.tar.gz
urls="http://sqlite.org/2016/${pkgname}-autoconf-${_pkgver}.tar.gz"
srcdir=${location}/${pkgname}-autoconf-${_pkgver}
# fossil build requires tclsh
#vcs=fossil
#fossiltag=version-${pkgver}
#srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  MAKEFLAGS=
  patch -p1 -i ../sqlite-history-file-location.diff
  # ./configure
  # make amalgamation-tarball
  #cd autoconf
  #autoreconf -f -i
  export CFLAGS="$CFLAGS -DSQLITE_ENABLE_FTS3=1 \
    -DSQLITE_ENABLE_COLUMN_METADATA=1 \
    -DSQLITE_ENABLE_UNLOCK_NOTIFY=1 \
    -DSQLITE_ENABLE_DBSTAT_VTAB=1 \
    -DSQLITE_SECURE_DELETE=1"
  ./configure --prefix=/usr \
    --disable-static \
    --enable-readline \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  MAKEFLAGS=
  #cd autoconf
  make DESTDIR=${pkgdir} install
}
