#!/bin/sh

pkgname=imlib
ARCH_NAME=imlib2
pkgver=1.5.1
vcs=git
vcs_pkgname=imlib2
gittag=v${pkgver}
urls="http://downloads.sourceforge.net/enlightenment/imlib2-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2

kiin_make() {
    ./autogen.sh --prefix=/usr --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
