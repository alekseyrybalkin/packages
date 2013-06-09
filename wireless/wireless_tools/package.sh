#!/bin/sh

pkgname=wireless_tools
pkgver=29
urls="http://hpl.hp.com/personal/Jean_Tourrilhes/Linux/${pkgname}.${pkgver}.tar.gz"
srctar=${pkgname}.${pkgver}.tar.gz
srcdir=${location}/${pkgname}.${pkgver}

kiin_make() {
  make
}

kiin_install() {
  make PREFIX=${pkgdir}/usr \
    INSTALL_MAN=${pkgdir}/usr/share/man \
    ldconfig=/bin/true install
}
