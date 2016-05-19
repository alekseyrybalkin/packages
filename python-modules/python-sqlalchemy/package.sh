#!/bin/sh

pkgname=python-sqlalchemy
pkgver=1.0.13
vcs=git
vcs_pkgname=sqlalchemy
gittag=rel_${pkgver//\./_}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
