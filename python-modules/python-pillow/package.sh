#!/bin/sh

pkgname=python-pillow
pkgver=3.4.1
vcs=git
vcs_pkgname=pillow
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
