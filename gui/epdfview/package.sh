#!/bin/sh

pkgname=epdfview
pkgver=0.1.8
urls="http://trac.emma-soft.com/epdfview/chrome/site/releases/epdfview-${pkgver}.tar.bz2 \
  http://www.linuxfromscratch.org/patches/blfs/svn/epdfview-${pkgver}-fixes-1.patch"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../epdfview-${pkgver}-fixes-1.patch
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
