#!/bin/sh

pkgname=mplayer
vcs="git"
gittag=1fcb6cb9132d88ec054d72689152545d7d58cf76
pkgver=35915
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
    --disable-liblzo
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
