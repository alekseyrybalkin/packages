#!/bin/sh

pkgname=apr
pkgver=1.6.0
vcs=git
gittag=${pkgver}
extension=bz2
folder="http://archive.apache.org/dist/${pkgname}/"
check_server=1
relmon_id=95

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    sed -i -e 's/python/python2/g' build/gen-build.py
    ./buildconf
    sed -i -e 's/$RM "$cfgfile"/$RM -f "$cfgfile"/g' configure
    ./configure --prefix=/usr --disable-static \
        --with-installbuilddir=/usr/share/apr-1/build
    make
}

kiin_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
}
