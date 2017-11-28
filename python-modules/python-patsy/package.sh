#!/bin/sh

pkgname=python-patsy
pkgver=0.4.1
vcs=git
vcs_pkgname=patsy
gittag=v${pkgver}
relmon_id=3958

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
