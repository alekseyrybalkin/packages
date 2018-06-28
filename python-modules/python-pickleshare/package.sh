#!/bin/sh

pkgname=python-pickleshare
pkgver=0.7.4
vcs=git
vcs_pkgname=pickleshare
gittag=${pkgver}
relmon_id=12037

undead_make() {
    :
}

undead_install() {
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=0
}
