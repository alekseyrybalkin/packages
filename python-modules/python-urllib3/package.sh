#!/bin/sh

pkgname=python-urllib3
pkgver=1.22
vcs=git
vcs_pkgname=urllib3
gittag=${pkgver}
relmon_id=4078

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --root=${pkgdir}
}
