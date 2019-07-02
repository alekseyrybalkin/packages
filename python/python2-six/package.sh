#!/bin/sh

pkgname=python2-six
ARCH_NAME=python-six
pkgver=1.12.0
vcs=git
vcs_pkgname=six
gittag=${pkgver}
relmon_id=4027

kiin_make() {
    python2 setup.py build
}

kiin_install() {
    python2 setup.py install --prefix=/usr --root="${pkgdir}"
}
