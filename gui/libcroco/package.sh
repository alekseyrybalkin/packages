#!/bin/sh

pkgname=libcroco
pkgver=0.6.12
vcs=git
gittag=${pkgver}
urls="http://ftp.gnome.org/pub/gnome/sources/libcroco/0.6/libcroco-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz

kiin_make() {
    ./autogen.sh --prefix=/usr --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
