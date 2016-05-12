#!/bin/sh

pkgname=python-cffi
pkgver=1.6.0
vcs=mercurial
vcs_pkgname=cffi
hgtag=a61429d5ad2d
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
