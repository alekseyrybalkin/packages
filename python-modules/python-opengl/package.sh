#!/bin/sh

pkgname=python-opengl
pkgver=3.1.0
vcs=bzr
bzrtag=release-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  python setup.py build
}

kiin_install() {
  python setup.py install --root=${pkgdir}
}
