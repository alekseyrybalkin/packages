#!/bin/sh

pkgname=python-scipy
pkgver=0.17.0
vcs=git
vcs_pkgname=scipy
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py config_fc --fcompiler=gnu95 build
}

kiin_install() {
    python setup.py config_fc --fcompiler=gnu95 install \
        --prefix=/usr --root=${pkgdir} --optimize=1
}
