#!/bin/sh

pkgname=nasm
pkgver=2.13.03
vcs=git
gittag=nasm-${pkgver}
urls="http://www.nasm.us/pub/nasm/releasebuilds/${pkgver}/nasm-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
relmon_id=2048

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make dist
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make INSTALLROOT=${pkgdir} install
}
