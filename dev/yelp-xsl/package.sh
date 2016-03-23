#!/bin/sh

pkgname=yelp-xsl
pkgver=3.20.0
vcs=git
git_repo=git://git.gnome.org/yelp-xsl
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
