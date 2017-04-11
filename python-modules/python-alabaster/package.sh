#!/bin/sh

pkgname=python-alabaster
ARCH_NAME=python-sphinx-alabaster-theme
pkgver=0.7.10
vcs=git
vcs_pkgname=alabaster
# FIXME
#gittag=${pkgver}
gittag=6e3951f9fffc2f6ec50ab39ae7ce5e739aaa0eac

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
