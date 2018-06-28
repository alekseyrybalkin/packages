#!/bin/sh

pkgname=python-chardet
pkgver=3.0.4
vcs=git
vcs_pkgname=chardet
gittag=${pkgver}
relmon_id=9523

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --root=${pkgdir}
}
