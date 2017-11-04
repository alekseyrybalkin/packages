#!/bin/sh

pkgname=python-pillow
pkgver=4.3.0
vcs=git
vcs_pkgname=pillow
gittag=${pkgver}
relmon_id=7974

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
