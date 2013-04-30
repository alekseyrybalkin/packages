#!/bin/sh

pkgname=lcms
pkgver=1.19
urls="http://sourceforge.net/projects/lcms/files/lcms/1.19/lcms-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  install -v -m755 -d ${pkgdir}/usr/share/doc/lcms
  install -v -m644 README.1ST doc/* \
    ${pkgdir}/usr/share/doc/lcms
}
