#!/bin/sh

pkgname=xz
pkgver=5.0.5
urls="http://tukaani.org/xz/xz-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --docdir=/usr/share/doc/xz
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir ${pkgdir}/lib
  mv -v ${pkgdir}/usr/lib/liblzma.so.* ${pkgdir}/lib
  ln -svf ../../lib/$(readlink ${pkgdir}/usr/lib/liblzma.so) \
    ${pkgdir}/usr/lib/liblzma.so
}
