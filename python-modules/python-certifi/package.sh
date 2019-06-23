#!/bin/sh

pkgname=python-certifi
pkgver=2019.06.16
vcs=git
gittag=${pkgver}
# tags != versions
#relmon_id=7995

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
