#!/bin/sh

pkgname=python-sphinx
pkgver=1.6.5
vcs=git
vcs_pkgname=sphinx
gittag=${pkgver}
relmon_id=4031

kiin_make() {
    make PYTHON=python3 build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
