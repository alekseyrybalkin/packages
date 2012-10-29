#!/bin/sh

pkgname=python2-crypto
pkgver=2.6
urls="http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto/pycrypto-${pkgver}.tar.gz"
srctar=pycrypto-${pkgver}.tar.gz
srcdir=${location}/pycrypto-${pkgver}

kiin_make() {
  python setup.py build
}

kiin_install() {
  python setup.py install --root "${pkgdir}" --optimize=1
}
