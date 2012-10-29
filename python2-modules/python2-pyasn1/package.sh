#!/bin/sh

pkgname=python2-pyasn1
pkgver=0.1.4
urls="http://downloads.sourceforge.net/sourceforge/pyasn1/pyasn1-${pkgver}.tar.gz"
srctar=pyasn1-${pkgver}.tar.gz
srcdir=${location}/pyasn1-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  python setup.py install --root "${pkgdir}"
}
