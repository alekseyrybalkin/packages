#!/bin/sh

pkgname=python-setuptools
# updated too often...
SKIP_ARCH_CHECK=1
pkgver=20.2.2
urls="http://pypi.python.org/packages/source/s/setuptools/setuptools-${pkgver}.tar.gz"
srctar=setuptools-${pkgver}.tar.gz
srcdir=${location}/setuptools-${pkgver}

kiin_make() {
  python setup.py build
}

kiin_install() {
  python setup.py install --prefix=/usr \
    --root=${pkgdir} --optimize=1 --skip-build
  # remove files with spaces in filenames
  rm ${pkgdir}/usr/lib/python3.5/site-packages/setuptools/script*
}
