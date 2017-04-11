#!/bin/sh

pkgname=libdrm
pkgver=2.4.75
vcs=git
gittag=libdrm-${pkgver}
relmon_id=1596

kiin_make() {
    ./autogen.sh --prefix=$XORG_PREFIX \
        --enable-udev \
        --disable-cairo-tests \
        --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
