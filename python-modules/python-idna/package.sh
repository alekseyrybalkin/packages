#!/bin/sh

pkgname=python-idna
pkgver=2.6
vcs=git
vcs_pkgname=idna
gittag=v${pkgver}
relmon_id=5487

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --root=${pkgdir}
}
