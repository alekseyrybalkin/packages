#!/bin/sh

#vcs=git
pkgname=autoconf2.13
pkgver=2.13
urls="http://ftpmirror.gnu.org/autoconf/autoconf-${pkgver}.tar.gz"
srctar=autoconf-${pkgver}.tar.gz
srcdir=${location}/autoconf-${pkgver}

kiin_make() {
    ./configure --prefix=/usr \
        --infodir=/usr/share/info \
        --program-suffix=-2.13
    make
}

kiin_install() {
    make prefix="${pkgdir}/usr" \
        infodir="${pkgdir}/usr/share/info" install
    mv "${pkgdir}"/usr/share/info/autoconf{,-2.13}.info
    mv "${pkgdir}"/usr/share/info/standards{,-2.13}.info
}
