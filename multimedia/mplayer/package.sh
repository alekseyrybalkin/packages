#!/bin/sh

pkgname=mplayer
vcs="git"
gittag=c885377694708bac7d65f07b6a8550ace30836ff
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
