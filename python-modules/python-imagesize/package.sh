#!/bin/sh

pkgname=python-imagesize
pkgver=0.7.1
vcs=git
vcs_pkgname=imagesize_py
gittag=${pkgver}
relmon_id=10626

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
