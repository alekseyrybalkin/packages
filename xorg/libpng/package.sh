#!/bin/sh

pkgname=libpng
pkgver=1.6.29
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    autoreconf -fi
    ./configure --prefix=/usr --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
    cp README libpng-manual.txt ${pkgdir}/usr/share/doc/${pkgname}
}
