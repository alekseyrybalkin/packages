#!/bin/sh

pkgname=cairo
vcs=git
pkgver=1.17.2
gittag=${pkgver}
# development version
#relmon_id=247

kiin_make() {
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr \
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
