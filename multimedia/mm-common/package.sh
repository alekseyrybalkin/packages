#!/bin/sh

#vcs=git
#git_repo=git://git.gnome.org/mm-common
#git_problem="libstdc++ tag file from internets"
pkgname=mm-common
pkgver=0.9.7
urls="http://ftp.gnome.org/pub/gnome/sources/mm-common/${pkgver:0:3}/mm-common-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
