#!/bin/sh

pkgname=python-patsy
pkgver=0.5.1
vcs=git
vcs_pkgname=patsy
gittag=v${pkgver}
relmon_id=3958

build() {
    python setup.py build
}

package() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
