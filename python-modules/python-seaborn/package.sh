#!/bin/sh

pkgname=python-seaborn
pkgver=0.9.0
vcs=git
vcs_pkgname=seaborn
gittag=v${pkgver}
relmon_id=7691

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
