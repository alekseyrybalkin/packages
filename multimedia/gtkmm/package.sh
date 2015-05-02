#!/bin/sh

pkgname=gtkmm
_majorver=2.24
pkgver=${_majorver}.4
vcs=git
git_repo=git://git.gnome.org/gtkmm
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
