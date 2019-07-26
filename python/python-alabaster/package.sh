#!/bin/sh

pkgname=python-alabaster
ARCH_NAME=python-sphinx-alabaster-theme
pkgver=0.7.12
vcs=git
vcs_pkgname=alabaster
gittag=${pkgver}
relmon_id=7274

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir} --optimize=1
}
