#!/bin/sh

pkgname=python2-mako
ARCH_NAME=python-mako
pkgver=1.0.1
urls="https://pypi.python.org/packages/source/M/Mako/Mako-${pkgver}.tar.gz"
srctar=Mako-${pkgver}.tar.gz
srcdir=${location}/Mako-${pkgver}

kiin_make() {
  python2 setup.py build
}

kiin_install() {
  python2 setup.py install --root=${pkgdir}
}
