#!/bin/sh

pkgname=python-youtube-dl
ARCH_NAME=youtube-dl
# updated too often...
SKIP_ARCH_CHECK=1
pkgver=2016.03.06
urls="http://youtube-dl.org/downloads/${pkgver}/youtube-dl-${pkgver}.tar.gz"
srctar=youtube-dl-${pkgver}.tar.gz
srcdir=${location}/youtube-dl

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  python setup.py install --root=${pkgdir} --optimize=1
  rm -rf ${pkgdir}/usr/etc
}
