#!/bin/sh

pkgname=yelp-xsl
pkgver=3.16.1
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
