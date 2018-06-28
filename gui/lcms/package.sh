#!/bin/sh

pkgname=lcms
ARCH_NAME=lcms2
pkgver=2.9
vcs=git
gittag=lcms${pkgver}
urls="http://downloads.sourceforge.net/lcms/lcms2-${pkgver}.tar.gz"
srctar=lcms2-${pkgver}.tar.gz
# rc versions
#relmon_id=9815

undead_make() {
    ./autogen.sh --prefix=/usr --disable-static --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
