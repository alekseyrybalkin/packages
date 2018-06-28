#!/bin/sh

pkgname=python-greenlet
pkgver=0.4.13
vcs=git
vcs_pkgname=greenlet
gittag=${pkgver}
relmon_id=6870

undead_make() {
    python setup.py build
    cd doc
    make html
}

undead_install() {
    python setup.py install --root=${pkgdir}
    mkdir -pv ${pkgdir}/usr/share/doc
    cp -r doc/_build/html ${pkgdir}/usr/share/doc/python-greenlet
}
