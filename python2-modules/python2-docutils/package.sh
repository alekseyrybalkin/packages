#!/bin/sh

pkgname=python2-docutils
ARCH_NAME=docutils
pkgver=0.14
vcs=git-svn
vcs_pkgname=docutils-git-svn
vcs_clone="git svn clone -Ttrunk -ttags http://svn.code.sf.net/p/docutils/code ${vcs_pkgname}"
gittag=origin/tags/docutils-${pkgver}
urls="http://downloads.sourceforge.net/docutils/docutils-${pkgver}.tar.gz"
srctar=docutils-${pkgver}.tar.gz
relmon_id=3849

undead_make() {
    python2 setup.py build
    find . -type f -exec \
        sed -i '1s,^#! \?/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' {} \;
}

undead_install() {
    python2 setup.py install --root=${pkgdir}
    find ${pkgdir}/usr/lib/python2.7/site-packages -type f | xargs chmod 644
    for _f in ${pkgdir}/usr/bin/*.py; do
        mv -v "$_f" "${_f%.py}2.py"
    done
}
