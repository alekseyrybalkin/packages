#!/bin/sh

pkgname=python-mimeparse
pkgver=1.6.0
vcs=git
gittag=${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
