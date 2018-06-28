#!/bin/sh

pkgname=libxfont
ARCH_NAME=libxfont2
pkgver=2.0.3
vcs=git
gittag=libXfont2-${pkgver}
relmon_id=1776

undead_make() {
    ./autogen.sh $XORG_CONFIG --disable-devel-docs
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
