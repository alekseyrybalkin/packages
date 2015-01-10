#!/bin/sh

pkgname=ffmpeg
pkgver=2.5.3
urls="http://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i 's/-lflite"/-lflite -lasound"/' configure
  ./configure --prefix=/usr \
    --enable-gpl \
    --enable-version3 \
    --enable-nonfree \
    --disable-static \
    --enable-shared \
    --disable-debug \
    --enable-libmp3lame \
    --enable-libtheora \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-x11grab
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
