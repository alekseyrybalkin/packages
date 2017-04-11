#!/bin/sh

pkgname=python-pip
pkgver=9.0.1
vcs=git
vcs_pkgname=pip
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}
relmon_id=6529

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
