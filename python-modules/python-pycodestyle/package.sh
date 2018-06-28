#!/bin/sh

pkgname=python-pycodestyle
pkgver=2.3.1
vcs=git
vcs_pkgname=pycodestyle
gittag=${pkgver}
relmon_id=11773

undead_make() {
    python setup.py build
    cd docs
    make html
}

undead_install() {
    python setup.py install --root=${pkgdir}
    mkdir -pv ${pkgdir}/usr/share/doc
    cp -r docs/_build/html ${pkgdir}/usr/share/doc/python-pycodestyle
}
