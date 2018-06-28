#!/bin/sh

pkgname=itstool
pkgver=2.0.4
ARCH_VERSION=2.0.4+1+g9b84c00
vcs=git
gittag=${pkgver}
urls="http://files.itstool.org/itstool/itstool-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
relmon_id=13109

undead_make() {
    sed -i 's/| python/&2/' configure.ac
    autoreconf -fi
    ./configure --prefix=/usr PYTHON=/usr/bin/python2
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
