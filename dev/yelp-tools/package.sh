#!/bin/sh

pkgname=yelp-tools
pkgver=3.16.1
vcs=git
git_repo=git://git.gnome.org/yelp-tools
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
