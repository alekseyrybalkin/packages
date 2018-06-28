#!/bin/sh

pkgname=libxdmcp
pkgver=1.1.2
vcs=git
gittag=libXdmcp-${pkgver}
relmon_id=1772

undead_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
