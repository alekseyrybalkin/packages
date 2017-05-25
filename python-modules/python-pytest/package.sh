#!/bin/sh

pkgname=python-pytest
pkgver=3.1.0
vcs=git
vcs_pkgname=pytest
gittag=${pkgver}
relmon_id=3765

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
