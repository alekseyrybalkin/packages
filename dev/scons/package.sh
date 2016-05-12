#!/bin/sh

pkgname=scons
pkgver=2.5.0
vcs=mercurial
#hgtag=${pkgver}
hgtag=afc0499a6d9b
urls="http://downloads.sourceforge.net/scons/scons-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    :
}

kiin_install() {
    python2 bootstrap.py
    tar xvf build/dist/scons-${pkgver}.tar.gz
    cd scons-${pkgver}
    python2 setup.py install --standard-lib \
        --prefix=/usr \
        --install-data=/usr/share \
        --optimize=1 \
        --root=${pkgdir}

    # fix for python 2.7
    sed -i 's:^#!.*bin/env python:#!/usr/bin/env python2:' ${pkgdir}/usr/bin/*
}
