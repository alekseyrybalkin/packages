#!/bin/sh

pkgname=libpng
pkgver=1.6.34
vcs=git
gittag=v${pkgver}
relmon_id=1705

undead_make() {
    autoreconf -fi
    ./configure --prefix=/usr --disable-static
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
    mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
    cp README libpng-manual.txt ${pkgdir}/usr/share/doc/${pkgname}
}
