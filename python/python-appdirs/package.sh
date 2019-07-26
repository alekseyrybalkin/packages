#!/bin/sh

pkgname=python-appdirs
pkgver=1.4.3
vcs=git
vcs_pkgname=appdirs
gittag=${pkgver}
relmon_id=6278

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
