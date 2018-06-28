#!/bin/sh

pkgname=python-packaging
pkgver=16.8
vcs=git
vcs_pkgname=packaging
gittag=${pkgver}
relmon_id=11718

undead_make() {
  python setup.py build
}

undead_install() {
  python setup.py install --root=${pkgdir}
}
