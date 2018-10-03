#!/bin/sh

pkgname=python-alabaster
ARCH_NAME=python-sphinx-alabaster-theme
pkgver=0.7.10
vcs=git
vcs_pkgname=alabaster
gittag=${pkgver}
relmon_id=7274

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
