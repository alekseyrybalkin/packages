#!/bin/sh

pkgname=python-falcon
SKIP_ARCH_CHECK=1
pkgver=0.3.0
vcs=git
vcs_pkgname=falcon
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
