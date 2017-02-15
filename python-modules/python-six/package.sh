#!/bin/sh

pkgname=python-six
pkgver=1.10.0
vcs=git
vcs_pkgname=six
gittag=c3ec058bf8c4d6329224eac53366c8e9ce511417
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
