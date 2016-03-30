#!/bin/sh

pkgname=python-cffi
pkgver=1.5.2
vcs=mercurial
hg_pkgname=cffi
hgtag=4640c7bfb316
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  python setup.py build
}

kiin_install() {
  python setup.py install --root=${pkgdir}
}
