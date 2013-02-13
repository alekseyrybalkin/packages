#!/bin/sh

pkgname=transmission
vcs="git"
gittag=152fbd78f4717791bf3f6695fad861cde6c23ad9
pkgver=2.76.20130211
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr --without-gtk
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
