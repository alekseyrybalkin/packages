#!/bin/sh

pkgname=python-setuptools-scm
pkgver=1.15.6
vcs=git
vcs_pkgname=setuptools_scm
gittag=v${pkgver}
relmon_id=7874

kiin_make() {
    python setup.py build
    python setup.py egg_info
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
