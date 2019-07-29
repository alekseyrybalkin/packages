pkgname=ffmpeg
pkgver=4.1.4
vcs=git
gittag=n${pkgver}
relmon_id=5405

build() {
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

package() {
    make DESTDIR=${pkgdir} install
}