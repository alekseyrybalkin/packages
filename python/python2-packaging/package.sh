#!/bin/sh

pkgname=python2-packaging
ARCH_NAME=python-packaging
pkgver=19.0
vcs=git
vcs_pkgname=packaging
gittag=${pkgver}
relmon_id=11718

kiin_make() {
    python2 setup.py build
}

kiin_install() {
    python2 setup.py install --root=${pkgdir}
}
