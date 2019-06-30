#!/bin/sh

pkgname=sdl2
pkgver=2.0.9
vcs=mercurial
hgtag=release-${pkgver}
relmon_id=4779

kiin_make() {
    ./autogen.sh
    mkdir sdl-build
    cd sdl-build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSDL_STATIC=OFF \
        -DSDL_DLOPEN=ON \
        -DARTS=OFF \
        -DESD=OFF \
        -DNAS=OFF \
        -DALSA=ON \
        -DPULSEAUDIO_SHARED=ON \
        -DVIDEO_WAYLAND=ON \
        -DRPATH=OFF \
        -DCLOCK_GETTIME=ON \
        -DJACK_SHARED=ON
    make
}

kiin_install() {
    cd sdl-build
    make DESTDIR=${pkgdir} install
    sed -i "s/libSDL2\.a/libSDL2main.a/g" ${pkgdir}/usr/lib/cmake/SDL2/SDL2Targets-noconfig.cmake
}
