#!/bin/sh

pkgname=tar
pkgver=1.26
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e '/gets is a/d' gnu/stdio.in.h
  FORCE_UNSAFE_CONFIGURE=1  \
  ./configure --prefix=/usr \
              --bindir=/bin \
              --libexecdir=/usr/sbin
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} -C doc install-html docdir=/usr/share/doc/tar-1.26
}
