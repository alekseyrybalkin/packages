#!/bin/sh

pkgname=python2-markupsafe
ARCH_NAME=python-markupsafe
pkgver=0.23
vcs=git
git_pkgname=markupsafe
gittag=${pkgver}
urls="http://pypi.python.org/packages/source/M/MarkupSafe/MarkupSafe-${pkgver}.tar.gz"
srctar=MarkupSafe-${pkgver}.tar.gz
srcdir=${location}/MarkupSafe-${pkgver}

kiin_make() {
    python2 setup.py build
}

kiin_install() {
    python2 setup.py install --root=${pkgdir}
}
