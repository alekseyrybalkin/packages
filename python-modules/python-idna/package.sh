#!/bin/sh

pkgname=python-idna
pkgver=2.5
vcs=git
vcs_pkgname=idna
gittag=v${pkgver}
relmon_id=5487

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
