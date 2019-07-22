#!/bin/sh

pkgname=python-markupsafe
pkgver=1.1.1
vcs=git
vcs_pkgname=markupsafe
gittag=${pkgver}
relmon_id=3918

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
