#!/bin/sh

pkgname=strace
vcs="git"
gittag=v4.8
pkgver=4.8
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' configure.ac
  autoreconf -i -f
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
