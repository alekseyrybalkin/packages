#!/bin/sh

pkgname=rubberband
pkgver=1.8.1
vcs=mercurial
hgtag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    sed -i -e 's/.rubberband.wisdom/.config\/.rubberband.wisdom/g' src/dsp/FFT.cpp
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
