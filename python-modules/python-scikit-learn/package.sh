#!/bin/sh

pkgname=python-scikit-learn
pkgver=0.19.1
vcs=git
vcs_pkgname=scikit-learn
gittag=${pkgver}
relmon_id=7686

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
