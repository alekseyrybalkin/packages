#!/bin/sh

pkgname=gnome-common
pkgver=3.18.0
vcs=git
gittag=${pkgver}
relmon_id=8421

build() {
    ./autogen.sh --prefix=/usr --with-autoconf-archive
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
