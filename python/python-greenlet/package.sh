#!/bin/sh

pkgname=python-greenlet
pkgver=0.4.15
vcs=git
vcs_pkgname=greenlet
gittag=${pkgver}
relmon_id=6870

kiin_make() {
    python setup.py build
    cd doc
    make html
}

kiin_install() {
    python setup.py install --root=${pkgdir}
    mkdir -pv ${pkgdir}/usr/share/doc
    cp -r doc/_build/html ${pkgdir}/usr/share/doc/python-greenlet
}
