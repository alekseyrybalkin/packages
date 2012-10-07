#!/bin/sh

pkgname=mpd
pkgver=0.17.2
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
    --disable-audiofile \
    --disable-shout \
    --disable-jack
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
