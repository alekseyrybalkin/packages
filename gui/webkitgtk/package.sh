#!/bin/sh

pkgname=webkitgtk
ARCH_NAME=webkit2gtk
pkgver=2.18.0
vcs=git
gittag=v${pkgver}
relmon_id=5355

kiin_make() {
    mkdir build
    cd build
    cmake -G Ninja -DPORT=GTK -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=ON -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=/usr/lib -DENABLE_GTKDOC=OFF \
        -DUSE_LIBHYPHEN=OFF -DUSE_LIBNOTIFY=OFF \
        -DENABLE_GEOLOCATION=OFF -DENABLE_MINIBROWSER=ON ..
    ninja
}

kiin_install() {
    cd build
    DESTDIR=${pkgdir} ninja install
}
