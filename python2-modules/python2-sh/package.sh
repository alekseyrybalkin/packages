#!/bin/sh

pkgname=python2-sh
ARCH_NAME=python-sh
pkgver=1.09
urls="http://pypi.python.org/packages/source/s/sh/sh-${pkgver}.tar.gz"
srctar=sh-${pkgver}.tar.gz
srcdir=${location}/sh-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  python2 setup.py install --root=${pkgdir}
}
