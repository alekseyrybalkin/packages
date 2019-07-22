#!/bin/sh

#vcs=none
pkgname=links
pkgver=2.19
urls="http://${pkgname}.twibright.com/download/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
relmon_id=1822

kiin_make() {
    ./configure --prefix=/usr --mandir=/usr/share/man
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    install -v -d -m755 ${pkgdir}/usr/share/doc/links-${pkgver}
    install -v -m644 doc/links_cal/* KEYS BRAILLE_HOWTO \
        ${pkgdir}/usr/share/doc/links-${pkgver}
}
