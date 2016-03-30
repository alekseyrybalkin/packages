#!/bin/sh

pkgname=python-mako
pkgver=1.0.4
vcs=git
git_pkgname=mako
gittag=rel_${pkgver//\./_}
urls="https://pypi.python.org/packages/source/M/Mako/Mako-${pkgver}.tar.gz"
srctar=Mako-${pkgver}.tar.gz
srcdir=${location}/Mako-${pkgver}

kiin_make() {
  python setup.py build
}

kiin_install() {
  python setup.py install --root=${pkgdir}
}
