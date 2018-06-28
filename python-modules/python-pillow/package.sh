#!/bin/sh

pkgname=python-pillow
pkgver=5.1.0
vcs=git
vcs_pkgname=pillow
gittag=${pkgver}
relmon_id=7974

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --root=${pkgdir}
}
