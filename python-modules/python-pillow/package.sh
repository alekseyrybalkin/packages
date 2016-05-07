#!/bin/sh

pkgname=python-pillow
pkgver=3.2.0
vcs=git
git_pkgname=pillow
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  python setup.py build
}

kiin_install() {
  python setup.py install --root=${pkgdir}
}
