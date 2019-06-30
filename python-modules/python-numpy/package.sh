#!/bin/sh

pkgname=python-numpy
pkgver=1.16.4
vcs=git
vcs_pkgname=numpy
gittag=v${pkgver}
relmon_id=2509

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
