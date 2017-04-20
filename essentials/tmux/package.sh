#!/bin/sh

pkgname=tmux
pkgver=2.4
vcs=git
gittag=${pkgver}

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
