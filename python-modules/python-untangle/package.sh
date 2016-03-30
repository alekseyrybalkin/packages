#!/bin/sh

pkgname=python-untangle
SKIP_ARCH_CHECK=1
pkgver=1.1.0
vcs=git
git_pkgname=untangle
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  python setup.py build
}

kiin_install() {
  python setup.py install --root=${pkgdir}
}
