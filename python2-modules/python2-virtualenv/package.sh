#!/bin/sh

pkgname=python2-virtualenv
ARCH_NAME=python-virtualenv
pkgver=16.6.1
vcs=git
vcs_pkgname=virtualenv
gittag=${pkgver}
relmon_id=6904

kiin_make() {
    python2 setup.py build
}

kiin_install() {
    python2 setup.py install --prefix=/usr --root="${pkgdir}"
}
