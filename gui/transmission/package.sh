#!/bin/sh

pkgname=transmission
vcs="git"
gittag=cee8d079ba97b139ea3280b48c15515cbb7e9c18
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
