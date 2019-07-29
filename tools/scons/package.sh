pkgname=scons
pkgver=3.1.0
vcs=git
gittag=${pkgver}
relmon_id=4770

build() {
    :
}

package() {
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