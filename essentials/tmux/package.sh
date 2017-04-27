#!/bin/sh

pkgname=tmux
pkgver=2.4
vcs=git
gittag=${pkgver}

kiin_make() {
    git revert --no-edit 1015b124d5ccb4c9d32f0c5aae820f7a1ac98c5c
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
