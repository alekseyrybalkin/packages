#!/bin/sh

pkgname=mpd
pkgver=0.18
urls="http://www.musicpd.org/download/mpd/${pkgver}/${pkgname}-${pkgver}.tar.xz"
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
    --enable-mpg123 \
    --enable-flac \
    --enable-audiofile
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
