#!/bin/sh

pkgname=python-cython
ARCH_NAME=cython
pkgver=0.25.2
vcs=git
vcs_pkgname=cython
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
