#!/bin/sh

pkgname=groff
pkgver=1.22.3
vcs=git
gittag=${pkgver}.real
urls="http://ftp.gnu.org/gnu/groff/groff-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
relmon_id=1253

undead_make() {
    MAKEFLAGS=
    PAGE=A4 ./configure --prefix=/usr --without-x --with-doc=no
    make
}

undead_install() {
    MAKEFLAGS=
    make prefix=${pkgdir}/usr install
    rm -rf ${pkgdir}/usr/share/doc/groff-${pkgver}/pdf
}
