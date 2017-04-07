#!/bin/sh

pkgname=python-sphinx_rtd_theme
pkgver=0.2.4
vcs=git
vcs_pkgname=sphinx_rtd_theme
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}
relmon_id=6915

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
