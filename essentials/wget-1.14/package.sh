#!/bin/sh

pkgname=wget
pkgver=1.14
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr      \
              --sysconfdir=/etc  \
              --with-ssl=openssl
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  # did not actually done that! <-- for cacerts
  echo ca-directory=/etc/ssl/certs >> ${pkgdir}/etc/wgetrc
}
