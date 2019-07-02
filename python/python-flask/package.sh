#!/bin/sh

pkgname=python-flask
pkgver=1.0.3
vcs=git
vcs_pkgname=flask
gittag=${pkgver}
relmon_id=3867

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --prefix=/usr --root=${pkgdir}
}
