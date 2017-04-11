#!/bin/sh

pkgname=python2-packaging
ARCH_NAME=python-packaging
pkgver=16.8
vcs=git
vcs_pkgname=packaging
gittag=${pkgver}

kiin_make() {
  python2 setup.py build
}

kiin_install() {
  python2 setup.py install --root=${pkgdir}
}
