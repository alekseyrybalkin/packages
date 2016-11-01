#!/bin/sh

pkgname=python-setuptools-scm
pkgver=1.15.0
vcs=git
vcs_pkgname=setuptools_scm
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
    python setup.py egg_info
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
