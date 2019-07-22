#!/bin/sh

pkgname=python-pyparsing
pkgver=2.4.0
vcs=git
vcs_pkgname=pyparsing
gittag=pyparsing_${pkgver}
relmon_id=3756

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
