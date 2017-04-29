#!/bin/sh

pkgname=rubberband
pkgver=1.8.1
vcs=mercurial
hgtag=v${pkgver}
relmon_id=4222

kiin_make() {
    sed -i -e 's/.rubberband.wisdom/.config\/.rubberband.wisdom/g' src/dsp/FFT.cpp
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
