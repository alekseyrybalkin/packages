#!/bin/sh

pkgname=python2-docutils
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
    python2 setup.py build
    find . -type f -exec \
        sed -i '1s,^#! \?/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' {} \;
}

kiin_install() {
    cd docutils
    python2 setup.py install --root=${pkgdir}
    find ${pkgdir}/usr/lib/python2.7/site-packages -type f | xargs chmod 644
    for _f in ${pkgdir}/usr/bin/*.py; do
        mv -v "$_f" "${_f%.py}2.py"
    done
}
