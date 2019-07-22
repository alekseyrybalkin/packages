#!/bin/sh

pkgname=python-jinja
pkgver=2.10.1
vcs=git
vcs_pkgname=jinja
gittag=${pkgver}
relmon_id=3894

kiin_make() {
    python setup.py build
    cd docs
    make html
}

kiin_install() {
    python setup.py install --root=${pkgdir}
    mkdir -pv ${pkgdir}/usr/share/doc
    cp -r docs/_build/html ${pkgdir}/usr/share/doc/python-jinja
}
