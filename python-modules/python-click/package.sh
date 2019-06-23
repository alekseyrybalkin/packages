#!/bin/sh

pkgname=python-click
pkgver=7.0
vcs=git
vcs_pkgname=click
gittag=${pkgver}
relmon_id=3802

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --prefix=/usr --root=${pkgdir}
}
