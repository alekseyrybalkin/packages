#!/bin/sh

pkgname=djvulibre
pkgver=3.5.25.3
_major=3.5.25
urls="http://downloads.sourceforge.net/project/djvu/DjVuLibre/${_major}/djvulibre-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${_major}

kiin_make() {
  ./configure --prefix=/usr --disable-desktopfiles
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
