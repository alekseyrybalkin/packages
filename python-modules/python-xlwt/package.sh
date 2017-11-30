#!/bin/sh

pkgname=python-xlwt
pkgver=1.3.0
vcs=git
vcs_pkgname=xlwt
gittag=${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
