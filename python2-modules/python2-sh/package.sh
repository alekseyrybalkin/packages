#!/bin/sh

pkgname=python2-sh
pkgver=1.08
urls="http://pypi.python.org/packages/source/s/sh/sh-${pkgver}.tar.gz"
srctar=sh-${pkgver}.tar.gz
srcdir=${location}/sh-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  python2 setup.py install --root=${pkgdir}
}
