#!/bin/sh

pkgname=scons
pkgver=3.0.1
vcs=git
# FIXME
gittag=1a765337ba4170e5cd9d1dfa61374b89679d78fd
relmon_id=4770

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
