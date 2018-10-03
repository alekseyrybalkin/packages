#!/bin/sh

pkgname=python-seaborn
pkgver=0.8.1
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
