#!/bin/sh

pkgname=python-chess
SKIP_ARCH_CHECK=1
pkgver=0.18.2
vcs=git
gittag=v${pkgver}

kiin_make() {
    python setup.py build
    cd docs
    make html
}

kiin_install() {
    python setup.py install --root=${pkgdir}
    mkdir -pv ${pkgdir}/usr/share/doc
    cp -r docs/_build/html ${pkgdir}/usr/share/doc/python-chess
}
