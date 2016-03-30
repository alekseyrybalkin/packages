#!/bin/sh

pkgname=python-packaging
pkgver=16.6
vcs=git
git_pkgname=packaging
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  python setup.py build
}

kiin_install() {
  python setup.py install --root=${pkgdir}
}
