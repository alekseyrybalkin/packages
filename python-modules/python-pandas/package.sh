#!/bin/sh

pkgname=python-pandas
pkgver=0.21.1
vcs=git
vcs_pkgname=pandas
gittag=v${pkgver}
relmon_id=7578

kiin_make() {
    python setup.py build_ext --inplace
    python setup.py build
}

kiin_install() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
