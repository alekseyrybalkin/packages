#!/bin/sh

pkgname=mpd
majorver=0.19
pkgver=${majorver}.14
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-sidplay \
    --without-systemdsystemunitdir \
    --disable-ffmpeg \
    --disable-mad \
    --disable-modplug \
    --disable-shout \
    --disable-jack \
    --disable-soup \
    --disable-fluidsynth \
    --disable-aac \
    --disable-pulse \
    --enable-mpg123 \
    --enable-flac \
    --disable-audiofile
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
