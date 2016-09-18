#!/bin/sh

pkgname=python-cffi
pkgver=1.8.3
vcs=mercurial
vcs_pkgname=cffi
hgtag=a41b29125858
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
