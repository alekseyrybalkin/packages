#!/bin/sh

pkgname=python-sphinx_rtd_theme
pkgver=0.2.4
vcs=git
vcs_pkgname=sphinx_rtd_theme
gittag=${pkgver}
relmon_id=6915

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --root=${pkgdir}
}
