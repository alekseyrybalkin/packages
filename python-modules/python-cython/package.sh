#!/bin/sh

pkgname=python-cython
ARCH_NAME=cython
pkgver=0.28.1
vcs=git
vcs_pkgname=cython
gittag=${pkgver}
relmon_id=12679

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
