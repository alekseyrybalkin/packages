#!/bin/sh

pkgname=python-pycparser
pkgver=2.14
vcs=git
vcs_pkgname=pycparser
gittag=release_v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
