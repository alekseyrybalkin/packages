#!/bin/sh

pkgname=python-gevent
pkgver=1.1.2
vcs=git
vcs_pkgname=gevent
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    sed -i 's/C.UTF-8/en_US.UTF-8/' Makefile
    sed -i -e 's/0\.23\.5/0\.25\.2/' dev-requirements.txt
    sed -i -e 's/0\.23\.5/0\.25\.2/' setup.py
    EMBED=1 \
    CYTHON=cython \
    PYTHON=python \
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
