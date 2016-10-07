#!/bin/sh

pkgname=libdrm
pkgver=2.4.71
vcs=git
#gittag=${pkgver}
gittag=a44c9c31b7b38b3eedf3d26648f9e68dcc377c4c
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
