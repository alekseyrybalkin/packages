#!/bin/sh

pkgname=python-babel
pkgver=2.3.4
vcs=git
git_pkgname=babel
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py import_cldr
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
