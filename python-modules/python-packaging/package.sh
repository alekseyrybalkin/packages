#!/bin/sh

pkgname=python-packaging
pkgver=19.0
vcs=git
vcs_pkgname=packaging
gittag=${pkgver}
relmon_id=11718

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
