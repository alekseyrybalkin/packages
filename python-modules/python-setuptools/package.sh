#!/bin/sh

pkgname=python-setuptools
pkgver=20.6.7
vcs=git
git_pkgname=setuptools
gittag=v${pkgver}
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
