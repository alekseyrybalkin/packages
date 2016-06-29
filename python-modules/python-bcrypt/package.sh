#!/bin/sh

pkgname=python-bcrypt
pkgver=3.0.0
vcs=git
vcs_pkgname=bcrypt
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --prefix=/usr --root=${pkgdir}
}
