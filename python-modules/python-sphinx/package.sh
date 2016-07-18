#!/bin/sh

pkgname=python-sphinx
pkgver=1.4.5
vcs=git
vcs_pkgname=sphinx
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    make PYTHON=python3 build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
