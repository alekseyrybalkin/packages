#!/bin/sh

pkgname=python-numexpr
pkgver=2.6.4
vcs=git
vcs_pkgname=numexpr
gittag=v${pkgver}
relmon_id=3943
relmon_sed='s/v//g'

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
