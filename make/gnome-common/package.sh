#!/bin/sh

pkgname=gnome-common
pkgver=3.18.0
vcs=git
gittag=${pkgver}
relmon_id=8421

kiin_make() {
    ./autogen.sh --prefix=/usr --with-autoconf-archive
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
