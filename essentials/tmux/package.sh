#!/bin/sh

pkgname=tmux
pkgver=2.3
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
