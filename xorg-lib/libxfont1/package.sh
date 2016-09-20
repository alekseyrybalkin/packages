#!/bin/sh

pkgname=libxfont1
SKIP_ARCH_CHECK=1
pkgver=1.5.2
vcs=git
vcs_pkgname=libxfont
gittag=libXfont-${pkgver}
srcdir=${location}/libXfont-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG --disable-devel-docs
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
