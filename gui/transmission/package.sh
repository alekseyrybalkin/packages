#!/bin/sh

pkgname=transmission
vcs="git"
gittag=e882df87ffd3f3b7ab7211cb85c742da1b14a776
pkgver=2.77+
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr --without-gtk
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
