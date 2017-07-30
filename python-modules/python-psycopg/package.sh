#!/bin/sh

pkgname=python-psycopg
ARCH_NAME=python-psycopg2
pkgver=2.7.3
vcs=git
vcs_pkgname=psycopg2
gittag=${pkgver//\./_}
relmon_id=3979

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
