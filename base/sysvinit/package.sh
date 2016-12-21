#!/bin/sh

pkgname=sysvinit
SKIP_ARCH_CHECK=1
pkgver=2.89
vcs=git-svn
vcs_pkgname=sysvinit-git-svn
vcs_clone="git svn clone -Ttrunk -ttags svn://svn.savannah.nongnu.org/sysvinit/sysvinit ${vcs_pkgname}"
svnrev=174
urls="http://download.savannah.gnu.org/releases/sysvinit/sysvinit-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    make -C src
}

kiin_install() {
    make ROOT=${pkgdir} -C src install
    rm -rf ${pkgdir}/bin ${pkgdir}/usr/bin
    mv ${pkgdir}/sbin ${pkgdir}/usr/bin
    rm ${pkgdir}/usr/bin/sulogin
    rm -rf ${pkgdir}/usr/share/man/man{1,5}
    rm -rf ${pkgdir}/usr/share/man/man8/{pidof.8,sulogin.8}
}
