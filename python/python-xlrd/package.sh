#!/bin/sh

pkgname=python-xlrd
pkgver=1.2.0
vcs=git
vcs_pkgname=xlrd
gittag=${pkgver}

build() {
    python setup.py build
}

package() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
