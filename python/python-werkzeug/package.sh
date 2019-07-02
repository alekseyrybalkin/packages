#!/bin/sh

pkgname=python-werkzeug
pkgver=0.15.4
vcs=git
vcs_pkgname=werkzeug
gittag=${pkgver}
relmon_id=4092

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --prefix=/usr --root=${pkgdir}
}
