#!/bin/sh

pkgname=python-pygments
pkgver=2.2.0
vcs=mercurial
vcs_pkgname=pygments
hgtag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}
relmon_id=3986

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
