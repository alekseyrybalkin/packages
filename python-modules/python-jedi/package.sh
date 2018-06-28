#!/bin/sh

pkgname=python-jedi
pkgver=0.11.1
vcs=git
vcs_pkgname=jedi
gittag=v${pkgver}
relmon_id=3893

undead_make() {
    :
}

undead_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
