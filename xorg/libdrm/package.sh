#!/bin/sh

pkgname=libdrm
pkgver=2.4.70
vcs=git
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    sed -e "/pthread-stubs/d" -i configure.ac
    ./autogen.sh --prefix=$XORG_PREFIX \
        --enable-udev \
        --disable-cairo-tests \
        --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
