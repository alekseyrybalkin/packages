#!/bin/sh

pkgname=glew
pkgver=1.9.0
urls="http://downloads.sourceforge.net/glew/glew-${pkgver}.tgz"
srctar=${pkgname}-${pkgver}.tgz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i 's|lib64|lib|' config/Makefile.linux
  make
}

kiin_install() {
  make GLEW_DEST=${pkgdir}/usr install.all
  rm ${pkgdir}/usr/lib/{libGLEW,libGLEWmx}.a
}
