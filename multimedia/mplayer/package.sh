#!/bin/sh

pkgname=mplayer
vcs="git"
gittag=4b74661875a29c302508606a26380e872c5de979
pkgver=35504
srcdir=${location}/MPlayer-${pkgver}

kiin_make() {
  git clone /var/src/ffmpeg ffmpeg
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
