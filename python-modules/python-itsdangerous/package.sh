#!/bin/sh

pkgname=python-itsdangerous
pkgver=1.1.0
vcs=git
vcs_pkgname=itsdangerous
gittag=${pkgver}
relmon_id=3892

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --prefix=/usr --root=${pkgdir}
}
