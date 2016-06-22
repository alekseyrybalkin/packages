#!/bin/sh

pkgname=python-cffi
pkgver=1.7.0
vcs=mercurial
vcs_pkgname=cffi
hgtag=338244197c0d
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
