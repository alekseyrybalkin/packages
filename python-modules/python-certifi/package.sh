#!/bin/sh

pkgname=python-certifi
pkgver=2018.01.18
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
