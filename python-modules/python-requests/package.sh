#!/bin/sh

pkgname=python-requests
pkgver=2.18.1
vcs=git
vcs_pkgname=requests
gittag=v${pkgver}
relmon_id=4004

kiin_make() {
    python setup.py build
    cd docs
    make html
}

kiin_install() {
    python setup.py install --root=${pkgdir}
    mkdir -pv ${pkgdir}/usr/share/doc
    cp -r docs/_build/html ${pkgdir}/usr/share/doc/python-requests
}
