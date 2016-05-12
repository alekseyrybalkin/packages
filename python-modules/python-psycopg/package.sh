#!/bin/sh

pkgname=python-psycopg
ARCH_NAME=python-psycopg2
pkgver=2.6.1
vcs=git
vcs_pkgname=psycopg2
gittag=${pkgver//\./_}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
