#!/bin/sh

pkgname=libsamplerate
pkgver=0.1.9
vcs=git
gittag=f6730d03c3e7660bb6ecad8816f1b09c5825142a
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
