#!/bin/sh

pkgname=python-six
pkgver=1.11.0
vcs=git
vcs_pkgname=six
gittag=${pkgver}
relmon_id=4027

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --root=${pkgdir}
}
