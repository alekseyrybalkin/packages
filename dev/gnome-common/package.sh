#!/bin/sh

pkgname=gnome-common
pkgver=3.18.0
vcs=git
git_repo=git://git.gnome.org/gnome-common
gittag=${pkgver}
relmon_id=8421

undead_make() {
    ./autogen.sh --prefix=/usr --with-autoconf-archive
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
