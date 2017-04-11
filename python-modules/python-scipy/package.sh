#!/bin/sh

pkgname=python-scipy
pkgver=0.19.0
vcs=git
vcs_pkgname=scipy
gittag=v${pkgver}
relmon_id=4768
relmon_sed='s/v//g'

kiin_make() {
    python setup.py config_fc --fcompiler=gnu95 build
}

kiin_install() {
    python setup.py config_fc --fcompiler=gnu95 install \
        --prefix=/usr --root=${pkgdir} --optimize=1
}
