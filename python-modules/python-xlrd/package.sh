#!/bin/sh

pkgname=python-xlrd
pkgver=1.1.0
vcs=git
vcs_pkgname=xlrd
gittag=${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
