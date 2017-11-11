#!/bin/sh

pkgname=libxfont
ARCH_NAME=libxfont2
pkgver=2.0.2
vcs=git
gittag=libXfont2-${pkgver}
relmon_id=1776

kiin_make() {
    ./autogen.sh $XORG_CONFIG --disable-devel-docs
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
