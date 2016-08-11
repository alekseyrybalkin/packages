#!/bin/sh

pkgname=python-chardet
pkgver=2.3.0
vcs=git
vcs_pkgname=chardet
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
