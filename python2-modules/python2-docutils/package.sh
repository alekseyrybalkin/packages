#!/bin/sh

pkgname=python2-docutils
vcs_pkgname=docutils
ARCH_NAME=docutils
pkgver=0.14
vcs=git
gittag=docutils-${pkgver}
relmon_id=3849

kiin_make() {
    python2 setup.py build
    find . -type f -exec \
        sed -i '1s,^#! \?/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' {} \;
}

kiin_install() {
    python2 setup.py install --root=${pkgdir}
    find ${pkgdir}/usr/lib/python2.7/site-packages -type f | xargs chmod 644
    for _f in ${pkgdir}/usr/bin/*.py; do
        mv -v "$_f" "${_f%.py}2.py"
    done
}
