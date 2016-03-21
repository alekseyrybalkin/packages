#!/bin/sh

pkgname=nasm
pkgver=2.12.01
vcs=git
gittag=nasm-${pkgver}
urls="http://www.nasm.us/pub/nasm/releasebuilds/${pkgver}/nasm-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

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
