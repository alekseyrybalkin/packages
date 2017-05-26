#!/bin/sh

pkgname=sqlite
vcs=fossil

pkgver=3.19.2
fossiltag=version-${pkgver}
relmon_id=4877


kiin_make() {
    MAKEFLAGS=
    ./configure
    make amalgamation-tarball
    tar xvf sqlite-autoconf-*.tar.gz
    rm sqlite-autoconf-*.tar.gz
    cd sqlite-autoconf-*
    patch -p1 -i ../../sqlite-history-file-location.diff
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
    cd sqlite-autoconf-*
    make DESTDIR=${pkgdir} install
}
