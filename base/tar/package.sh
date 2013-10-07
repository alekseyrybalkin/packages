#!/bin/sh

pkgname=tar
pkgver=1.27
urls="http://ftp.gnu.org/gnu/tar/tar-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e '/gets is a/d' gnu/stdio.in.h
  ./configure --prefix=/usr --bindir=/bin --libexecdir=/usr/sbin
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} -C doc install-html docdir=/usr/share/doc/tar
}
