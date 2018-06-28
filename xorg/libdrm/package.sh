#!/bin/sh

pkgname=libdrm
pkgver=2.4.91
vcs=git
gittag=libdrm-${pkgver}
relmon_id=1596

undead_make() {
    ./autogen.sh --prefix=$XORG_PREFIX \
        --enable-udev \
        --disable-cairo-tests \
        --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
