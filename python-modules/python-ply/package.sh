#!/bin/sh

pkgname=python-ply
pkgver=3.8
vcs=git
git_pkgname=ply
gittag=d776a2ece6c12bf8f8b6a0e65b48546ac6078765
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  python setup.py build
}

kiin_install() {
  python setup.py install --root=${pkgdir}
}
