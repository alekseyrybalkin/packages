#!/bin/sh

pkgname=python-backcall
pkgver=0.1
vcs=git
vcs_pkgname=backcall
gittag=${pkgver}
relmon_id=19636

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
