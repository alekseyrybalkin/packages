#!/bin/sh

pkgname=apr
pkgver=1.7.0
vcs=git
gittag=${pkgver}
relmon_id=95

build() {
    sed -i -e 's/python/python2/g' build/gen-build.py
    ./buildconf
    sed -i -e 's/$RM "$cfgfile"/$RM -f "$cfgfile"/g' configure
    ./configure --prefix=/usr \
        --disable-static \
        --build=x86_64-unknown-linux-gnu \
        --with-installbuilddir=/usr/share/apr-1/build
    make
}

package() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
}
