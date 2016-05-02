#!/bin/sh

pkgname=python-cython
pkgver=0.24
vcs=git
git_pkgname=cython
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
