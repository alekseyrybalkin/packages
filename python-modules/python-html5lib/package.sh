#!/bin/sh

pkgname=python-html5lib
pkgver=0.9999999
vcs=git
vcs_pkgname=html5lib-python
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
