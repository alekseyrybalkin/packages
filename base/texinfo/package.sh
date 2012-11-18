#!/bin/sh

pkgname=texinfo
pkgver=4.13a
urls="http://ftp.gnu.org/gnu/texinfo/texinfo-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-4.13

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} TEXMF=/usr/share/texmf install-tex
}
