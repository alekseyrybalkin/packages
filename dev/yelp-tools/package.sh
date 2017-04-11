#!/bin/sh

pkgname=yelp-tools
pkgver=3.18.0
ARCH_VERSION=3.18.0+1+g193c2bd
vcs=git
git_repo=git://git.gnome.org/yelp-tools
gittag=${pkgver}

kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
