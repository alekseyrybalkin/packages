#!/bin/sh

pkgname=yelp-tools
pkgver=3.28.0
vcs=git
git_repo=git://git.gnome.org/yelp-tools
gittag=${pkgver}
relmon_id=8420

kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
