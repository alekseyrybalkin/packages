#!/bin/sh

pkgname=python-sphinxcontrib-websupport
pkgver=1.0.1
vcs=git
vcs_pkgname=sphinxcontrib-websupport
gittag=${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
