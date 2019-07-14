#!/bin/sh

pkgname=python-defusedxml
pkgver=0.6.0
vcs=git
vcs_pkgname=defusedxml
gittag=v${pkgver}
relmon_id=3821

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
