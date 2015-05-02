#!/bin/sh

pkgname=pangomm
_majorver=2.35
pkgver=${_majorver}.1
vcs=git
git_repo=git://git.gnome.org/pangomm
gittag=4d8795081b60a87540b6226b7ce52278e4abad5f
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
