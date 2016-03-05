#!/bin/sh

pkgname=pixman
pkgver=0.34.0
vcs=git
gittag=pixman-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr --disable-static --disable-gtk --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
