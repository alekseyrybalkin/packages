#!/bin/sh

pkgname=python-pytest-runner
pkgver=2.10.1
vcs=git
vcs_pkgname=pytest-runner
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
