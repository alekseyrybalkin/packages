#!/bin/sh

pkgname=python-mss
SKIP_ARCH_CHECK=1
pkgver=4.0.3
vcs=git
gittag=v${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
}
