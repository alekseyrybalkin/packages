#!/bin/sh

pkgname=transmission
vcs="git"
gittag=624d6631b3d805697bf9e3bc56753269ed593580
pkgver=2.76.20130128
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr --without-gtk
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
