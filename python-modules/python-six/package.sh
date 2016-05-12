#!/bin/sh

pkgname=python-six
pkgver=1.10.0
vcs=mercurial
vcs_pkgname=six
hgtag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
