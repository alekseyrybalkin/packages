#!/bin/sh

pkgname=findutils
pkgver=4.4.2
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
  mkdir -pv ${pkgdir}/bin
  mv -v ${pkgdir}/usr/bin/find ${pkgdir}/bin
  sed -i 's/find:=${BINDIR}/find:=\/bin/' ${pkgdir}/usr/bin/updatedb
  # remove /var, filesystem package creates everything in there
  rm -rvf ${pkgdir}/var
}
