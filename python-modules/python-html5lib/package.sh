#!/bin/sh

pkgname=python-html5lib
pkgver=1.0.1
vcs=git
vcs_pkgname=html5lib-python
gittag=${pkgver}
relmon_id=8053

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --root=${pkgdir}
}
