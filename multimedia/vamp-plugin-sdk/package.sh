#!/bin/sh

#vcs=none
pkgname=vamp-plugin-sdk
pkgver=2.7.1
_dir=2206
urls="http://code.soundsoftware.ac.uk/attachments/download/${_dir}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
relmon_id=5066

undead_make() {
    ./configure --prefix=/usr
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
