#!/bin/sh

pkgname=wget
pkgver=1.16.3
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  git clone ${KIIN_HOME}/sources/gnulib
  ./bootstrap --skip-po
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-ssl=openssl
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  echo "ca-directory=/etc/ssl/certs" >> ${pkgdir}/etc/wgetrc
}
