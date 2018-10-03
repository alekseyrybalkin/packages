#!/bin/sh

pkgname=python-z
SKIP_ARCH_CHECK=1
vcs=git
pkgver=1

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
