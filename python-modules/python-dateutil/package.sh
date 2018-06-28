#!/bin/sh

pkgname=python-dateutil
pkgver=2.6.1
vcs=git
vcs_pkgname=dateutil
gittag=${pkgver}
relmon_id=5621

undead_make() {
    :
}

undead_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
