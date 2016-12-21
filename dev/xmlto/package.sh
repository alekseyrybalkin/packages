#!/bin/sh

pkgname=xmlto
pkgver=0.0.28
vcs=git-svn
vcs_pkgname=xmlto-git-svn
vcs_clone="git svn clone -Thttp://svn.fedorahosted.org/svn/xmlto ${vcs_pkgname}"
svnrev=85
urls="https://fedorahosted.org/releases/x/m/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
