#!/bin/sh

pkgname=python-flask
pkgver=1.0.3
vcs=git
vcs_pkgname=flask
gittag=${pkgver}
relmon_id=3867

kiin_make() {
    python setup.py build
    cd docs
    make html
}

kiin_install() {
    python setup.py install --prefix=/usr --root=${pkgdir}
    mkdir -pv ${pkgdir}/usr/share/doc
    cp -r docs/_build/html ${pkgdir}/usr/share/doc/python-flask
}
