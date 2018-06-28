#!/bin/sh

pkgname=python-patsy
pkgver=0.5.0
vcs=git
vcs_pkgname=patsy
gittag=v${pkgver}
relmon_id=3958

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
