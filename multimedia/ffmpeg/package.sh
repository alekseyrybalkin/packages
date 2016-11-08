#!/bin/sh

pkgname=ffmpeg
pkgver=3.2
vcs=git
gittag=n${pkgver}
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
        --enable-openssl \
        --enable-x11grab
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
