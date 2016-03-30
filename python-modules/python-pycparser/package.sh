#!/bin/sh

pkgname=python-pycparser
pkgver=2.14
vcs=git
git_pkgname=pycparser
gittag=release_v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  python setup.py build
  cd pycparser
  python _build_tables.py
  mkdir ../build/scripts-3.5
}

kiin_install() {
  python setup.py install --root=${pkgdir}
}
