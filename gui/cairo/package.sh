#!/bin/sh

pkgname=cairo
vcs=git
pkgver=1.14.8
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    export ac_cv_lib_lzo2_lzo2a_decompress="no"
    NOCONFIGURE=1 ./autogen.sh
    CFLAGS="${CFLAGS} -ffat-lto-objects" ./configure --prefix=/usr \
        --disable-static \
        --enable-gl \
        --enable-egl \
        --enable-tee \
        --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
