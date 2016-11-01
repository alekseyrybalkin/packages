#!/bin/sh

pkgname=python-pytest
pkgver=3.0.3
vcs=git
vcs_pkgname=pytest
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
    cd doc/en
    make html
}

kiin_install() {
    python setup.py install --root=${pkgdir}
    mkdir -pv ${pkgdir}/usr/share/doc
    cp -r doc/en/_build/html ${pkgdir}/usr/share/doc/python-pytest
}
