#!/bin/sh

pkgname=python2-packaging
ARCH_NAME=python-packaging
pkgver=16.8
vcs=git
vcs_pkgname=packaging
gittag=${pkgver}
relmon_id=11718

undead_make() {
  python2 setup.py build
}

undead_install() {
  python2 setup.py install --root=${pkgdir}
}
