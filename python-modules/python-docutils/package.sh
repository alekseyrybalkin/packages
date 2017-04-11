#!/bin/sh

pkgname=python-docutils
ARCH_NAME=docutils
pkgver=0.13.1
vcs=git-svn
vcs_pkgname=docutils-git-svn
vcs_clone="git svn clone -Ttrunk -ttags http://svn.code.sf.net/p/docutils/code ${vcs_pkgname}"
gittag=origin/tags/docutils-${pkgver}
urls="http://downloads.sourceforge.net/docutils/docutils-${pkgver}.tar.gz"
srctar=docutils-${pkgver}.tar.gz
relmon_id=3849

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir}
    find ${pkgdir}/usr/lib/python3*/site-packages -type f | xargs chmod 644
}
