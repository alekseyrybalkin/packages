#!/bin/sh

pkgname=python-pygments
pkgver=2.4.2
vcs=mercurial
vcs_pkgname=pygments
hgtag=${pkgver}
relmon_id=3986

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
