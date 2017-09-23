#!/bin/sh

pkgname=python-falcon
SKIP_ARCH_CHECK=1
pkgver=1.3.0
vcs=git
vcs_pkgname=falcon
gittag=${pkgver}
relmon_id=3860

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
