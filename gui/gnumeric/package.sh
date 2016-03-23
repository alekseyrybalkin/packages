#!/bin/sh

pkgname=gnumeric
pkgver=1.12.28
vcs=git
git_repo=git://git.gnome.org/gnumeric
gittag=GNUMERIC_${pkgver//\./_}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  cp ../*.make .
  ./autogen.sh --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
