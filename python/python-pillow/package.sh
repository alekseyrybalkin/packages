#!/bin/sh

pkgname=python-pillow
pkgver=6.0.0
vcs=git
vcs_pkgname=pillow
gittag=${pkgver}
relmon_id=7974

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
