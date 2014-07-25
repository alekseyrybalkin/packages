#!/bin/sh

pkgname=python2-youtube-dl
ARCH_NAME=youtube-dl
# updated too often...
SKIP_ARCH_CHECK=1
pkgver=2014.07.24
urls="http://youtube-dl.org/downloads/${pkgver}/youtube-dl-${pkgver}.tar.gz"
srctar=youtube-dl-${pkgver}.tar.gz
srcdir=${location}/youtube-dl

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  python2 setup.py install --root=${pkgdir} --optimize=1
  rm -rf ${pkgdir}/usr/etc
}
