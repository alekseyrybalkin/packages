#!/bin/sh

pkgname=ffmpeg
pkgver=3.3.3
vcs=git
gittag=n${pkgver}
relmon_id=5405

kiin_make() {
    export TMPDIR=${location}/tmp
    mkdir ${TMPDIR}
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
        --enable-libxcb
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
