#!/bin/sh

pkgname=python-gevent
pkgver=1.2.0
vcs=git
vcs_pkgname=gevent
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    sed -i 's/C.UTF-8/en_US.UTF-8/' Makefile
    EMBED=1 \
    CYTHON=cython \
    PYTHON=python \
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
