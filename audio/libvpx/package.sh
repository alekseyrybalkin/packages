#!/bin/sh

pkgname=libvpx
pkgver=1.8.0
vcs=git
gittag=v${pkgver}
relmon_id=11083

build() {
    mkdir libvpx-build
    cd libvpx-build
    ../configure --prefix=/usr \
        --enable-shared \
        --disable-static \
        --libdir=${LIBDIR}
    make
}

package() {
    cd libvpx-build
    make DESTDIR=${pkgdir} install
}
