#!/bin/sh

pkgname=glib
pkgver=2.36.1
urls="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.36/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  # https://bugs.archlinux.org/task/34630
  export CFLAGS+=" -Wall"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --with-pcre=system \
              --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
