#!/bin/sh

pkgname=python-alabaster
ARCH_NAME=python-sphinx-alabaster-theme
pkgver=0.7.9
vcs=git
vcs_pkgname=alabaster
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
