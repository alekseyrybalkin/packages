#!/bin/sh

pkgname=python-numpy
pkgver=1.14.2
vcs=git
vcs_pkgname=numpy
gittag=v${pkgver}
relmon_id=2509

undead_make() {
    python setup.py config_fc --fcompiler=gnu95 build
}

undead_install() {
    python setup.py config_fc --fcompiler=gnu95 install \
        --prefix=/usr --root=${pkgdir} --optimize=1
}
