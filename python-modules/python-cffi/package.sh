#!/bin/sh

pkgname=python-cffi
pkgver=1.8.2
vcs=mercurial
vcs_pkgname=cffi
hgtag=477e1350143e
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
