#!/bin/sh

pkgname=lcms
ARCH_NAME=lcms2
pkgver=2.9
vcs=git
gittag=lcms${pkgver}
# rc versions
#relmon_id=9815

kiin_make() {
    ./autogen.sh --prefix=/usr --disable-static --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
