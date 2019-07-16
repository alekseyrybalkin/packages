#!/bin/sh

pkgname=python-sphinx-pallets-themes
SKIP_ARCH_CHECK=1
pkgver=1.1.3
vcs=git
vcs_pkgname=pallets-sphinx-themes
gittag=${pkgver}

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --prefix=/usr --root=${pkgdir}
}
