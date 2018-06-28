#!/bin/sh

pkgname=python-jdcal
pkgver=1.3
vcs=git
vcs_pkgname=jdcal
#FIXME
gittag=10e977b911a41c1c436f82d41fab43523f63ad50
#gittag=v${pkgver}
relmon_id=7978
relmon_sed='s/v//g'

undead_make() {
    python setup.py build
}

undead_install() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
