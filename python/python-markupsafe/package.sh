#!/bin/sh

pkgname=python-markupsafe
pkgver=1.1.1
vcs=git
vcs_pkgname=markupsafe
gittag=${pkgver}
relmon_id=3918

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
