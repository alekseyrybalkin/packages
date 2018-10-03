#!/bin/sh

pkgname=python-sphinx
pkgver=1.7.2
vcs=git
vcs_pkgname=sphinx
gittag=v${pkgver}
relmon_id=4031

kiin_make() {
    make build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
