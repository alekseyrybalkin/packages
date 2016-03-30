#!/bin/sh

pkgname=python-requests
pkgver=2.9.1
vcs=git
git_pkgname=requests
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  python setup.py build
}

kiin_install() {
  python setup.py install --root=${pkgdir}
}