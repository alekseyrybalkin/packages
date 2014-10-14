#!/bin/sh

pkgname=libgdiplus
pkgver=3.8
urls="http://download.mono-project.com/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../libgdiplus0-giflib5.patch
  sed -i -e 's/-L\${libjpeg_prefix}\/lib -ljpeg/-ljpeg/' configure
  ./configure --prefix=/usr --with-cairo=system
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
