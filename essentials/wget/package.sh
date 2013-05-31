#!/bin/sh

pkgname=wget
pkgver=1.14
urls="http://ftp.gnu.org/gnu/wget/wget-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e 's/COMMENT_IF_NO_POD2MAN=$/COMMENT_IF_NO_POD2MAN="# "/g' configure
  ./configure --prefix=/usr      \
              --sysconfdir=/etc  \
              --with-ssl=openssl
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  echo "ca-directory=/etc/ssl/certs" >> ${pkgdir}/etc/wgetrc
}
