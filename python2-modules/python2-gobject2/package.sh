#!/bin/sh

#vcs=git
#git_repo=git://git.gnome.org/pygobject
#git_problem="requires gnome-common"
pkgname=python2-gobject2
ARCH_NAME=pygobject2
pkgver=2.28.6
urls="http://ftp.gnome.org/pub/gnome/sources/pygobject/${pkgver%.*}/pygobject-${pkgver}.tar.xz"
srctar=pygobject-${pkgver}.tar.xz
srcdir=${location}/pygobject-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-introspection
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
