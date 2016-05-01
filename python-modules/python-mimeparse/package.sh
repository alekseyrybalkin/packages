#!/bin/sh

pkgname=python-mimeparse
pkgver=1.5.2
vcs=git
gittag=cc66740c6e46b85ac55e989fd4883d5697e15c35
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  python setup.py build
}

kiin_install() {
  python setup.py install --root=${pkgdir}
}
