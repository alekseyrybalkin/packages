#!/bin/sh

pkgname=python-pyparsing
pkgver=2.2.0
urls="http://downloads.sourceforge.net/pyparsing/pyparsing-${pkgver}.tar.gz"
srctar=pyparsing-${pkgver}.tar.gz
srcdir=${location}/pyparsing-${pkgver}

kiin_make() {
  python setup.py build
}

kiin_install() {
  python setup.py install --root=${pkgdir}
}
