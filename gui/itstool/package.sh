#!/bin/sh

pkgname=itstool
pkgver=2.0.2
ARCH_VERSION=2.0.2+5+g676f3f7
vcs=git
gittag=${pkgver}
urls="http://files.itstool.org/itstool/itstool-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    sed -i 's/| python/&2/' configure.ac
    autoreconf -fi
    ./configure --prefix=/usr PYTHON=/usr/bin/python2
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
