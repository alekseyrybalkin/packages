#!/bin/sh

pkgname=git
pkgver=1.8.1.2
urls="http://${pkgname}-core.googlecode.com/files/${pkgname}-${pkgver}.tar.gz \
  http://${pkgname}-core.googlecode.com/files/${pkgname}-manpages-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr         \
              --libexecdir=/usr/lib \
              --with-gitconfig=/etc/gitconfig
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  tar -xf ../${pkgname}-manpages-${pkgver}.tar.gz -C ${pkgdir}/usr/share/man \
    --no-same-owner
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
