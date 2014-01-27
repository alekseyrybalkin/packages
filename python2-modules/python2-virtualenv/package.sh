#!/bin/sh

pkgname=python2-virtualenv
ARCH_NAME=python-virtualenv
pkgver=1.11.2
urls="http://pypi.python.org/packages/source/v/virtualenv/virtualenv-${pkgver}.tar.gz"
srctar=virtualenv-${pkgver}.tar.gz
srcdir=${location}/virtualenv-${pkgver}

kiin_make() {
  python2 setup.py build
}

kiin_install() {
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
}
