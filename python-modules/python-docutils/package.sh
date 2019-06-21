#!/bin/sh

pkgname=python-docutils
vcs_pkgname=docutils
ARCH_NAME=docutils
pkgver=0.14
vcs=git
gittag=docutils-${pkgver}
relmon_id=3849

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
    find ${pkgdir}/usr/lib/python3*/site-packages -type f | xargs chmod 644
}
