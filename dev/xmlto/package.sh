#!/bin/sh

pkgname=xmlto
pkgver=0.0.28
vcs=git-svn
git_pkgname=xmlto-git-svn
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
