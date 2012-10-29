#!/bin/sh

pkgname=python2-openssl
pkgver=0.13
urls="http://pypi.python.org/packages/source/p/pyOpenSSL/pyOpenSSL-${pkgver}.tar.gz"
srctar=pyOpenSSL-${pkgver}.tar.gz
srcdir=${location}/pyOpenSSL-${pkgver}

kiin_make() {
  python setup.py build
}

kiin_install() {
  python setup.py install --root "${pkgdir}" --optimize=1
}
