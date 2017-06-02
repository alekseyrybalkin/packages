#!/bin/sh

pkgname=python-html5lib
pkgver=0.999999999
vcs=git
vcs_pkgname=html5lib-python
gittag=${pkgver}
relmon_id=8053

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
