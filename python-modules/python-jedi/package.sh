#!/bin/sh

pkgname=python-jedi
pkgver=0.11.0
vcs=git
vcs_pkgname=jedi
gittag=v${pkgver}
relmon_id=3893

kiin_make() {
    git cherry-pick fc0397732ea87c2d641f2d2fdef0b13096d945b8
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
