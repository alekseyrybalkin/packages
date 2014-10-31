#!/bin/sh

pkgname=python2-setuptools
ARCH_NAME=python-setuptools
# updated too often...
SKIP_ARCH_CHECK=1
pkgver=7.0
urls="http://pypi.python.org/packages/source/s/setuptools/setuptools-${pkgver}.tar.gz"
srctar=setuptools-${pkgver}.tar.gz
srcdir=${location}/setuptools-${pkgver}

kiin_make() {
  python2 setup.py build
}

kiin_install() {
  python2 setup.py install --prefix=/usr \
    --root=${pkgdir} --optimize=1 --skip-build
  # remove files with spaces in filenames
  rm ${pkgdir}/usr/lib/python2.7/site-packages/setuptools/script*
}
