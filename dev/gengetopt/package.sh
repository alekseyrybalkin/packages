#!/bin/sh

pkgname=gengetopt
pkgver=2.22.6
vcs=git
gittag=rel_${pkgver//\./_}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    MAKEFLAGS=
    autoreconf -f -i
    ./configure --prefix=/usr
    make
}

kiin_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
}
