#!/bin/sh

pkgname=python-falcon
SKIP_ARCH_CHECK=1
pkgver=1.1.0
vcs=git
vcs_pkgname=falcon
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
    cp -r docs/_build/html ${pkgdir}/usr/share/doc/python-falcon
}
