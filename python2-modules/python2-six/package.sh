#!/bin/sh

pkgname=python2-six
ARCH_NAME=python-six
pkgver=1.11.0
vcs=git
vcs_pkgname=six
gittag=${pkgver}
relmon_id=4027

undead_make() {
  python2 setup.py build
}

undead_install() {
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
}
