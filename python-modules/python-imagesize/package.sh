#!/bin/sh

pkgname=python-imagesize
pkgver=0.7.1
vcs=git
git_pkgname=imagesize_py
gittag=8bb3a11298f1c7c2957e04179f8e5e5df232c69e
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
