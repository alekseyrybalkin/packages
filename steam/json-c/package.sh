#!/bin/sh

pkgname=json-c
vcs="git"
gittag=3ae296f6946100e533a4358629aa34e74501a039
pkgver=0.10
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  MAKEFLAGS=
  sed -i -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' configure.in
  ./autogen.sh
  ./configure --prefix=/usr --disable-static --libdir=$LIBDIR
  make
}

kiin_install() {
  MAKEFLAGS=
  make DESTDIR=${pkgdir} install
}
