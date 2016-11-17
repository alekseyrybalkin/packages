#!/bin/sh

pkgname=python-pycodestyle
pkgver=2.2.0
vcs=git
vcs_pkgname=pycodestyle
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
    cd docs
    make html
}

kiin_install() {
    python setup.py install --root=${pkgdir}
    mkdir -pv ${pkgdir}/usr/share/doc
    cp -r docs/_build/html ${pkgdir}/usr/share/doc/python-pycodestyle
}
