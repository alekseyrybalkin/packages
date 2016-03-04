#!/bin/sh

pkgname=python2-virtualenv
ARCH_NAME=python-virtualenv
pkgver=14.0.6
vcs=git
git_pkgname=virtualenv
gittag=${pkgver}
srcdir=${location}/virtualenv-${pkgver}

kiin_make() {
  python2 setup.py build
}

kiin_install() {
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
}
