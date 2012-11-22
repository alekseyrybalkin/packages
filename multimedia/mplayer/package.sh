#!/bin/sh

pkgname=mplayer
pkgver=1.1
urls="http://www.mplayerhq.hu/MPlayer/releases/MPlayer-${pkgver}.tar.xz"
srctar=MPlayer-${pkgver}.tar.xz
srcdir=${location}/MPlayer-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --confdir=/etc/mplayer \
    --enable-dynamic-plugins \
    --disable-libvpx-lavc \
    --disable-gui
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
