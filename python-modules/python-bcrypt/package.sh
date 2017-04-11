#!/bin/sh

pkgname=python-bcrypt
pkgver=3.1.3
vcs=git
vcs_pkgname=bcrypt
gittag=${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --prefix=/usr --root=${pkgdir}
}
