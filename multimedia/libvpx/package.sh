#!/bin/sh

pkgname=libvpx
pkgver=1.6.1
vcs=git
gittag=v${pkgver}
relmon_id=11083

kiin_make() {
    sed -i 's/cp -p/cp/' build/make/Makefile
    chmod -v 644 vpx/*.h
    mkdir libvpx-build
    cd libvpx-build
    ../configure --prefix=/usr \
        --enable-shared \
        --disable-static \
        --libdir=${LIBDIR}
    make
}

kiin_install() {
    cd libvpx-build
    make DESTDIR=${pkgdir} install
}
