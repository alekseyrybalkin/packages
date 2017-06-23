#!/bin/sh

pkgname=python-gevent
pkgver=1.2.2
vcs=git
vcs_pkgname=gevent
gittag=${pkgver}
relmon_id=6835

kiin_make() {
    # apparently, gevent cannot autodetect PATH_SEPARATOR when there is only one
    # item in $PATH (see zz40-xc-ovr.m4)
    PATH=${PATH}:/bin
    sed -i 's/C.UTF-8/en_US.UTF-8/' Makefile
    EMBED=1 \
    CYTHON=cython \
    PYTHON=python \
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
