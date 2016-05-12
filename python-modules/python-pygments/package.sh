#!/bin/sh

pkgname=python-pygments
pkgver=2.1.3
vcs=mercurial
hg_pkgname=pygments
hgtag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
