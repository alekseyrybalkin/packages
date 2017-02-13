#!/bin/sh

pkgname=python-wheel
pkgver=0.29.0
vcs=mercurial
vcs_pkgname=wheel
hgtag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
