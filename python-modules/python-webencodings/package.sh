#!/bin/sh

pkgname=python-webencodings
pkgver=0.5.1
vcs=git
gittag=v${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
