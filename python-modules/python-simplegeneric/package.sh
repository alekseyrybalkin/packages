#!/bin/sh

pkgname=python-simplegeneric
SKIP_ARCH_CHECK=1
pkgver=0.8.1
relmon_id=4025

kiin_make() {
    :
}

kiin_install() {
    cd ${location}
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
