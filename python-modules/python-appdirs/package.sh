#!/bin/sh

pkgname=python-appdirs
pkgver=1.4.2
vcs=git
vcs_pkgname=appdirs
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  python setup.py build
}

kiin_install() {
  python setup.py install --root=${pkgdir}
}
