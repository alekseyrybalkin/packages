#!/bin/sh

pkgname=xorg-fonts-misc
pkgver=1.0.3
vcs=git
vcs_pkgname=font-misc-misc

kiin_make() {
    cd ${location}
    mkdir build
    cd build
    for i in ${KIIN_HOME}/sources/font-{arabic,cursor,daewoo,dec,isas,jis,micro,mutt,sony,sun,misc,schumacher}-misc; do
        git clone -s ${i}
    done
    for dir in *; do
        if [ -d "${dir}" ]; then
            pushd "${dir}"
            NOCONFIGURE=1 ./autogen.sh
            ./configure $XORG_CONFIG
            make
            popd
        fi
    done
    cd ..
}

kiin_install() {
    cd ${location}/build
    for dir in *; do
        if [ -d "${dir}" ]; then
            pushd "${dir}"
            make DESTDIR=${pkgdir} install
            popd
        fi
    done
    cd ..
    rm -rf build font-misc-misc
}
