#!/bin/sh

pkgname=python-certifi
pkgver=2017.07.27.1
ARCH_VERSION=2017.7.27.1
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
