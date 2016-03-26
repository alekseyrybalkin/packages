#!/bin/sh

pkgname=mm-common
pkgver=0.9.10
vcs=git
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  cp /usr/share/gcc-*/libstdc++.tag doctags/
  ./autogen.sh --prefix=/usr --disable-network
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
