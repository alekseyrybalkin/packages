#!/bin/sh

pkgname=python2-virtualenv
ARCH_NAME=python-virtualenv
pkgver=15.1.0
vcs=git
vcs_pkgname=virtualenv
gittag=${pkgver}
relmon_id=6904

undead_make() {
  python2 setup.py build
}

undead_install() {
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
}
