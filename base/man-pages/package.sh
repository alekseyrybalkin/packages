#!/bin/sh

pkgname=man-pages
pkgver=3.73
urls="https://www.kernel.org/pub/linux/docs/${pkgname}/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  make prefix=${pkgdir}/usr install
  # these are included in shadow
  rm -f ${pkgdir}/usr/share/man/man5/passwd.5
  rm -f ${pkgdir}/usr/share/man/man3/getspnam.3
}
