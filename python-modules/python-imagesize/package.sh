#!/bin/sh

pkgname=python-imagesize
pkgver=0.7.1
vcs=git
vcs_pkgname=imagesize_py
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
