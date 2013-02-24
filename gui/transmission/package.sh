#!/bin/sh

pkgname=transmission
vcs="git"
gittag=1aed1fb57f8647f80dd09a5b5c656d6e28ecbbdb
pkgver=2.77.20130219
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr --without-gtk
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
