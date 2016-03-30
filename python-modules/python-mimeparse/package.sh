#!/bin/sh

pkgname=python-mimeparse
pkgver=1.5.1
vcs=git
gittag=5cc99617c1a4d4cb859a66f9e5fd140f2fcf4f9b
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  python setup.py build
}

kiin_install() {
  python setup.py install --root=${pkgdir}
}
