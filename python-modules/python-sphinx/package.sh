#!/bin/sh

pkgname=python-sphinx
pkgver=1.7.2
vcs=git
vcs_pkgname=sphinx
gittag=v${pkgver}
relmon_id=4031

undead_make() {
    make build
}

undead_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
