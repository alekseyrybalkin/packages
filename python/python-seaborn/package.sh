#!/bin/sh

pkgname=python-seaborn
pkgver=0.9.0
vcs=git
vcs_pkgname=seaborn
gittag=v${pkgver}
relmon_id=7691

build() {
    python setup.py build
}

package() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
