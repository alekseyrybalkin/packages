#!/bin/sh

pkgname=python-cffi
pkgver=1.9.1
vcs=mercurial
vcs_pkgname=cffi
hgtag=e0ccab2917b5
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
