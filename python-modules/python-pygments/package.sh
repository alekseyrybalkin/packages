#!/bin/sh

pkgname=python-pygments
pkgver=2.2.0
vcs=mercurial
vcs_pkgname=pygments
hgtag=${pkgver}
relmon_id=3986

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --root=${pkgdir}
}
