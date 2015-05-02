#!/bin/sh

pkgname=glibmm
_majorver=2.44
pkgver=${_majorver}.0
vcs=git
git_repo=git://git.gnome.org/glibmm
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
