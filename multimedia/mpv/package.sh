#!/bin/sh

pkgname=mpv
vcs=git
pkgver=0.25.0
gittag=v${pkgver}

kiin_make() {
    cp -r ${SOURCES_HOME}/waf/{waf-light,waflib} ./
    mv ./waf{-light,}
    ./waf configure --prefix=/usr \
        --confdir=/etc/mpv \
        --disable-pulse \
        --enable-libmpv-shared
    ./waf build
}

kiin_install() {
    ./waf install --destdir=${pkgdir}
}
