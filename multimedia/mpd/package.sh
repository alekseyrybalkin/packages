#!/bin/sh

pkgname=mpd
majorver=0.19
pkgver=${majorver}.5
urls="http://www.musicpd.org/download/mpd/${majorver}/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
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
    --enable-audiofile
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
