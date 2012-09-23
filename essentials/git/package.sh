#!/bin/sh

pkgname=git
pkgver=1.7.12
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
  # man pages anyone?
}
