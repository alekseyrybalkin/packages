#!/bin/sh

pkgname=gnome-common
pkgver=3.14.0
vcs=git
git_repo=git://git.gnome.org/gnome-common
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
