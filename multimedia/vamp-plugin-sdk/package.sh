#!/bin/sh

#vcs=none
pkgname=vamp-plugin-sdk
pkgver=2.6
_dir=1520
urls="http://code.soundsoftware.ac.uk/attachments/download/${_dir}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz

kiin_make() {
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
