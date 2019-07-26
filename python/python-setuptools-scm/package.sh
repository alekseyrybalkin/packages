#!/bin/sh

pkgname=python-setuptools-scm
pkgver=3.3.3
vcs=git
vcs_pkgname=setuptools_scm
gittag=v${pkgver}
relmon_id=7874

build() {
    python setup.py build
    python setup.py egg_info
}

package() {
    python setup.py install --root=${pkgdir}
}
