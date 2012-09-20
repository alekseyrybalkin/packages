#!/bin/sh

pkgname=python2-virtualenv
pkgver=1.8.1
srctar=virtualenv-${pkgver}.tar.gz
srcdir=${location}/virtualenv-${pkgver}

kiin_make() {
  python2 setup.py build
}

kiin_install() {
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
