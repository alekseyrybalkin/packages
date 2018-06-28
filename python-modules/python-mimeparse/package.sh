#!/bin/sh

pkgname=python-mimeparse
pkgver=1.6.0
vcs=git
gittag=${pkgver}

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --root=${pkgdir}
}
