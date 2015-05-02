#!/bin/sh

pkgname=atkmm
_majorver=2.22
pkgver=${_majorver}.7
vcs=git
git_repo=git://git.gnome.org/atkmm
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
