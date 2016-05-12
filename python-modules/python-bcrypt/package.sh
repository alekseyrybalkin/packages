#!/bin/sh

pkgname=python-bcrypt
pkgver=2.0.0
vcs=git
git_pkgname=bcrypt
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --prefix=/usr --root=${pkgdir}
}
