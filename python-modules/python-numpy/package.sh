#!/bin/sh

pkgname=python-numpy
pkgver=1.13.3
vcs=git
vcs_pkgname=numpy
gittag=v${pkgver}
relmon_id=2509

kiin_make() {
    python setup.py config_fc --fcompiler=gnu95 build
}

kiin_install() {
    python setup.py config_fc --fcompiler=gnu95 install \
        --prefix=/usr --root=${pkgdir} --optimize=1
}
