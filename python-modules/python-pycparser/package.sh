#!/bin/sh

pkgname=python-pycparser
pkgver=2.17
vcs=git
vcs_pkgname=pycparser
gittag=release_v${pkgver}
relmon_id=8175

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
