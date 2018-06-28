#!/bin/sh

pkgname=python-pexpect
pkgver=4.4
vcs=git
vcs_pkgname=pexpect
gittag=${pkgver}
relmon_id=13058

undead_make() {
    :
}

undead_install() {
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=0
}
