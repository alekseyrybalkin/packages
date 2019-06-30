#!/bin/sh

pkgname=python-wheel
pkgver=0.33.4
vcs=git
vcs_pkgname=wheel
hgtag=${pkgver}
# alpha versions
#relmon_id=11428

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
