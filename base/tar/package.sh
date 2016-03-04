#!/bin/sh

#vcs=git
#git_repo=git://git.savannah.gnu.org/tar.git
#git_problem="fails to build."
pkgname=tar
pkgver=1.28
urls="http://ftp.gnu.org/gnu/tar/tar-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --libexecdir=/usr/bin
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} -C doc install-html docdir=/usr/share/doc/tar
}
