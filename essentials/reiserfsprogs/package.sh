#!/bin/sh

pkgname=reiserfsprogs
vcs="git"
gittag=fe11487be99b5df3607c039f3ba279536eecc569
pkgver=3.6.24
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  autoreconf -i -f
  CFLAGS="${CFLAGS} -std=gnu89"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
