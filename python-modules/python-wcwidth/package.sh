#!/bin/sh

pkgname=python-wcwidth
pkgver=0.1.7
vcs=git
vcs_pkgname=wcwidth
gittag=${pkgver}

undead_make() {
    :
}

undead_install() {
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
