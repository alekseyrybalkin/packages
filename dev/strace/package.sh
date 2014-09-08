#!/bin/sh

pkgname=strace
vcs="git"
gittag=v4.9
pkgver=4.9
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./bootstrap
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
