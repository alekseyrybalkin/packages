#!/bin/sh

pkgname=python-numpy
pkgver=1.11.0
vcs=git
git_pkgname=numpy
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py config_fc --fcompiler=gnu95 build
}

kiin_install() {
    python setup.py config_fc --fcompiler=gnu95 install \
        --prefix=/usr --root=${pkgdir} --optimize=1
}
