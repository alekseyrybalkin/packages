#!/bin/sh

pkgname=mplayer
vcs="git"
gittag=93b8932e3c2f76e8686f650d5e4b2cf50bb07661
pkgver=36287
srcdir=${location}/MPlayer-${pkgver}

kiin_make() {
  git clone $SOURCES_HOME/ffmpeg ffmpeg
  ./configure --prefix=/usr \
    --confdir=/etc/mplayer \
    --enable-dynamic-plugins \
    --disable-libvpx-lavc \
    --disable-gui \
    --disable-dvdread \
    --disable-dvdread-internal \
    --disable-xss \
    --disable-liblzo
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
