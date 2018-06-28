#!/bin/sh

pkgname=mpv
vcs=git
pkgver=0.27.2
gittag=v${pkgver}
relmon_id=5348
relmon_sed='s/v//g'

undead_make() {
    git clone -n -s ${SOURCES_HOME}/waf waf-clone
    cd waf-clone
    git checkout waf-1.9.15
    cd ..
    cp -r waf-clone/{waf-light,waflib} ./
    rm -rf waf-clone
    mv ./waf{-light,}

    patch -Np1 -i ../vaapi-Use-libva2-message-callbacks.patch

    ./waf configure --prefix=/usr \
        --confdir=/etc/mpv \
        --disable-pulse \
        --enable-libmpv-shared
    ./waf build
}

undead_install() {
    ./waf install --destdir=${pkgdir}
}
