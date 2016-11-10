#!/bin/sh

pkgname=memcached
pkgver=1.4.33
vcs=git
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    sed -i -e 's/automake-1.14/automake-1.15\ automake-1.14/g' autogen.sh
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
