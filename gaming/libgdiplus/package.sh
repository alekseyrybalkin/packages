#!/bin/sh

pkgname=libgdiplus
pkgver=2.10.9
urls="http://download.mono-project.com/sources/${pkgname}/${pkgname}-${pkgver}.tar.bz2 \
  http://rybalkin.org/kiin-files/libgdiplus-${pkgver}-freetype25.patch \
  http://rybalkin.org/kiin-files/libgdiplus-${pkgver}-gold.patch \
  http://rybalkin.org/kiin-files/libgdiplus-${pkgver}-giflib5.patch \
  http://rybalkin.org/kiin-files/libgdiplus-${pkgver}-libpng15.patch"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np0 -i ${KIIN_HOME}/tarballs/libgdiplus-${pkgver}-libpng15.patch
  for i in giflib5 gold freetype25; do
    patch -Np1 -i ${KIIN_HOME}/tarballs/libgdiplus-${pkgver}-${i}.patch
  done
  sed -i -e 's/-L\${libjpeg_prefix}\/lib -ljpeg/-ljpeg/' configure
  ./configure --prefix=/usr --with-cairo=system
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
