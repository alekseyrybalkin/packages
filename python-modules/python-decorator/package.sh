#!/bin/sh

pkgname=python-decorator
pkgver=4.2.1
vcs=git
vcs_pkgname=decorator
gittag=${pkgver}

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
