#!/bin/sh

pkgname=mplayer
vcs="git"
gittag=06d95575555ef334d153684504103b08815f514d
pkgver=36197
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
