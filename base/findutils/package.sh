#!/bin/sh

pkgname=findutils
pkgver=4.4.2
urls="http://ftp.gnu.org/gnu/findutils/findutils-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr                   \
              --libexecdir=/usr/lib/findutils \
              --localstatedir=/var/lib/locate
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  # remove /var, filesystem package creates everything in there
  rm -rvf ${pkgdir}/var
}
