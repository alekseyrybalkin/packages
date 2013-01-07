#!/bin/sh

pkgname=mpd
pkgver=0.17.3
urls="http://downloads.sourceforge.net/musicpd/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
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
    --enable-mpg123 \
    --enable-flac \
    --enable-audiofile
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
