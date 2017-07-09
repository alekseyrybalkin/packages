#!/bin/sh

pkgname=python-gr
pkgver=0.25.0
vcs=git
vcs_pkgname=gr
gittag=v${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
