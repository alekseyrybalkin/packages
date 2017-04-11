#!/bin/sh

pkgname=python-appdirs
pkgver=1.4.3
vcs=git
vcs_pkgname=appdirs
gittag=${pkgver}
relmon_id=6278

kiin_make() {
  python setup.py build
}

kiin_install() {
  python setup.py install --root=${pkgdir}
}
