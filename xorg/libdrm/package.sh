#!/bin/sh

pkgname=libdrm
pkgver=2.4.98
vcs=git
gittag=libdrm-${pkgver}
relmon_id=1596

build() {
    ./autogen.sh --prefix=$XORG_PREFIX \
        --enable-udev \
        --disable-cairo-tests \
        --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
