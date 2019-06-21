#!/bin/sh

pkgname=python2-pyparsing
ARCH_NAME=python-pyparsing
pkgver=2.4.0
vcs=git
vcs_pkgname=pyparsing
gittag=pyparsing_${pkgver}
urls="http://downloads.sourceforge.net/pyparsing/pyparsing-${pkgver}.tar.gz"
srctar=pyparsing-${pkgver}.tar.gz
relmon_id=3756

kiin_make() {
    python2 setup.py build
}

kiin_install() {
    python2 setup.py install --root=${pkgdir}
}
