#!/bin/sh

pkgname=mpv
vcs=git
pkgver=0.27.0
gittag=v${pkgver}
relmon_id=5348
relmon_sed='s/v//g'

kiin_make() {
    git clone -n -s ${SOURCES_HOME}/waf waf-clone
    cd waf-clone
    git checkout waf-1.9.14
    cd ..
    cp -r waf-clone/{waf-light,waflib} ./
    rm -rf waf-clone
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
