#!/bin/sh

pkgname=ois
pkgver=1.3
_oisver=${pkgver/./-}
urls="http://downloads.sourceforge.net/project/wgois/Source%20Release/${pkgver}/ois_v${_oisver}.tar.gz"
srctar=ois_v${_oisver}.tar.gz
srcdir=${location}/ois-v${_oisver}

kiin_make() {
  patch -Np1 < ../gcc47.patch
  chmod +x bootstrap
  ./bootstrap
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
