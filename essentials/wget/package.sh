#!/bin/sh

pkgname=wget
pkgver=1.16.3
urls="http://ftp.gnu.org/gnu/wget/wget-${pkgver}.tar.xz"
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
  echo "ca-directory=/etc/ssl/certs" >> ${pkgdir}/etc/wgetrc
}
