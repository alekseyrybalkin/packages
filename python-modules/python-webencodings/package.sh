#!/bin/sh

pkgname=python-webencodings
pkgver=0.5.1
vcs=git
gittag=v${pkgver}

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --root=${pkgdir}
}
