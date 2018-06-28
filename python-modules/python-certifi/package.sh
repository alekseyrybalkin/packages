#!/bin/sh

pkgname=python-certifi
pkgver=2018.01.18
vcs=git
gittag=${pkgver}
# tags != versions
#relmon_id=7995

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --root=${pkgdir}
}
