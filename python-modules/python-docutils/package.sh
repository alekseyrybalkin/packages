#!/bin/sh

pkgname=python-docutils
ARCH_NAME=docutils
pkgver=0.12
vcs=git-svn
git_pkgname=docutils-git-svn
svnrev=7760
urls="http://downloads.sourceforge.net/docutils/docutils-${pkgver}.tar.gz"
srctar=docutils-${pkgver}.tar.gz
srcdir=${location}/docutils-${pkgver}

kiin_make() {
    cd docutils
    python setup.py build
}

kiin_install() {
    cd docutils
    python setup.py install --root=${pkgdir}
    find ${pkgdir}/usr/lib/python3*/site-packages -type f | xargs chmod 644
}
