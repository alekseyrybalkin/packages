#!/bin/sh

pkgname=mpv
vcs=git
pkgver=0.26.0
gittag=v${pkgver}
relmon_id=5348
relmon_sed='s/v//g'

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
