#!/bin/sh

pkgname=python-chardet
pkgver=3.0.3
vcs=git
vcs_pkgname=chardet
gittag=${pkgver}
relmon_id=9523

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
