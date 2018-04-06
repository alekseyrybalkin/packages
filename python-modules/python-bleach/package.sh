#!/bin/sh

pkgname=python-bleach
SKIP_ARCH_CHECK=1
pkgver=2.1.3
vcs=git
vcs_pkgname=bleach
gittag=v${pkgver}
relmon_id=11532

kiin_make() {
    python setup.py build
    cd docs
    make html
}

kiin_install() {
    python setup.py install --root=${pkgdir}
    mkdir -pv ${pkgdir}/usr/share/doc
    cp -r docs/_build/html ${pkgdir}/usr/share/doc/python-bleach
}
