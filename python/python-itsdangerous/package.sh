#!/bin/sh

pkgname=python-itsdangerous
pkgver=1.1.0
vcs=git
vcs_pkgname=itsdangerous
gittag=${pkgver}
relmon_id=3892

build() {
    python setup.py build
}

package() {
    python setup.py install --prefix=/usr --root=${pkgdir}
}
