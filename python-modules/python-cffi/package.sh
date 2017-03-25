#!/bin/sh

pkgname=python-cffi
pkgver=1.10.0
vcs=mercurial
vcs_pkgname=cffi
# FIXME
hgtag=486d919c0b87
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
