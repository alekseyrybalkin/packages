#!/bin/sh

pkgname=python-defusedxml
pkgver=0.6.0
vcs=git
vcs_pkgname=defusedxml
gittag=v${pkgver}
relmon_id=3821

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
