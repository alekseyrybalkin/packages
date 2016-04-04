#!/bin/sh

pkgname=sflock
pkgver=20150721
vcs=git
gittag=1bda0e6d494a764ce2ca6d597f44a2e2f96a83f1
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    # do not daemonize
    sed -i -e '140,145d' sflock.c
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

kiin_install() {
    make PREFIX=/usr DESTDIR=${pkgdir} install
}
