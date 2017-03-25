#!/bin/sh

pkgname=memcached
pkgver=1.4.36
vcs=git
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}
relmon_id=1965

kiin_make() {
    sed -i -e 's/automake-1.14/automake-1.15\ automake-1.14/g' autogen.sh
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
