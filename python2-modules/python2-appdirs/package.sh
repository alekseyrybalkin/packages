#!/bin/sh

pkgname=python2-appdirs
ARCH_NAME=python-appdirs
pkgver=1.4.3
vcs=git
vcs_pkgname=appdirs
gittag=${pkgver}
relmon_id=6278

kiin_make() {
  python2 setup.py build
}

kiin_install() {
  python2 setup.py install --root=${pkgdir}
}
