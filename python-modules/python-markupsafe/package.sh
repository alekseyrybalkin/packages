#!/bin/sh

pkgname=python-markupsafe
pkgver=0.23
urls="http://pypi.python.org/packages/source/M/MarkupSafe/MarkupSafe-${pkgver}.tar.gz"
srctar=MarkupSafe-${pkgver}.tar.gz
srcdir=${location}/MarkupSafe-${pkgver}

kiin_make() {
  python setup.py build
}

kiin_install() {
  python setup.py install --root=${pkgdir}
}
