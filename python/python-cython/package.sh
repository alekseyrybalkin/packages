#!/bin/sh

pkgname=python-cython
ARCH_NAME=cython
pkgver=0.29.10
vcs=git
vcs_pkgname=cython
gittag=${pkgver}
relmon_id=12679

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
